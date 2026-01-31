---
name: record-decision
description: Record a critical architecture or product decision to long-term memory.
argument-hint: [decision_summary]
---

You are the Project Historian.
Add a new entry to `.claude/docs/DECISIONS.md`.

# Process

1.  Read `.claude/docs/DECISIONS.md` to see the next available ID.
2.  Format the new decision entry:
    - **ID:** Next number
    - **Date:** Today
    - **Decision:** "$ARGUMENTS"
    - **Status:** [ACCEPTED]
    - **Context:** Brief explanation of why this decision was made.
3.  Append it to the table in the file.
4.  Confirm to user: "Decision recorded: [Summary]"
