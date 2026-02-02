# Claude Code Virtuoso

> **AI-Powered Engineering Team Orchestrator for Claude Code**

Transform Claude Code into a coordinated engineering organization. Virtuoso orchestrates 8 specialized AI agents—Product Managers, Architects, QA Engineers, Security Auditors—all working together under a Tech Lead coordinator.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.0-green.svg)](CHANGELOG.md)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-purple.svg)](https://claude.ai)
[![Skills](https://img.shields.io/badge/skills-10-orange.svg)](#-available-skills)
[![Agents](https://img.shields.io/badge/agents-8-blue.svg)](#-agent-team)

---

## 🎯 What Problem Does This Solve?

| Standard Claude Code | Claude Code Virtuoso |
|:---------------------|:---------------------|
| ❌ Forgets decisions between sessions | ✅ ADR-based memory system with auto-loading |
| ❌ One AI doing everything | ✅ 8 specialized agents for each domain |
| ❌ No quality gates | ✅ Mandatory QA + Security before deployment |
| ❌ No coordination | ✅ Tech Lead orchestrates multi-agent workflows |

---

## 🚀 Quick Install

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/emirrtopaloglu/claude-code-virtuoso/main/install.sh | bash
```

### Manual Install

```bash
# Clone the repository
git clone https://github.com/emirrtopaloglu/claude-code-virtuoso.git

# Go to your project
cd your-project

# Copy Virtuoso configuration
cp -r ~/claude-code-virtuoso/.claude .
cp ~/claude-code-virtuoso/CLAUDE.md .

# Start Claude Code
claude
```

### Install Script Options

```bash
# Download the install script
curl -O https://raw.githubusercontent.com/emirrtopaloglu/claude-code-virtuoso/main/install.sh
chmod +x install.sh

# Install in current directory
./install.sh

# Install in a specific project
./install.sh ~/my-project

# Clone globally for reuse
./install.sh --global
```

---

## 📦 What Gets Installed

```
your-project/
├── CLAUDE.md                    # Main orchestration system (auto-loaded)
├── HOOKS.md                     # Hooks system documentation
└── .claude/
    ├── settings.json            # Hooks & safety configuration
    ├── agents/                  # 8 specialized AI agents
    │   ├── tech-lead.md
    │   ├── product-manager.md
    │   ├── backend-architect.md
    │   ├── frontend-architect.md
    │   ├── mobile-architect.md
    │   ├── qa-engineer.md
    │   ├── security-auditor.md
    │   └── monetization-expert.md
    ├── skills/                  # 10 slash commands
    │   ├── bootstrap/
    │   ├── interview/
    │   ├── step-by-step/
    │   ├── polish/
    │   ├── record-decision/
    │   ├── ship-it/
    │   ├── guide/
    │   ├── roadmap/
    │   ├── debug/
    │   └── refactor/
    ├── docs/
    │   ├── DECISIONS.md         # Memory system (auto-loaded)
    │   ├── MANUAL.md            # User guide
    │   ├── specs/               # Feature specifications
    │   └── decisions/           # Detailed ADRs
    └── templates/               # ADR, Spec, README templates
```

---

## 🎮 Usage

### Starting a Session

```bash
cd your-project
claude
```

At session start, Virtuoso automatically:
1. 🧠 Loads `CLAUDE.md` (orchestration system)
2. 📋 Loads `DECISIONS.md` (memory)
3. 📊 Shows git status

### Calling Agents

Summon specialized agents with `@agent-name`:

```
@product-manager Define the scope for a user dashboard feature

@tech-lead Should we use REST or GraphQL for our API?

@backend-architect Design the authentication endpoints

@frontend-architect Create a responsive navigation component

@security-auditor Review the payment flow for vulnerabilities
```

### Using Skills

Execute workflows with `/skill-name`:

```
/guide                              # Quick onboarding
/interview "build a todo app"       # Define a feature
/bootstrap                          # Initialize project
/step-by-step "add user auth"       # Safe execution
/roadmap                            # See project status
/debug "login returns undefined"    # Fix bugs
/refactor "src/utils.ts"            # Improve code
/polish                             # Clean up code
/ship-it                            # Deploy pipeline
/record-decision "Use PostgreSQL"   # Save to memory
```

---

## 👥 Agent Team

| Agent | Role | When to Use |
|:------|:-----|:------------|
| **@product-manager** | Product Strategy | "Turn my idea into a spec" |
| **@tech-lead** | Orchestrator | "Coordinate this feature across teams" |
| **@backend-architect** | API & Database | "Design the user API" |
| **@frontend-architect** | UI/UX | "Build a dashboard component" |
| **@mobile-architect** | Mobile Dev | "Implement React Native navigation" |
| **@qa-engineer** | Testing | "Find edge cases in checkout flow" |
| **@security-auditor** | Security | "Check for SQL injection risks" |
| **@monetization-expert** | Revenue | "Should this feature be paid?" |

---

## 🛠 Available Skills

| Skill | Purpose | Example |
|:------|:--------|:--------|
| `/guide` | Quick onboarding | `/guide` |
| `/interview` | Requirements gathering | `/interview "e-commerce platform"` |
| `/bootstrap` | Initialize project | `/bootstrap` |
| `/step-by-step` | Safe execution | `/step-by-step "implement login"` |
| `/roadmap` | Project status & next steps | `/roadmap` |
| `/debug` | Bug investigation | `/debug "API returns 500"` |
| `/refactor` | Code improvement | `/refactor "extract validation"` |
| `/polish` | Remove AI slop, fix lint | `/polish` |
| `/ship-it` | Deploy pipeline | `/ship-it` |
| `/record-decision` | Save to memory | `/record-decision "Use Tailwind"` |

---

## 🔄 Recommended Workflow

### 1️⃣ Define (Strategy)

```
/interview "I want to build a real-time chat app"
```

Creates a detailed spec in `.claude/docs/specs/`

### 2️⃣ Decide (Architecture)

```
@tech-lead What stack should we use for real-time features?
/record-decision "Use Socket.io for WebSocket connections"
```

### 3️⃣ Build (Execution)

```
/step-by-step "Implement the chat message component"
@backend-architect Create the message API endpoints
```

### 4️⃣ Debug (When Issues Arise)

```
/debug "Messages not appearing in real-time"
```

### 5️⃣ Improve (Refactoring)

```
/refactor "consolidate message handling logic"
```

### 6️⃣ Polish (Cleanup)

```
/polish
```

### 7️⃣ Ship (Deployment)

```
/ship-it
```

---

## 🧠 Memory System

Virtuoso remembers decisions across sessions via `DECISIONS.md`:

```markdown
| ID  | Date       | Area         | Decision              | Status     | Impact |
| --- | ---------- | ------------ | --------------------- | ---------- | ------ |
| 001 | 2026-02-01 | Architecture | Use Next.js 14        | [ACCEPTED] | HIGH   |
| 002 | 2026-02-01 | Database     | PostgreSQL for ACID   | [ACCEPTED] | HIGH   |
| 003 | 2026-02-01 | Styling      | Tailwind CSS          | [ACCEPTED] | MEDIUM |
```

Save decisions anytime:
```
/record-decision "Use Redis for session caching"
```

---

## 🛡 Safety & Automation (Hooks System)

Virtuoso includes a comprehensive hooks system that enforces security, quality, and workflow best practices at every stage of development. See [HOOKS.md](HOOKS.md) for complete documentation.

### 🚀 Session Management

**Automatic at startup:**
- ✅ Loads CLAUDE.md system guidelines
- ✅ Loads DECISIONS.md memory
- ✅ Validates ROADMAP.md exists
- ✅ Validates TODO.md exists
- ✅ Shows git status and branch
- ⚠️ Warns if required files are missing

### 🛡️ Security Guardrails

**Destructive Commands (Blocked):**
- 🚨 `rm -rf` - Recursive force deletion
- 🚨 `sudo rm` - Elevated deletion
- 🚨 `format`, `dd if=` - Disk operations
- 🚨 `curl ... | bash` - Remote script execution
- 🚨 `chmod 777` - Insecure permissions

**Sensitive Files (Ask First):**
- 🔐 `.env` files and environment variables
- 🔐 Files with "secret", "password", "credentials"
- 🔐 SSH keys (`.pem`, `id_rsa`)
- 📦 Dependency files (`package.json`, `requirements.txt`)
- 📋 Core system files (`CLAUDE.md`, `DECISIONS.md`, `ROADMAP.md`)

**Path Traversal Protection:**
- 🚫 Blocks `../` in file paths
- 🚫 Prevents access outside project directory

### 🎨 Auto-Formatting

After file changes:
- ✨ **Prettier** - JavaScript, TypeScript, JSON, CSS, Markdown
- 🐍 **Black** - Python
- 🦀 **rustfmt** - Rust
- 🐹 **gofmt** - Go

*All formatters run asynchronously (non-blocking)*

### 📋 Workflow Enforcement

**Plan Mode Protection:**
- Detects implementation requests without specs
- Injects Plan Mode reminder
- Enforces spec-driven development

**Task Completion Validation:**
- Checks TODO.md before stopping
- Blocks stopping with incomplete tasks
- Prevents premature session termination

**Package Installation:**
- 📦 Asks for confirmation
- 📝 Reminds to update DECISIONS.md
- ✅ Auto-approves test commands

### 🤖 Agent Lifecycle Tracking

- 📊 Logs all subagent starts/stops
- 🆔 Tracks agent IDs and types
- 🔍 Monitors agent interactions

### 🔔 Smart Notifications

- Permission prompts
- Idle state detection
- Auth success confirmations
- Critical system events

### 13 Hook Events Covered

1. **SessionStart** - Load protocols, validate structure
2. **UserPromptSubmit** - Enforce Plan Mode
3. **PreToolUse** - Security validation
4. **PermissionRequest** - Auto-approvals
5. **PostToolUse** - Auto-formatting
6. **PostToolUseFailure** - Error logging
7. **Stop** - Task completion check
8. **SubagentStart** - Agent tracking
9. **SubagentStop** - Agent completion
10. **Notification** - System events
11. **PreCompact** - Context preservation
12. **SessionEnd** - Cleanup
13. **MCP Tools** - Server tool logging

**Full Documentation:** [HOOKS.md](HOOKS.md)

---

## 🎯 Memory System

Virtuoso maintains persistent memory across sessions through **Architecture Decision Records (ADRs)**.

### How It Works

### Customize Agents

Edit or remove agents in `.claude/agents/`:

```bash
# Remove mobile agent if not needed
rm .claude/agents/mobile-architect.md
```

### Customize Hooks

Edit `.claude/settings.json` to modify:
- Session start behavior
- Pre/post tool use actions
- Safety guardrails

### Customize Skills

Each skill is in `.claude/skills/[name]/SKILL.md`. Edit to:
- Change workflow steps
- Add/remove required agents
- Modify output format

---

## 📚 Documentation

| Document | Purpose |
|:---------|:--------|
| [CLAUDE.md](CLAUDE.md) | Main orchestration system & agent protocols |
| [HOOKS.md](HOOKS.md) | Complete hooks system reference |
| [MANUAL.md](.claude/docs/MANUAL.md) | Detailed user guide |
| [DECISIONS.md](.claude/docs/DECISIONS.md) | Memory system (ADRs) |

---

## 🔧 Troubleshooting

### "Agent not responding"

Make sure you use the `@` prefix:
```
✅ @backend-architect design the API
❌ backend-architect design the API
```

### "Skill not found"

Skills use `/` prefix:
```
✅ /interview "my idea"
❌ interview "my idea"
```

### "Decisions not loading"

Check that `.claude/docs/DECISIONS.md` exists and `settings.json` has the SessionStart hook.

### "Claude doesn't remember context"

Run `/record-decision` to save important decisions to memory.

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

---

## 📄 License

MIT License - Feel free to use in commercial or open-source projects.

---

<p align="center">
  <b>Built with ❤️ for developers who want AI that understands architecture, not just code.</b>
</p>
