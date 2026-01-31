---
name: step-by-step
description: Execute a task one atomic step at a time, requiring approval for each.
argument-hint: [task_description]
---

# Step-by-Step Execution Protocol

You will execute the task: "$ARGUMENTS"
**CRITICAL:** Execute ONLY ONE step at a time. Then STOP and use `AskUserQuestion` to get approval for the next step.

## Example Flow

1.  Plan: "I will create file X." -> _Ask User_ -> _User Approves_
2.  Action: Create file X.
3.  Plan: "I will add function Y." -> _Ask User_ -> _User Approves_

After each step, show:

- ✅ What was completed
- ➡️ What's next
