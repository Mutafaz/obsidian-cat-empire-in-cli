# UI navigation revision — 2026-10-12

## Original request
> do more improvements as there are glitches in some areas also make it so they can go back to guide. Also UI should be like one of those from popular roblox games not AI generates

Clarification: worst glitches are in map or movement. Cat art redesign remains deferred.

## Verified context
Native Roblox procedural UI; shared UITheme; four guide steps with server-owned completion and one-time reward. Current theme multiplies dark backgrounds with dark gradients. Multiple independent modal windows can overlap. Skipped guide currently replaces all instructions with generic text. Twelve unrotated plots surround radial roads; inspect collision at road endpoints.

## Expanded implementation brief
Goal: familiar simulator menu conventions and reliable guide access, preserving gameplay and current cat art. Use readable blue panels, white text, rounded outlined controls, green primary action and a red close control. Keep one shared modal open at a time. Guide must offer Previous/Next across all four instructions, including after skip/completion; browsing never changes reward state. Keep a permanent Guide entry. New controls use at least 48-pixel targets and fit portrait and desktop safe areas. Fix confirmed movement blockers with narrow changes that preserve walls elsewhere.

Reference: local Roblox Design Guide and interaction-states-pass; Roblox Creator Hub UI/UX guidance (https://create.roblox.com/docs/production/game-design/ui-ux-design), including familiar close controls and distinct button states. Assumption: general simulator conventions, no copying a specific game's branded artwork.

Deliverables: source changes; live Studio collision and menu checks; offline regressions; real desktop/phone screenshots below. No fabricated screenshot or broad claim that every game glitch is fixed.

## Verification
Implemented and verified in solo Studio. Shared panel gradients now use white base tint; repeated styling does not stack gradients. Shared modals close the previously open modal. Guide preserves individual pages after skip and completion, with Previous/Next and permanent Guide entry; no reward state is reset by browsing.

![[Assets/Previews/UI-NAV/desktop-r1-2026-10-12.jpg|480]]
2026-10-12 r1 desktop, actual Studio Play. Sources: TutorialController, UITheme. First-page disabled state, green primary control and red close control.

![[Assets/Previews/REALMS-BATTLES/guide-review-phone-r1-2026-10-12.jpg|320]]
2026-10-12 r1 phone portrait. Actual skipped-guide review, page 2, after desktop clicks on Skip → Guide → Next. Guide is 377×440; Previous/Next are 164.5×48. Reward marker stayed false. Mobile touch not independently verified.

Movement diagnosis: nine radial roads met solid walls. TycoonService now cuts a 16-stud opening at each affected road intersection. Twelve collision rays clear; server-owned Humanoid walk crossed the repaired first entrance from X=238 to X=271 without jumping. Prior client-owned automation did not move reliably; that failed automation is not evidence of a remaining wall collision. Automatic ownership restored.
