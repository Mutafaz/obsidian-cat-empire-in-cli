---
type: ui-audit
created: 2026-10-15
status: SUGGESTIONS ONLY - NO UI CHANGED
---

# UI Bugs and Better UI Suggestions

Reviewed the current dark slate/purple/gold UITheme, navigation/modal helpers, controller layout and interaction paths, plus three existing October 15 screenshots. Used the project's Roblox Design Guide and the accessibility/interaction review procedures as reference. The user's documentation-only scope takes precedence over those procedures' requests to apply fixes. No asset/design implementation occurred, so no new asset brief, mockup or fabricated render is supplied.

## QA-014 - Whole-window scaling makes phone controls tiny

**P2 · SOURCE + SIZE CALCULATION.** `UITheme.luau:589` supports reflow, but non-reflow callers shrink the whole authored window. Trade (`TradeController.luau:397`) uses the default with a 780 × 560 panel. At an available safe viewport of 390 × 844:

`scale = min(1, (390-24)/780, (844-24)/560) = 0.4692`

The 48-pixel action becomes **22.5 pixels tall**; the shared 50-pixel close control becomes **23.5 pixels**. Ten-pixel trade card stats become about **4.7 pixels**. At 844 × 390 available landscape bounds, the height constraint gives 0.6536 scale, so a 48-pixel action is about 31.4 pixels tall.

Training's 700 × 430 default-scaled panel similarly reduces a 46-pixel upgrade node to about 24.1 pixels at 390 × 844. Catpedia and other default-scaled windows need the same review. These are calculations using assumed **available** bounds, not measurements on a named physical phone.

**Possible fix:** phone-specific stacked or paged sections with a scrolling body and fixed action/footer area; use reflow to retain readable fonts and minimum 44–48-pixel hit areas. Simply passing `reflow=true` to a controller whose child coordinates are fixed is not a sufficient fix. Rework the child layout as well.

**Acceptance:** 320-, 360-, 390- and 430-pixel available widths; short landscape; long names; populated cards; keyboard/gamepad focus; live rotation. Measure final `AbsoluteSize`, text fit and control overlap, then use actual taps. Preserve a readable desktop layout.

## QA-015 - Fixed-width popups extend beyond narrow screens

**P2 · SOURCE + SIZE CALCULATION.** Trade request and completion frames are both 440 pixels wide (`TradeController.luau:404`, `:431`). Boss results are also 440 pixels wide (`BossController.luau:212`). These frames do not use their own responsive binding; Trade's modal binding applies only to its main trade panel, not its sibling popups.

At 390 pixels available width, a centered 440-pixel frame extends **25 pixels beyond each side**. At 320, it extends 60 pixels per side. Boss's fixed 420-pixel note can also exceed narrow bounds.

**Possible fix:** a reusable responsive popup/result component sized to safe viewport width minus margins, with wrapping or scrolling body and readable full-size actions. Register transient dialogs in the same modal/layering policy as other windows so a result is not hidden behind an open modal.

**Acceptance:** trade invite with long display/username, all four cats on each side, long gift/result text and boss result while another window is open; phone portrait/landscape. Nothing extends outside safe bounds and all decisions remain accessible.

## QA-016 - Pet and station controls are too short for touch

**P2 · SOURCE CONFIRMED.** Pets KEEP/UPGRADE/PRACTICE are 26 pixels tall (`InventoryController.luau:795`, `:807`, `:818`), and each follow-paw is 30 × 30 (`:372`). Station Assign is 34 pixels tall (`StationUIController`, assign button construction). Settings toggles are 30 pixels tall before any window scaling.

The project design guide calls for 44–48 pixels at rendered size. These controls are materially below that target even without shrink-to-fit scaling. The historical desktop Pets screenshot also shows the three detail actions squeezed into a narrow portrait footer.

**Possible fix:** expand hit areas without overlapping neighbors, move detail actions into a stacked action row, or provide one clear primary action and a full-sized details menu. Keep frequent actions such as Follow directly accessible. Give pressed/selected/disabled/focus states distinct text/icons.

**Acceptance:** verify final hit areas at every layout branch, touch near edges, ensure pressing Follow does not select/merge the card, and confirm gamepad focus order. Test busy/disabled states too.

## QA-018 - Station assignment has silent failure paths

**P2 · SOURCE CONFIRMED.** Assign/unassign at `StationUIController.luau:295` and `:331` invokes the server directly without `pcall`. It refreshes on success only and ignores the server's refusal message. There is no request-busy guard or visible failure feedback in these callbacks.

**Possible fix:** reuse a protected request helper, visibly mark the pending action, prevent overlapping submissions and show the actual server refusal near the selected station. On transport failure, retain selection and offer retry. Update only affected cards so the response does not rebuild the button under the user's next tap.

**Acceptance:** rejected/slow/error responses, quick repeated taps, switching stations while a request is pending and disappearance of the chosen cat. The UI always settles into a truthful state and permits a retry.

## Suggested improvements by screen

| Screen | Suggested change | Why / acceptance |
|---|---|---|
| HUD/navigation | Keep icon + label; visibly mark current destination; allow less dominant menu/header chrome during combat | A player's HP, currencies and next action should remain easy to find without eight competing visual accents |
| Pets | Distinguish inventory item count, species discovered and follower slot count; replace decorative locked slots with an explanation | Current lock placeholders imply a capacity-unlock mechanic that is not implemented here |
| Pets | Rename “Equip Best” to “Follow best,” show selection metric and separate Follow from battle-team selection | Follower appearance, workers and battle team are different assignments |
| Pets/merge | Show target → result, consumed cat, Keep status and retained training; make the selected pair unambiguous | Prevent accidental consumption and explain why a cat cannot merge |
| Pets large inventory | Add useful sort/filter options and preserve search, scroll and selection after mutation | Verify with 100+ cats; avoid regenerating every portrait on every keystroke |
| Upgrade map | Keep readable base → upgraded stats; show next cost, affordability and maxed state; add a return-to-selected-pet action | Upgrading should feel connected to the cat the player selected, including on phones |
| Explore | Put selected world, lock cost, current location, team and one primary travel/fight action together | Reduce scanning across worlds, team overlays and separate windows |
| Party | Show exact per-member ready/unlocked/travel-failed reasons and leader control | GO ANYWAY should show who will actually travel, not just that someone is still choosing |
| PvE combat | Keep HP/PP and element text fixed; group moves with effect descriptions; display complete rewards including yarn | Decisions and outcomes stay readable while the log grows |
| PvP | Clear empty-server state with practice shortcut; show waiting/opponent choosing, timeout and forfeit outcome | Friendly matches currently depend on another available trainer |
| Trading | Large phone cards, permanent “You give / You receive” summary, full identity, training and provenance, explicit gift warning | A cramped review screen makes valuable-item confirmation harder to understand |
| Shop | Keep genuine odds; show balance, exact shortage, rarity guarantee and pinned-species chance; retain choice on error | Buying should have one clear price/result and an understandable refusal |
| Catpedia | Separate “ever discovered” from “owned now”; show why bonus is active/inactive and where to find the pin | Rewards/discovery and current passive bonus use different rules |
| Login Rewards | Explain elapsed 24-hour timing, next claim countdown and cycle reset; claim/result state should survive refresh | No ambiguity between a streak, a calendar day and a repeating reward track |
| Rebirth | Plain before/after summary of coins, stations, cats, worlds, training and yarn multiplier | Reset scope is consequential; clarify spendable-versus-lifetime yarn policy first |
| Settings | Save music/SFX/detail preferences; optionally separate reduced UI motion from world detail | Current toggles are local session state; make next-session behavior explicit |
| Owner Panel | Strong separation of test grants and moderation; show pending/success/failure and searchable audit history | Do not let success animation imply durable save completion |
| Leaderboards | Loading/empty/error/stale-cache states, current category and last update time; explain top-50-only personal rank | “Not on this board” is misleading when a player exists below rank 50 |
| Boss | Fit banners/results inside safe bounds; show contribution conditions, countdown and a clear re-entry button | Event status should be usable without covering combat or native controls |
| Station manager | Show actual base rate, current worker multiplier, projected change and assignment reason | Connect the action to actual passive income rather than a pet's hypothetical yield |

## Sequential design review notes

1. **Accessibility:** fix rendered touch sizes first; verify long text/contrast in actual states; pair rarity/type/ready colors with labels; support keyboard/gamepad navigation and modal focus restoration. No complete contrast or focus audit was run, so no WCAG-compliance claim is made.
2. **Hierarchy and rhythm:** preserve the user's chosen playful theme. Reduce repeated outlines/stripes where they compete with item identity or combat state. Use compact panels for small decisions and reserve large windows for dense content.
3. **Interaction states:** consistent loading, disabled reason, refusal, retry and confirmed result. Existing `_busy` guards help but need visible feedback. Handle late/out-of-order responses and a modal being closed while a request runs.
4. **Motion:** Low Detail already calls `UITheme.setMotion`; retain that benefit. Gacha uses direct tweens outside that helper and should offer a short/reduced-motion reveal. This is an improvement suggestion, not a claim that motion currently crashes.

## Existing visual evidence reviewed

These are **historical screenshots**, not new phone tests. The trade screenshot is a rendered layout using **mock trade data**, not proof of a real transaction. Later code changes may postdate a particular capture.

![[Assets/Previews/PETS/2026-10-15-r4-keep-upgrade-practice.png|720]]
October 15 desktop Pets preview: visually dense detail actions and decorative locked inventory/follower slots.

![[Assets/Previews/EXPLORE-BATTLE/2026-10-15-r5-fight-boost-picker.png|720]]
October 15 desktop boost picker: clear choices but considerable unused vertical space.

![[Assets/Previews/TRADING/2026-10-15-r1-window-confirm-MOCK.png|720]]
October 15 trade confirmation **MOCK** preview. Use current source when judging latest card text; no real two-player trade is established by this image.

References read locally: `design/Roblox Design Guide.md`, `design/reference/claude-design-system-prompt/skills/accessibility-audit.md`, and `interaction-states-pass.md`. Recommendations are adapted to Roblox GUI rather than web markup.
