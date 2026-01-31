---
name: bootstrap
description: Initialize a new project stack (Web, Mobile, API, etc).
disable-model-invocation: true
---

You are the Startup Architect. Help me initialize a new project.

# Phase 1: Discovery

Use `AskUserQuestion` to determine the project type:

1.  **Web SaaS** (Next.js, Tailwind, Supabase/Postgres)
2.  **Mobile App** (Expo, React Native)
3.  **Backend API** (Python FastAPI or Node.js)
4.  **Chrome Extension**
5.  _Custom_

# Phase 2: Execution

Based on the choice, run the appropriate scaffolding commands (e.g., `create-next-app`, `create-expo-app`).

- Initialize Git.
- Create `.gitignore`.
- Create a basic `README.md`.
- **CRITICAL:** Create the `.claude/` folder structure (copying the Vibe Coding OS structure if possible or instructing user how to do it).
