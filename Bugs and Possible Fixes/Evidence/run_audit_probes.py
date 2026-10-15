"""Read-only game audit: run current source in existing offline mocks, then probe defects.

No game scripts are edited. Existing validate_core.py regenerates ignored .tools
harnesses; this runner uses a temporary file and writes its report beside itself.
These probes assert the observed BUGGY behavior, not desired regression behavior.
"""
from pathlib import Path
import subprocess
import sys
import tempfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]

def main():
    baseline = subprocess.run([sys.executable, str(ROOT / 'tools/validate_core.py')],
                              cwd=ROOT, capture_output=True, text=True, encoding='utf-8', errors='replace')
    if baseline.returncode:
        print(baseline.stdout + baseline.stderr)
        return baseline.returncode
    source = (ROOT / '.tools/core_harness.luau').read_text(encoding='utf-8')
    probes = (HERE / 'audit_probes.luau').read_text(encoding='utf-8')
    with tempfile.TemporaryDirectory(prefix='cat-empire-audit-') as temporary:
        harness = Path(temporary) / 'audit.luau'
        harness.write_text(source + '\n' + probes, encoding='utf-8')
        result = subprocess.run([str(ROOT / '.tools/luau/luau.exe'), str(harness)], cwd=ROOT,
                                capture_output=True, text=True, encoding='utf-8', errors='replace')
    lines = [line for line in result.stdout.splitlines() if line.startswith(('AUDIT:', 'PASS:'))]
    report = '\n'.join(lines) + '\n' + result.stderr
    (HERE / 'probe-results.txt').write_text(report, encoding='utf-8')
    print(report)
    return result.returncode

if __name__ == '__main__':
    sys.exit(main())
