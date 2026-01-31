# Claude Code Virtuoso

**An enterprise-grade operating system for Claude Code.**

Virtuoso converts the standard Claude Code CLI into a fully managed, context-aware engineering team. It enforces architectural discipline, maintains long-term project memory, and automates quality control—allowing you to focus on high-level strategy while AI handles the execution.

> **Philosophy:** User Authority is absolute. Context is persistent. Quality is automated.

## ⚡ Features

### 🧠 Persistent Memory System

Claude usually forgets decisions between sessions. Virtuoso introduces a file-based memory system:

- **`DECISIONS.md`**: Automatically loaded at every session start. Tracks architectural choices and stack decisions.
- **Context Injection**: Hooks automatically feed project context to Claude before it starts working.

### 👥 Specialized Sub-Agents

Instead of one generic assistant, Virtuoso delegates tasks to specialized personas:

- **Product Manager**: Converts raw ideas into structured PRDs.
- **Tech Lead**: Enforces architectural consistency and stack decisions.
- **Architects (Front/Back/Mobile)**: Domain-specific experts who don't touch code outside their scope.
- **QA Engineer**: Writes comprehensive tests and hunts for edge cases.

### 🛠️ High-Velocity Skills

Custom slash commands to standardize your workflow:

- `/interview`: Deep-dive requirements gathering before a single line of code is written.
- `/step-by-step`: Safe execution mode requiring user approval for every atomic action.
- `/polish`: Autonomous cleanup agent that removes logs, lint errors, and "AI slop".
- `/ship-it`: Prepares the branch for production (Lint -> Test -> Build -> PR).

### 🛡️ Safety & Automation Hooks

- **Guardrails**: Blocks destructive commands (`rm -rf`, `drop table`) and `.env` edits without explicit confirmation.
- **Auto-Formatting**: Automatically runs Prettier/Linters on modified files in the background.

---

## 🚀 Quick Start

### Option 1: Copy to New Project (Recommended)

1.  Clone this repository to your local machine:

    ```bash
    git clone https://github.com/emirrtopaloglu/claude-code-virtuoso.git ~/claude-code-virtuoso
    ```

2.  Navigate to your **new project** directory:

    ```bash
    mkdir my-new-project && cd my-new-project
    ```

3.  Copy the Virtuoso configuration:

    ```bash
    cp -r ~/claude-code-virtuoso/.claude .
    ```

4.  Initialize Claude Code:

    ```bash
    claude
    ```

5.  Run the guide to verify installation:
    ```
    > /guide
    ```

---

## 📂 Directory Structure

Virtuoso organizes Claude Code's configuration into a scalable structure:

```text
.claude/
├── CLAUDE.md            # The Constitution & Authority Protocol
├── settings.json        # Hooks & Permission configurations
├── docs/
│   ├── DECISIONS.md     # Architecture Decision Records (ADR)
│   └── MANUAL.md        # Interactive User Guide
├── agents/              # Specialized Sub-agents
│   ├── tech-lead.md
│   ├── product-manager.md
│   ├── frontend-architect.md
│   └── ...
└── skills/              # Executable Slash Commands
    ├── bootstrap.md
    ├── interview.md
    ├── polish.md
    └── ...
```

---

## workflow The Virtuoso Workflow

Virtuoso is designed for a **Strategy -> Execution -> Polish** loop.

### 1. Strategy & Definition

Don't start coding immediately. Define _what_ you are building.

```
> /interview "I want to build a real-time dashboard"
```

### 2. Architecture & Setup

Decide on the stack and record it to memory.

```
> /bootstrap
> /record-decision "We are using Next.js 14 and Supabase"
```

### 3. Execution

Build features using the appropriate architect or safety mode.

```
> Use frontend-architect to build the Hero Component
> /step-by-step "Implement the Auth flow"
```

### 4. Quality Control

Never merge dirty code.

```
> /polish
```

### 5. Deployment

Verify and ship.

```
> /ship-it
```

---

## 🔧 Customization

To adapt Virtuoso to your specific tech stack:

1.  **Edit `.claude/CLAUDE.md`**: Update the `TECH STACK` section with your preferred frameworks (e.g., React, Python, AWS).
2.  **Update Agents**: If you don't do mobile development, you can remove `.claude/agents/mobile-architect.md`.

## 📄 License

MIT License. Feel free to use this in your commercial or open-source projects.
