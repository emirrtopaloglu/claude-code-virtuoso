# Architecture Decision Records (ADRs)

This directory stores detailed Architecture Decision Records.

## Purpose

ADRs provide a comprehensive history of significant architectural decisions, including:
- Context and background
- Considered alternatives
- Rationale for the decision
- Consequences and implications

## vs DECISIONS.md

| Document | Purpose | Granularity |
|:---------|:--------|:-----------|
| **DECISIONS.md** | Quick reference summary | High-level overview |
| **decisions/*.md** | Detailed analysis | In-depth documentation |

## Template

When creating a detailed ADR, use the template from `.claude/templates/ADR-TEMPLATE.md`:

```markdown
# ADR-[ID]: [Decision Title]

## Status
[PROPOSED | ACCEPTED | DEPRECATED | SUPERSEDED]

## Context
[What is the issue we're facing?]
[What are the driving forces?]

## Decision
[What did we decide?]

## Alternatives Considered
### Option 1: [Name]
- Pros: [...]
- Cons: [...]
- Rationale for rejection: [...]

### Option 2: [Name]
- Pros: [...]
- Cons: [...]

## Consequences
- Positive: [...]
- Negative: [...]
- Neutral: [...]

## Related Decisions
- [ADR-XXX]
- [ADR-YYY]

## References
- [Links to external resources]
```

## Usage

1. Create detailed ADR for major architectural decisions
2. Update DECISIONS.md with summary entry
3. Reference ADR file in DECISIONS.md
4. Review and update ADRs when implementation reveals new information

## Example

```
decisions/
├── 001-use-nextjs.md
├── 002-postgresql-for-acid.md
└── 003-tailwind-css.md
```

Corresponding entries in `../DECISIONS.md`:
```markdown
| ID  | Date       | Area      | Decision              | Status     |
|-----|------------|-----------|-----------------------|------------|
| 001  | 2026-02-01 | Framework | Use Next.js 14        | [ACCEPTED] | → [details](decisions/001-use-nextjs.md)
```
