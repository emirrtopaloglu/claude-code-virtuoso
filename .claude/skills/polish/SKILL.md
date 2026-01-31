---
name: polish
description: Remove AI slop, comments, and lint errors from the current branch.
disable-model-invocation: true
---

# Polish Protocol

Remove AI slop and lint errors from the current branch.
**Autonomous Mode: No confirmation required for cleanup tasks.**

## Critical Rules

1.  **ONLY remove slop:** No refactoring logic, only cleanup.
2.  **ONLY fix lint/type errors:** Do not change style preferences.
3.  **NEVER change logic:** If a "better" way exists, ignore it. Only fix broken things.
4.  **NEVER touch unrelated code:** Only files in `git diff main...HEAD`.

## Slop Reference (Delete these)

- "Here is the logic" comments
- `as any` type bypasses (unless absolutely necessary)
- Excessive `console.log` (unless for intentional logging)
- Dead code / Unused imports

## Workflow

1.  Identify changed files using `git diff`.
2.  Process files in groups.
3.  Run project linter/type-checker. Fix errors.
4.  Report summary: "Polished X files. Branch is clean."
