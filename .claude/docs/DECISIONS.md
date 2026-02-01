# ARCHITECTURE DECISION RECORDS (ADR)

This file tracks all critical decisions made for the project.
Claude MUST read this file at the start of every session to maintain context continuity.

## Status Types

- **[PROPOSED]** - Under discussion, not yet implemented
- **[ACCEPTED]** - Creating code based on this decision
- **[DEPRECATED]** - No longer in use, superseded by newer decision
- **[SUPERSEDED]** - Replaced by another decision (link to new ADR)

## Impact Levels

- **HIGH** - Affects multiple systems, difficult to reverse
- **MEDIUM** - Affects single system, moderate effort to reverse
- **LOW** - Localized change, easy to reverse

## Decision Log

| ID  | Date       | Area | Decision | Status | Impact | Context/Reasoning | Related |
| :-- | :--------- | :--- | :------- | :----- | :----- | :---------------- | :------ |

<!-- New decisions will be appended here by the /record-decision skill -->

---

## Rollback Plans

<!-- Add rollback plans for HIGH impact decisions here -->

---

## Decision Templates

Use `.claude/templates/ADR-TEMPLATE.md` for detailed architectural decisions.
For quick decisions, add directly to the table above using `/record-decision`.

---

## Review Schedule

- **Weekly:** Review PROPOSED decisions
- **Monthly:** Check for DEPRECATED decisions that can be removed
- **Quarterly:** Audit HIGH impact decisions for effectiveness
