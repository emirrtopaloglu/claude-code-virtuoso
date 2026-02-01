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

| ID  | Date       | Area         | Decision                | Status       | Impact | Context/Reasoning                          | Related |
| :-- | :--------- | :----------- | :---------------------- | :----------- | :----- | :----------------------------------------- | :------ |
| 000 | 2026-02-01 | Meta         | Init Project            | [ACCEPTED]   | LOW    | Initialized the Vibe Coding OS.            | -       |
| 001 | 2026-02-01 | Architecture | Enhanced Agent System   | [ACCEPTED]   | HIGH   | Added agent coordination and skill linking | -       |
| 002 | 2026-02-01 | Architecture | Improved Error Handling | [ACCEPTED]   | MEDIUM | Added comprehensive error handling to all skills | ADR-001 |

<!-- New decisions will be appended here by the /record-decision skill -->

---

## Rollback Plans

### ADR-001: Enhanced Agent System
**How to Rollback:**
1. Restore previous agent files from git: `git checkout HEAD~3 .claude/agents/`
2. Remove agent coordination sections
3. Update MANUAL.md to remove agent references

**Estimated Effort:** 30 minutes  
**Risk:** LOW (agents can work independently)

### ADR-002: Improved Error Handling
**How to Rollback:**
1. Restore previous skill files from git: `git checkout HEAD~2 .claude/skills/`
2. Test basic functionality

**Estimated Effort:** 15 minutes  
**Risk:** LOW (error handling is additive)

---

## Decision Templates

Use `.claude/templates/ADR-TEMPLATE.md` for detailed architectural decisions.
For quick decisions, add directly to the table above using `/record-decision`.

---

## Review Schedule

- **Weekly:** Review PROPOSED decisions
- **Monthly:** Check for DEPRECATED decisions that can be removed
- **Quarterly:** Audit HIGH impact decisions for effectiveness
