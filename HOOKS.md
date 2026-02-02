# 🪝 Claude Code Virtuoso - Hooks System

Comprehensive hooks system implementing the AI Orchestrator methodology with enterprise-grade security and workflow automation.

## 📋 Table of Contents

- [Overview](#overview)
- [Hook Events](#hook-events)
- [Security Features](#security-features)
- [Orchestrator Integration](#orchestrator-integration)
- [Installation](#installation)
- [Configuration](#configuration)

---

## Overview

The hooks system enforces the Claude Code Virtuoso AI Orchestrator principles through automated checks, validations, and workflow enforcement at every step of the development lifecycle.

### Core Principles

1. **Plan Mode First** - No implementation without planning
2. **Spec-Driven Development** - Every feature requires a specification
3. **Roadmap & Todo Always Exist** - Project state must be visible
4. **Security by Default** - Dangerous operations are blocked
5. **Agent-First Approach** - Specialized agents for specialized work

---

## Hook Events

### 1. 🚀 SessionStart

**When:** Session begins or resumes  
**Purpose:** Load system protocols, validate project structure, display status

#### Actions:
- ✅ Load CLAUDE.md system guidelines (first 100 lines)
- ✅ Load DECISIONS.md architectural decisions
- ✅ Check ROADMAP.md exists (critical requirement)
- ✅ Check TODO.md exists (critical requirement)
- ✅ Display git status and current branch
- ⚠️ Warn if required files are missing

**Example Output:**
```
🚀 CLAUDE CODE VIRTUOSO - AI ORCHESTRATOR SYSTEM
═══════════════════════════════════════════════

📘 SYSTEM PROTOCOL:
[CLAUDE.md contents...]

📋 ARCHITECTURAL DECISIONS:
[DECISIONS.md contents...]

📍 PROJECT STATUS:
✅ ROADMAP.md exists
✅ TODO.md exists
📊 Git Status: [changes...]
🔀 Current Branch: main
```

---

### 2. 💬 UserPromptSubmit

**When:** User submits a prompt  
**Purpose:** Enforce Plan Mode for implementation requests

#### Actions:
- 🔍 Detect implementation keywords: "implement", "build", "create", "add feature"
- 📋 Check if .claude/docs/specs/ directory exists
- ⚠️ Inject Plan Mode reminder if specs don't exist

**Triggered Context Injection:**
```
⚠️ PLAN MODE REQUIRED: User requested implementation work.
Per orchestrator protocol:
1) Check if spec exists in .claude/docs/specs/
2) Check if task exists in TODO.md
3) If not, enter Plan Mode and create spec/task first
4) Get user approval
5) Only then proceed with implementation.
NO IMPLEMENTATION WITHOUT SPEC/TASK.
```

---

### 3. 🛡️ PreToolUse - Bash Commands

**When:** Before executing any Bash command  
**Purpose:** Prevent destructive operations and validate installations

#### Security Blocks:

##### 🚨 Destructive Commands (DENY)
- `rm -rf` - Recursive force deletion
- `sudo rm` - Elevated deletion
- `format` - Disk formatting
- `dd if=` - Low-level disk operations

**Action:** Immediately deny with reason

##### 🚨 Remote Script Execution (DENY)
- `curl ... | bash`
- `wget ... | sh`
- `bash <(curl ...)`
- `sh <(wget ...)`

**Reason:** Scripts should be downloaded and reviewed first

##### 🚨 Insecure Permissions (DENY)
- `chmod 777`
- `chmod -R 777`

**Reason:** World-writable files are security risks

##### 📦 Package Installation (ASK)
- `npm install` / `yarn add`
- `pip install`
- `gem install`
- `composer require`

**Action:** Ask for confirmation, remind to update DECISIONS.md

---

### 4. 📝 PreToolUse - File Operations

**When:** Before writing or editing files  
**Purpose:** Protect sensitive files and critical configurations

#### Protected File Types:

##### 🔐 Sensitive Files (ASK)
- `.env` and `.env.*` files
- Files containing "secret", "password", "credentials"
- `.key`, `.pem`, `id_rsa` files

**Action:** Ask for confirmation, warn about git commits

##### 📦 Dependency Files (ASK)
- `package.json`, `package-lock.json`, `yarn.lock`
- `requirements.txt`, `Pipfile.lock`
- `Gemfile.lock`
- `Cargo.toml`, `Cargo.lock`
- `composer.json`, `go.mod`, `pom.xml`

**Action:** Confirm changes, record decision

##### 📋 Orchestrator Core Files (ASK)
- `CLAUDE.md`
- `DECISIONS.md`
- `ROADMAP.md`
- `TODO.md`

**Action:** Confirm changes, affects orchestrator behavior

##### 🚨 Path Traversal (DENY)
- Any file path containing `../`

**Reason:** Prevents accessing files outside project directory

---

### 5. 📡 PreToolUse - MCP Tools

**When:** Before using any MCP server tool  
**Purpose:** Log MCP tool usage for debugging

#### Actions:
- 📝 Log tool name to stderr
- ✅ Allow tool to proceed
- 🔍 Pattern: `mcp__<server>__<tool>`

**Example:**
```
📡 MCP TOOL: mcp__memory__create_entities - MCP server tool accessed
```

---

### 6. ✅ PermissionRequest - Auto-Approvals

**When:** Permission dialog is about to be shown  
**Purpose:** Auto-approve safe operations

#### Auto-Approved Commands:
- `npm test` / `yarn test`
- `npm run test`
- `pytest`
- `cargo test`
- `go test`
- `mvn test`

**Action:** Automatically allow and set "always allow" for Bash tool

---

### 7. 🎨 PostToolUse - Auto-Formatting

**When:** After writing or editing files  
**Purpose:** Maintain code quality and consistency

#### Language Support:

| Language | Formatter | File Extensions |
|:---------|:----------|:---------------|
| JavaScript/TypeScript | Prettier | `.js`, `.jsx`, `.ts`, `.tsx`, `.json`, `.css`, `.scss`, `.md` |
| Python | Black | `.py` |
| Rust | rustfmt | `.rs` |
| Go | gofmt | `.go` |

**Mode:** Async (non-blocking, 30s timeout)

#### Additional Actions:
- 📝 Log package installations
- ✅ Track spec file creation
- 📋 Remind to update TODO.md after spec creation

---

### 8. ❌ PostToolUseFailure

**When:** After a tool execution fails  
**Purpose:** Log failures for debugging

#### Actions:
- 📝 Log failed command
- 📝 Log error message
- 📊 Track failure patterns

**Example:**
```
❌ Command failed: npm test
Error: Exit code 1 - Test suite failed
```

---

### 9. 🛑 Stop - Task Completion

**When:** Claude finishes responding  
**Purpose:** Prevent stopping with incomplete work

#### Validation:
- 🔍 Check TODO.md for tasks marked "In Progress"
- 🚫 Block stopping if incomplete tasks exist
- 🔄 Prevent infinite loop with `stop_hook_active` check

**Decision:**
```json
{
  "decision": "block",
  "reason": "📋 INCOMPLETE TASKS: There are still tasks marked as (In Progress) in TODO.md. Complete or update them before stopping."
}
```

---

### 10. 🤖 SubagentStart / SubagentStop

**When:** Subagent spawns or completes  
**Purpose:** Track agent lifecycle

#### Logged Information:
- 🆔 Agent ID
- 🏷️ Agent Type (Bash, Explore, Plan, custom)
- ⏱️ Start/Stop timestamps

**Example:**
```
🤖 Subagent started: Explore (ID: agent-abc123)
✅ Subagent completed: Explore (ID: agent-abc123)
```

---

### 11. 🔔 Notification

**When:** Claude Code sends notifications  
**Purpose:** Log important system events

#### Notification Types:
- `permission_prompt` - Permission needed
- `idle_prompt` - Claude is idle
- `auth_success` - Authentication successful
- `elicitation_dialog` - User input requested

**Example:**
```
🔔 Permission required: Claude needs your permission to use Bash
💤 Claude is idle and awaiting your input
```

---

### 12. 📦 PreCompact

**When:** Before context compaction  
**Purpose:** Preserve critical context

#### Actions:
- 📝 Log compaction trigger (manual/auto)
- ⚠️ Remind about ROADMAP.md and TODO.md importance
- 📋 Ensure project state is preserved

**Context Injection:**
```
IMPORTANT CONTEXT: ROADMAP.md and TODO.md contain critical project state.
Preserve this context during compaction.
```

---

### 13. 👋 SessionEnd

**When:** Session terminates  
**Purpose:** Cleanup and status reporting

#### End Reasons:
- `clear` - Session cleared with `/clear`
- `logout` - User logged out
- `prompt_input_exit` - Exited during input
- `bypass_permissions_disabled` - Permissions mode disabled
- `other` - Other reasons

#### Final Report:
```
═══════════════════════════════════════════════
👋 Claude Code Virtuoso Session Ending
Reason: clear
Tasks in progress: 2
═══════════════════════════════════════════════
```

---

## Security Features

### 🛡️ Defense in Depth

1. **Command Injection Prevention**
   - Block piped remote scripts
   - Validate command structure
   - Sanitize inputs

2. **Path Traversal Protection**
   - Deny `../` in file paths
   - Validate file locations
   - Restrict to project directory

3. **Sensitive Data Protection**
   - Detect credential files
   - Warn before committing secrets
   - Flag environment variables

4. **Permission Escalation Prevention**
   - Block `chmod 777`
   - Flag `sudo` usage
   - Validate file permissions

5. **Destructive Operation Prevention**
   - Block `rm -rf`
   - Block disk formatting
   - Confirm before deletions

---

## Orchestrator Integration

### 📋 Required Files Enforcement

The hooks system enforces the existence of:

| File | Purpose | Hook |
|:-----|:--------|:-----|
| `CLAUDE.md` | System guidelines | SessionStart |
| `DECISIONS.md` | Architecture decisions | SessionStart |
| `ROADMAP.md` | Project roadmap | SessionStart, Stop |
| `TODO.md` | Active tasks | SessionStart, Stop, UserPromptSubmit |
| `.claude/docs/specs/*.md` | Feature specs | UserPromptSubmit, PostToolUse |

### 🎯 Plan Mode Enforcement

Hooks automatically detect implementation requests and:
1. Check for existing specifications
2. Check for task definitions
3. Inject Plan Mode reminder
4. Block premature implementation

### 🔄 Workflow Validation

```
User Request
     ↓
UserPromptSubmit Hook
     ↓
Check specs exist? ─── No ──→ Inject Plan Mode context
     ↓ Yes
PreToolUse Hook
     ↓
Validate security? ─── Fail ──→ Deny/Ask
     ↓ Pass
Execute Tool
     ↓
PostToolUse Hook
     ↓
Auto-format ────────────→ Update TODO
     ↓
Stop Hook
     ↓
Tasks complete? ─── No ──→ Block stopping
     ↓ Yes
Allow stopping
```

---

## Installation

### Prerequisites

- Claude Code (latest version)
- Git repository
- `jq` for JSON parsing: `brew install jq` (macOS)

### Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/emirrtopaloglu/claude-code-virtuoso.git
   cd claude-code-virtuoso
   ```

2. **Run the installer:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Or manually copy:**
   ```bash
   mkdir -p ~/.claude
   cp .claude/settings.json ~/.claude/settings.json
   # Or for project-specific:
   cp .claude/settings.json /path/to/your/project/.claude/settings.json
   ```

4. **Verify installation:**
   ```bash
   claude --version
   # Start a new session and check for system loading
   ```

---

## Configuration

### Hook Locations

| Location | Scope | Shareable |
|:---------|:------|:----------|
| `~/.claude/settings.json` | All projects | No (local machine) |
| `.claude/settings.json` | Single project | Yes (commit to repo) |
| `.claude/settings.local.json` | Single project | No (gitignored) |

### Customize Hooks

Edit `.claude/settings.json` to customize behavior:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "your-custom-script.sh",
            "timeout": 60,
            "statusMessage": "Running validation..."
          }
        ]
      }
    ]
  }
}
```

### Disable Hooks

To temporarily disable all hooks:
```json
{
  "disableAllHooks": true,
  "hooks": { ... }
}
```

Or use the `/hooks` menu in Claude Code.

---

## Advanced Features

### Async Hooks

Non-blocking hooks for long-running tasks:
```json
{
  "type": "command",
  "command": "npm test",
  "async": true,
  "timeout": 300
}
```

### Environment Variables

Available in all hooks:
- `$CLAUDE_PROJECT_DIR` - Project root directory
- `$CLAUDE_PLUGIN_ROOT` - Plugin directory (for plugins)
- `$CLAUDE_ENV_FILE` - Environment file (SessionStart only)

### JSON Input/Output

All hooks receive JSON on stdin:
```json
{
  "session_id": "abc123",
  "hook_event_name": "PreToolUse",
  "tool_name": "Bash",
  "tool_input": { "command": "npm test" },
  "cwd": "/path/to/project",
  "permission_mode": "default"
}
```

Return JSON to control behavior:
```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "Blocked for safety"
  }
}
```

---

## Troubleshooting

### Hooks Not Firing

1. Check hook is enabled: `/hooks` menu
2. Verify matcher pattern: `"matcher": "Bash"`
3. Enable debug mode: `claude --debug`
4. Check syntax: `jq . .claude/settings.json`

### JSON Validation Failed

- Ensure hook output is pure JSON
- No extra text in stdout
- Use `>&2` for debug messages

### Infinite Stop Loops

- Check `stop_hook_active` in Stop hooks
- Ensure loop breaker condition exists
- Verify TODO.md format

---

## Contributing

See [CLAUDE.md](CLAUDE.md) for the full AI Orchestrator protocol.

### Adding New Hooks

1. Define the hook event
2. Set appropriate matcher
3. Write validation script
4. Test thoroughly
5. Document behavior
6. Submit PR

---

## License

MIT License - See LICENSE file

---

## Support

- 📚 [Full Documentation](CLAUDE.md)
- 🐛 [Report Issues](https://github.com/emirrtopaloglu/claude-code-virtuoso/issues)
- 💬 [Discussions](https://github.com/emirrtopaloglu/claude-code-virtuoso/discussions)

---

**Built with ❤️ by the Claude Code Virtuoso Team**

*Making AI-assisted development safer, smarter, and more structured.*
