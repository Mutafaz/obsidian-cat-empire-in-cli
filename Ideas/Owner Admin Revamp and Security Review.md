---
type: ideas
title: Owner Admin Revamp and Security Review
created: 2026-10-13
last_updated: 2026-10-13
status: PROPOSED
tags:
  - ideas
  - admin
  - security-review
  - mockup-prompt
---

# Owner Admin Revamp and Security Review

Linked from [[Chat Ideas]]. This is a menu/design proposal and a bookmark for future security work. No admin controls, permissions, game code, or Studio state were changed for this note. A visual mockup is not proof of secure authorization.

## Original request

> Also generate the list of around a 1000 different types of cats maybe like 5 or 6 rarities that can either be bought based and gotten based on carrier or merge to get them either is possible my two special cats (ivy, and melman and julian duo ) are in a type and raritiy of their own, the owner and admin controls will just have to be revamped (also add a thing to go back to to make sure we can keep it secure) making the menu look better so write a prompt for that to make a mockup of

The exact original spacing in the full user message is preserved in [[Chat Ideas]].

## Verified context for the proposal

Read on 2026-10-13: [[Systems/Owner Panel]], [[Technical/Security]], `src/server/Modules/AdminConfig.luau`, `src/server/Services/AdminService.luau`, `src/client/Controllers/AdminController.luau`, and `src/server/Modules/RequestGuard.luau`. Inspected the saved owner-panel preview below. No new live Studio session or runtime test was performed.

- The existing client has Cats, Rewards, Events, and Moderation tabs, a player list, and an activity log.
- The current authorization is Owner-only. A separate Admin role does not exist in the inspected source.
- Server configuration recognizes explicitly listed UserIds, the user-owned place creator, and Studio testers under its Studio-only rule. The explicit owner list is empty in the inspected file.
- The server checks authorization for requests, has bounded action inputs and per-action request spacing, filters announcements, and logs successful/refused mutations in memory.
- Current actions include cat/currency grants, parade start/end, announcements, kick, ban, and unban. Most mutations target players in the current server; the ban/unban calls explicitly affect the game universe.
- The current cat picker lists the existing small catalog as individual buttons. It does not contain the new 1,000-entry concept catalog.
- Logs are memory-only; a server closing loses that history. Persistent logs, separate Admin permissions, expanded catalog operations, carrier tools, and boss controls must not be portrayed as already implemented.

![[Assets/Previews/OWNER-PANEL/r1-cats-studio.png|800]]

*Existing revision 1 Studio capture saved by the build workflow on 2026-10-13. Inspected as a historical layout reference: left player list, center actions, right log, dense cat-name buttons. Not a new revamp preview or current runtime verification.*

## Expanded menu brief

**Goal:** Make owner/admin actions easier to find and review, especially with a large cat catalog, while retaining visible target, scope, limits, and action history.

**Visual direction:** Keep the supplied rewards UI's playful purple/gold striped header, dark inset surfaces, readable rounded outlined titles, and glossy action buttons. Use a restrained professional layout inside that game style. Prioritize selection and confirmation over decoration.

**Proposed structure:**

- Header: **OWNER / ADMIN PANEL**, role badge, close button, and environment label (**Test Server** or **Live Server**).
- Left navigation: **Cats**, **Rewards**, **Events**, **Moderation**, **Activity Log**, **Security Review**.
- Sticky target strip: player DisplayName, @Username, UserId, and the actual scope of the selected action. Never use a single vague global scope label for actions that differ.
- Searchable player selector with a compact selected-player summary. Keep it separate from cat search.
- Main workspace: the selected tab's form and result preview.
- Recent action drawer: last few actions, success/refused/failed status, and a link to the full log page. A durable log is a future requirement, not assumed to exist.
- Footer: a readable message after an action, including failure; never show success only because an animation played.

For phone portrait, move navigation to a compact tab selector and show one task at a time. Use a collapsible player selector, full-width confirmation, and a separate log page rather than shrinking three desktop columns into illegible strips. Keep final rendered touch targets about 44-48 pixels and allow scrolling.

### Cats tab for the large catalog

Use [[Cat Catalog - 1000 Concepts]] as design content, not a runtime source. Replace a thousand name buttons with:

- Search by name or concept ID.
- Rarity and family/type filters, plus power sorting.
- A paged/scrolling card grid showing a portrait, name, rarity, type, and power. Load only the visible page when implemented later.
- Separate special filters for **IVY Special** and **Bonded Duo Special**, outside the six ordinary rarities.
- One Melman & Julian card with both cats; one grant creates one collection/team entry.
- A selected-cat preview, quantity/level choices within the configured permissions, and a grant review summary showing recipient, result, and scope.

Suggested visual example: **20 results per page; 50 pages** for the 1,000 concept entries. Search/filter results naturally change that count. This is a paging proposal, not an existing inventory limit.

### Owner versus Admin

Proposed role split: Owner retains control within configured limits. Admin receives only explicitly delegated action permissions; no access is implied by a role label on the client. Special-cat grants and permission changes remain Owner-only by default. Ordinary players receive no privileged action access.

Do not silently convert the current Owner-only code into broad Admin access. The future implementation must specify who can use each action, maximum quantities/durations, and allowed scope. UserIds, not DisplayNames, identify accounts.

### Review and action states

Before a grant or moderation mutation, display a review with **who**, **what**, **quantity/duration**, and **scope**. Editing these values invalidates the old review. Display available, selected, disabled-with-reason, submitting, completed, and failed states. Disable resubmission while a request is pending. A display cooldown alone is not durable duplicate protection.

Use green for benign grants, a clearly labeled red action for moderation, and descriptive button text such as **Review Grant** and **Confirm Ban**. Keep the review as an alternate modal state, not multiple competing action buttons.

Boss-event and carrier controls are future concepts. If shown in a later mockup, label them **Planned** and disable them until their systems exist. Do not turn this UI refresh into unrequested new admin powers.

## Security Review — return-to checkpoint

**Review status for this revamp: NOT RUN.** Source reading and design review occurred; they are not a runtime security assessment. Retain this note as the place to revisit before implementing or releasing any menu/privilege change.

Suggested menu page: show the last completed review date, the changes since that review, and a checklist with **Not reviewed / Passed with evidence / Failed / Not applicable**. Until evidence exists, show **Not reviewed**, not a green “Secure” badge. This page records a review; it does not automatically certify the game or grant permissions.

### Check before each future privilege/system change

- [ ] **SEC-01 — Identity:** Verify authorized UserIds, user-owned versus group-owned place behavior, Studio-only tester rules, and that no client parameter can enable Studio/Owner/Admin status.
- [ ] **SEC-02 — Permissions:** Define server-side allowed actions, targets, scope, and limits for each role. Verify ordinary players cannot invoke a privileged action directly even if they recreate the button or remote request.
- [ ] **SEC-03 — Input checks:** Reject unknown actions/cat IDs, invalid UserIds, malformed payloads, text in numeric fields, zero/negative/out-of-range values, fractions, NaN, and infinity where whole quantities are required.
- [ ] **SEC-04 — Request budgets:** Test per-action and aggregate limits, including spam that alternates action names. A single action cooldown is not an overall request budget.
- [ ] **SEC-05 — Duplicate execution:** Use identified operations and prove a repeated, delayed, concurrent, or retried grant cannot grant twice. UI loading states and short cooldowns are not sufficient evidence.
- [ ] **SEC-06 — Data safety:** Test loaded/failed/leased profiles, player departure, save failure, and server shutdown. Commit related ownership/currency changes together; report the outcome accurately. Do not save defaults over a failed load.
- [ ] **SEC-07 — Catalog and special cats:** Validate stable catalog IDs, single-slot duo handling, allowed grant limits, and Owner-only special grants. Keep proposed concept IDs separate from existing saved species IDs until a migration is explicitly designed.
- [ ] **SEC-08 — Trading/merging when built:** Reserve inventory instances against simultaneous grant/use/trade/merge requests; recheck ownership and favorite/assignment state; consume inputs and grant outputs together; protect both special entries. Test disconnection and retries.
- [ ] **SEC-09 — Boss prizes when built:** Check encounter/slot identity, eligibility, reward amounts, reconnect/server-hop duplication, and overkill damage. Treat client-submitted damage or a visible Claim button as untrusted.
- [ ] **SEC-10 — Moderation and broadcasts:** Preserve target/self/owner restrictions, explicit universe scope for bans, bounded durations, and text filtering. Verify filtering failure sends nothing and moderation API failure is not presented as success.
- [ ] **SEC-11 — Audit records:** Persist actor/target UserIds, operation identity, action, parameters, scope, timestamp, and result for important mutations. Preserve refused attempts with bounded logging; keep privileged log access restricted.
- [ ] **SEC-12 — Competitive provenance:** Mark admin/test grants and test events so they cannot silently inflate power, collection, coins-earned, and boss leaderboards. Test provenance through trades and merges; renaming/transferring must not erase it.
- [ ] **SEC-13 — Real role tests:** Use at least two players with distinct permissions. Test Owner, delegated Admin if introduced, and ordinary account behavior outside Studio. Keep solo mocks, live authorization, persistence, and actual moderation tests separate.
- [ ] **SEC-14 — UI review:** Verify displayed target/scope equals the request executed, changes invalidate confirmation, unavailable actions explain why, and phone/gamepad controls cannot activate destructive actions by accidental focus.

### Evidence record template

Copy this record for each actual review; preserve previous records:

```text
Review date:
Source revision / exact changed files:
Reviewer:
Changed actions and permissions:
Accounts / roles used:
Environment: offline mock / Studio / private live test
Checks performed (SEC IDs):
Evidence links / logs:
Passed:
Failed:
Not run / not applicable and why:
Required fixes:
Retest evidence:
Release readiness for this change only:
```

Reference implementations for a future review: `AdminConfig.luau`, `AdminService.luau`, `AdminController.luau`, `RequestGuard.luau`, and the data/transaction paths in [[Systems/Player Data]]. [[Systems/Owner Panel]] contains earlier verification records and limitations; do not treat those as tests of this unbuilt revamp.

## Copyable mockup prompt

```text
Create a polished concept mockup for a revamped OWNER / ADMIN PANEL in Cat Empire, a Roblox cat-collection game. This is a future design reference, not a screenshot of implemented controls or proof of security. Use the attached daily-rewards reference and existing owner-panel screenshot for style/context: purple-and-gold striped header, dark rounded navy panels, thick readable outlined titles, tasteful gold highlights, colorful cat portraits, and glossy action buttons. Improve hierarchy and spacing rather than adding unrelated powers.

Deliver one landscape desktop mockup with a smaller phone-portrait adaptation and one clearly separated confirmation inset. Header: OWNER / ADMIN PANEL; role badge Owner; environment Test Server; large Close button. Left navigation: Cats, Rewards, Events, Moderation, Activity Log, Security Review. Select Cats. Use a sticky recipient strip showing @SelectedPlayer and an illustrative UserId. Show Scope: Selected player — this server.

The center contains a SEARCHABLE CAT CATALOG, not a wall of tiny buttons. Search field: Search name or ID. Ordinary rarity filters: Common, Uncommon, Rare, Epic, Legendary, Mythic. Separate special filters: IVY Special and Bonded Duo Special. Add a family/type filter and Power sort. Show a spacious cat-card grid with portraits, names, rarity, family/type, and proposed power. Example cards: Ginger Domestic Shorthair — Common — 100; Tuxedo Domestic Shorthair — Uncommon — 400; IVY — IVY Calico — IVY Special — 30,000; Melman & Julian — Melman & Julian Duo — Bonded Duo Special — 25,000. IVY is the rarest and strongest; the duo is one card and one team slot. Use labeled portrait placeholders for the named cats unless real owner-supplied photos are attached.

Show 1,000 collection entries, 20 results per page, Page 1 of 50. Include a selected-cat preview and bounded quantity/level form with a green Review Grant button. On the right use a compact recent-action drawer, with timestamps, recipient, and Success / Refused / Failed labels, plus View Activity Log. Use sample logs clearly labeled as examples.

The confirmation inset shows the selected recipient, cat, quantity, level, and scope with Cancel and Confirm Grant. Treat it as an alternate state. The phone view uses one column, a collapsible recipient selector, large controls, and a separate log page rather than shrinking three columns.

Add a small Security Review inset with Status: Not reviewed, Last completed review: None, and unchecked rows for Permissions, Input validation, Duplicate grants, Data saves, Trading/merging, Boss prizes, and Audit logs. It is a review record, not a fake Scan Secure button. Do not show a green security certificate or imply hiding the menu protects access. Separate owner/admin permissions are enforced by the eventual server, not by the artwork.

All values are illustrative. Do not add delete-all-data controls, arbitrary script execution, role-grant shortcuts, or unrequested global economy actions. Keep unavailable future boss/carrier tools labeled Planned if shown. Preserve selected, disabled, loading, success, and error states with readable text/icons and touch-friendly spacing. Add a small Concept Mockup caption.
```

## Deliverables and acceptance checks

- The prompt presents a clearer owner/admin menu with recipient/scope visibility, large-catalog search, and a review step.
- The six ordinary rarity filters remain separate from both unique special rarities/types.
- The duo occupies one card/slot, and IVY remains strongest/rarest.
- The Security Review checkpoint is saved and linked for future revisits, with an honest NOT RUN status and evidence template.
- Existing functionality is described from inspected source; proposals are distinguished from implementation.
- No new mockup or Studio render was requested/generated here. When an actual visual revision is later authorized, save and caption its preview under `Assets/Previews/` and preserve the historical revision 1 capture.
- No claim that the current or future admin system is fully secure is made from a mockup, source reading, or this checklist.
