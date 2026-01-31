---
name: ship-it
description: Prepare current branch for production deployment (Test, Lint, Build, PR).
disable-model-invocation: true
---

# Ship It Workflow

Execute this sequence to get code ready for production. Stop if ANY step fails.

1.  **Lint & Type Check:** Run the project's lint/type commands. Fix auto-fixable errors.
2.  **Unit Tests:** Run tests related to the changed files.
3.  **Build Check:** Run a build command (e.g., `npm run build`) to ensure compilation.
4.  **Summary:** Create a concise summary of changes.
5.  **PR Creation:** Create a Pull Request using `gh pr create` with the summary.

Tell me "Ready to merge!" when done.
