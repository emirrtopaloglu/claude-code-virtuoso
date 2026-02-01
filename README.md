# Claude Code Virtuoso

> **AI-Powered Engineering Team Orchestrator for Claude Code**

Transform Claude Code into a coordinated engineering organization. Virtuoso orchestrates 8 specialized AI agents—Product Managers, Architects, QA Engineers, Security Auditors—all working together under a Tech Lead coordinator. Get persistent memory, cross-agent communication, and production-ready quality gates.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.0-green.svg)](CHANGELOG.md)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-purple.svg)](https://code.claude.com)

---

## 🎯 What Problem Does This Solve?

**Standard Claude Code:** One AI assistant doing everything  
**Claude Code Virtuoso:** A complete engineering team with specialized roles

- ❌ **Problem:** Claude forgets decisions between sessions  
  ✅ **Solution:** ADR-based memory system with automatic context loading

- ❌ **Problem:** No separation of concerns (frontend/backend/QA/security all mixed)  
  ✅ **Solution:** 8 specialized agents, each expert in their domain

- ❌ **Problem:** No quality gates—code ships without testing/security review  
  ✅ **Solution:** Mandatory QA + Security checks before deployment

- ❌ **Problem:** No coordination when multiple areas need changes  
  ✅ **Solution:** Tech Lead orchestrator coordinates multi-agent workflows

---

## ⚡ Core Features

### 🧠 Persistent Memory System

Claude typically forgets decisions between sessions. Virtuoso introduces a file-based memory system:

- **`DECISIONS.md`**: Automatically loaded at every session start. Tracks architectural choices, stack decisions, and product priorities.
- **Impact Tracking**: All decisions tagged with HIGH/MEDIUM/LOW impact and rollback plans.
- **Context Injection**: Hooks automatically feed project context to Claude before it starts working.
- **Decision Templates**: Structured ADR (Architecture Decision Records) templates for major decisions.

### 👥 Coordinated Agent System (v2.0)

Instead of one generic assistant, Virtuoso orchestrates **8 specialized agents** that collaborate:

| Agent | Role | Key Capability |
|:------|:-----|:---------------|
| **@product-manager** | Product Strategy | Interviews you, researches competitors, creates specs |
| **@tech-lead** | **Agent Orchestrator** | Coordinates all agents, resolves conflicts, makes final calls |
| **@backend-architect** | API & Database | Designs endpoints, schemas, notifies frontend of changes |
| **@frontend-architect** | UI/UX & Components | Builds accessible, pixel-perfect interfaces |
| **@mobile-architect** | Mobile Development | Handles React Native, Expo, native modules |
| **@qa-engineer** | Testing & Quality | Writes tests, finds edge cases, **blocks bad deploys** |
| **@security-auditor** | Security | OWASP audits, secret detection, **blocks vulnerabilities** |
| **@monetization-expert** | Revenue Strategy | Pricing models, feature gating, conversion optimization |

**NEW in v2.0:** Agents now delegate tasks to each other and follow collaboration protocols.

### 🛠️ Production-Ready Skills

Custom slash commands to standardize your workflow:

| Skill | Purpose | Required Agents |
|:------|:--------|:----------------|
| **`/bootstrap`** | Initialize new project | `@tech-lead` |
| **`/interview`** | Deep requirements gathering | `@product-manager` (mandatory) |
| **`/step-by-step`** | Safe execution with approval per step | Context-dependent |
| **`/polish`** | Remove AI slop, fix lint errors | None (autonomous) |
| **`/record-decision`** | Save decision to long-term memory | Any agent |
| **`/ship-it`** | Lint → Test → Security → Build → PR | `@qa-engineer`, `@security-auditor` |
| **`/guide`** | Interactive onboarding tutorial | None |

**NEW in v2.0:** Comprehensive error handling, recovery options, and success criteria for every skill.

### 🛡️ Safety & Automation Hooks

**Pre-Tool Use (Guardrails):**
- 🚨 Destructive commands (`rm -rf`, `drop table`) → Ask for confirmation
- 🔐 Sensitive files (`.env`, `secrets.json`) → Warn before editing
- 📦 Package installs (`npm install`, `pip install`) → Confirm dependency addition
- 📋 Dependency files (`package.json`, `requirements.txt`) → Confirm modification

**Post-Tool Use (Automation):**
- ✨ Auto-format with Prettier (JavaScript/TypeScript)
- 🐍 Auto-format with Black (Python)
- ✅ Confirmation messages for package installations

**Session Start:**
- 🧠 Load `DECISIONS.md` automatically
- 📊 Show git status for quick context

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
