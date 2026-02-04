# Claude Code Virtuoso - Hooks System Documentation

## Overview

Virtuoso includes a comprehensive hooks system that enforces security, quality, and workflow best practices at every stage of development. Hooks are event-driven scripts that run automatically at specific points during your Claude Code session.

**Total Hook Events:** 13
**Configuration File:** `.claude/settings.json`

---

## Hook Events

### 1. SessionStart

**Trigger:** When Claude Code session starts or resumes

**Purpose:** Load system protocols, validate project structure, display current status

**Actions:**
- ✅ Loads CLAUDE.md system guidelines
- ✅ Loads DECISIONS.md memory
- ✅ Validates ROADMAP.md exists
- ✅ Validates TODO.md exists
- ✅ Shows git status and branch
- ⚠️ Warns if required files are missing

**Status Message:** "Loading system protocols..."

---

### 2. UserPromptSubmit

**Trigger:** When user submits a prompt/request

**Purpose:** Enforce Plan Mode - ensure specs exist before implementation

**Actions:**
- Detects implementation requests (implement, build, create, add feature)
- Checks if spec exists in `.claude/docs/specs/`
- Checks if task exists in TODO.md
- Injects Plan Mode reminder if documentation missing
- **Prevents:** Implementation without proper planning

**Message:**
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

### 3. PreToolUse

**Trigger:** Before any tool is executed (Bash, Write, Edit, etc.)

**Purpose:** Security validation and safety checks

#### 3.1 Destructive Command Blocking

**Blocks These Commands:**
- `rm -rf` - Recursive force deletion
- `sudo rm` - Elevated deletion
- `format` - Disk formatting
- `dd if=` - Raw disk writes
- `curl ... | bash` - Piping remote scripts to shell
- `wget ... | bash` - Piping remote scripts to shell
- `bash <(curl ...)` - Subshell remote execution
- `sh <(wget ...)` - Subshell remote execution
- `chmod 777` - World-writable permissions
- `chmod -R 777` - Recursive world-writable

**Response:** Permission denied with security warning

#### 3.2 Package Installation Validation

**Asks Before:**
- `npm install`
- `yarn add`
- `pip install`
- `gem install`
- `composer require`

**Message:**
```
📦 PACKAGE INSTALLATION: [command]
New dependency detected. Verify compatibility and update DECISIONS.md after approval.
```

#### 3.3 Sensitive File Protection

**Warns About:**
- `.env`, `.env.*` - Environment files
- Files containing: "secret", "password", "credentials"
- SSH keys: `.pem`, `id_rsa`, `.key`
- Dependency files: `package.json`, `requirements.txt`, etc.
- Core system files: `CLAUDE.md`, `DECISIONS.md`, `ROADMAP.md`, `TODO.md`

**Message:**
```
🔐 SENSITIVE FILE: [filename]
Contains secrets or credentials. Ensure no sensitive data is committed.
```

#### 3.4 Path Traversal Protection

**Blocks:**
- File paths containing `../` (parent directory access)

**Response:** Permission denied

**Message:**
```
🚨 PATH TRAVERSAL DETECTED: File path contains (..)
This could access files outside the project directory.
```

#### 3.5 MCP Tool Logging

**Logs:** MCP server tool usage

**Status Message:** "Logging MCP tool usage..."

---

### 4. PermissionRequest

**Trigger:** When Claude Code asks for user permission

**Purpose:** Auto-approve safe commands

**Auto-Approves:**
- Test commands: `npm test`, `yarn test`, `pytest`, `cargo test`, `go test`, `mvn test`

---

### 5. PostToolUse

**Trigger:** After successful tool execution

**Purpose:** Auto-formatting and notifications

#### 5.1 Auto-Formatting

**Runs Asynchronously** (non-blocking, 30s timeout)

| Language | Tool | File Extensions |
|:---------|:-----|:----------------|
| JavaScript/TypeScript | Prettier | `.js`, `.jsx`, `.ts`, `.tsx`, `.json`, `.css`, `.scss`, `.md` |
| Python | Black | `.py` |
| Rust | rustfmt | `.rs` |
| Go | gofmt | `.go` |

**Requirements:** Formatter must be installed and in PATH

**Status Message:** "Formatting with [Formatter]..."

#### 5.2 Package Installation Notification

**After:** `npm install`, `yarn add`, `pip install`

**Message:**
```
✅ Packages installed. Consider running tests to ensure compatibility.
```

#### 5.3 Spec Creation Notification

**When:** File created in `.claude/docs/specs/*.md`

**Message:**
```
✅ SPEC CREATED: [filename]
Specification document created. Update TODO.md with corresponding tasks.
```

---

### 6. PostToolUseFailure

**Trigger:** When tool execution fails

**Purpose:** Error logging

**Actions:**
- Logs failed command
- Logs error details
- Displays user-friendly error message

**Status Message:** "Logging command failure..."

---

### 7. Stop

**Trigger:** When user stops session (Ctrl+D or exit)

**Purpose:** Prevent premature session termination

**Validates:**
- Checks TODO.md for incomplete tasks marked `[In Progress]`
- Blocks stopping if incomplete tasks exist
- Forces task completion or status update

**Block Message:**
```
📋 INCOMPLETE TASKS: There are still tasks marked as [In Progress] in TODO.md.
Complete or update them before stopping.
```

**Status Message:** "Checking for incomplete tasks..."

---

### 8. SubagentStart

**Trigger:** When a subagent is launched

**Purpose:** Agent tracking and monitoring

**Logs:**
- Agent type
- Agent ID

**Message:**
```
🤖 Subagent started: [agent_type] (ID: [agent_id])
```

**Status Message:** "Tracking subagent..."

---

### 9. SubagentStop

**Trigger:** When a subagent completes

**Purpose:** Agent completion tracking

**Logs:**
- Agent type
- Agent ID

**Message:**
```
✅ Subagent completed: [agent_type] (ID: [agent_id])
```

---

### 10. Notification

**Trigger:** Various system events

#### 10.1 Permission Prompts

**Message:**
```
🔔 Permission required: [message]
```

#### 10.2 Idle State

**Message:**
```
💤 Claude is idle and awaiting your input
```

---

### 11. PreCompact

**Trigger:** Before conversation context is compacted

**Purpose:** Context preservation

**Actions:**
- Logs compaction trigger
- Reminders to preserve ROADMAP.md and TODO.md context

**Message:**
```
📦 Compacting conversation (trigger: [trigger])
IMPORTANT CONTEXT: ROADMAP.md and TODO.md contain critical project state.
Preserve this context during compaction.
```

**Status Message:** "Preparing for compaction..."

---

### 12. SessionEnd

**Trigger:** When session ends

**Purpose:** Session cleanup and summary

**Displays:**
- Session end reason
- In-progress task count
- Session termination banner

**Message:**
```
═══════════════════════════════════════════════
👋 Claude Code Virtuoso Session Ending
Reason: [reason]
Tasks in progress: [count]
═══════════════════════════════════════════════
```

**Status Message:** "Cleaning up session..."

---

### 13. MCP Tools (Logged via PreToolUse)

**Purpose:** Track MCP server tool usage

**See:** PreToolUse section 3.5

---

## Security Features

### 🚨 Destructive Command Blocking

Comprehensive protection against commands that could cause irreversible damage:

**Blocked Patterns:**
- Recursive deletion: `rm -rf`, `sudo rm`
- Disk operations: `format`, `dd if=`
- Remote script execution: `curl ... | bash`, `wget ... | bash`
- Insecure permissions: `chmod 777`

**Response:** Permission denied with explanation

### 🔐 Sensitive File Protection

**Protected File Types:**
- Environment configuration (`.env*`)
- Secrets and credentials
- SSH keys (`.pem`, `id_rsa`)
- Dependency files (require confirmation)
- Core orchestrator files (require confirmation)

**Action:** Asks for user confirmation before modification

### 🚫 Path Traversal Prevention

**Protection:** Blocks file access outside project directory

**Pattern:** Detects `../` in file paths

**Response:** Permission denied

### ✅ Test Command Auto-Approval

**Auto-Approved Commands:**
- `npm test`
- `yarn test`
- `npm run test`
- `pytest`
- `cargo test`
- `go test`
- `mvn test`

**Behavior:** Always allow without prompting

---

## Auto-Formatting

### Supported Languages & Tools

| Language | Tool | Detect | Install |
|:---------|:-----|:-------|:--------|
| JavaScript/TypeScript | **Prettier** | `npx prettier --version` | `npm install -g prettier` |
| Python | **Black** | `black --version` | `pip install black` |
| Rust | **rustfmt** | `rustfmt --version` | Included with Rust |
| Go | **gofmt** | `gofmt` (included) | Included with Go |

### Behavior

- **Triggers:** After `Write` or `Edit` operations
- **Async:** Runs in background (doesn't block)
- **Timeout:** 30 seconds per formatter
- **Failure:** Silently fails if formatter not installed
- **Scope:** Only formats the modified file

### Customization

To disable specific formatters, remove entries from `.claude/settings.json` under `PostToolUse` hooks.

---

## Workflow Enforcement

### Plan Mode Protection

**Enforces:** Spec-driven development

**Process:**
1. Detects implementation requests
2. Checks for spec document
3. Checks for task in TODO.md
4. Blocks implementation if missing
5. Injects Plan Mode reminder

**Override:** User can acknowledge and proceed, but system warns

### Task Completion Validation

**Enforces:** No loose ends

**Process:**
1. On session stop, checks TODO.md
2. Looks for `[In Progress]` tasks
3. Blocks exit if tasks incomplete
4. Forces task completion or status change

**Override:** User can force exit, but system warns

### Package Installation Guardrails

**Enforces:** Dependency hygiene

**Process:**
1. Detects package installation commands
2. Asks for confirmation
3. Reminds to update DECISIONS.md
4. Suggests running tests after installation

---

## Customization

### Modifying Hooks

**Location:** `.claude/settings.json`

**Structure:**
```json
{
  "hooks": {
    "[EventName]": [
      {
        "matcher": "optional pattern",
        "hooks": [
          {
            "type": "command",
            "command": "bash command here",
            "async": true,
            "timeout": 30,
            "statusMessage": "Status text"
          }
        ]
      }
    ]
  }
}
```

### Adding Custom Hooks

**Example: Add pre-commit reminder**

```json
{
  "PreToolUse": [
    {
      "matcher": "Bash",
      "hooks": [
        {
          "type": "command",
          "command": "INPUT=$(cat); CMD=$(echo \"$INPUT\" | jq -r '.tool_input.command'); if echo \"$CMD\" | grep -q 'git commit'; then echo '📝 Remember: Update TODO.md and DECISIONS.md before committing' >&2; fi; exit 0",
          "statusMessage": "Checking git commit..."
        }
      ]
    }
  ]
}
```

### Disabling Hooks

**Method:** Remove or comment out hook entries in `settings.json`

**Example:** Disable auto-formatting
```json
// Remove these entries from PostToolUse
// {
//   "type": "command",
//   "command": "...prettier..."
// }
```

---

## Troubleshooting

### Hook Not Executing

**Check:**
1. Hook syntax in `settings.json` (valid JSON)
2. Command is executable (`bash` syntax)
3. Event name matches exactly
4. Matcher pattern (if using)

### Hook Failing Silently

**Debug:**
1. Add `2>&1` to command to capture stderr
2. Check `.claude/hooks/error.log`
3. Test command manually in terminal

### Async Hook Timeout

**Issue:** Hook takes longer than 30 seconds

**Solution:** Increase timeout in hook definition:
```json
{
  "timeout": 60  // 60 seconds instead of 30
}
```

### Formatter Not Running

**Check:**
1. Formatter installed: `which prettier`, `which black`
2. File extension matches formatter
3. No errors in formatter execution

### Auto-Approval Not Working

**Check:**
1. Command matches exact pattern in `PermissionRequest` hook
2. `jq` is available (used for JSON parsing)

---

## Best Practices

### Writing Hook Commands

1. **Always Exit Cleanly:** Use `exit 0` even on errors
2. **Capture Input:** Use `INPUT=$(cat)` to read JSON input
3. **Parse JSON:** Use `jq` for reliable JSON parsing
4. **Log to Stderr:** Use `>&2` for user-facing messages
5. **Keep It Simple:** Complex logic should be in scripts, not inline

### Example Hook Command Template

```bash
INPUT=$(cat)
VAR=$(echo "$INPUT" | jq -r '.field')

if [condition]; then
  echo "Message" >&2
  # Output JSON if needed
  jq -n '{key:"value"}'
fi

exit 0
```

### Async vs Sync

**Use Async (`async: true`) for:**
- Auto-formatting (non-critical)
- Logging (nice-to-have)
- Notifications (informational)

**Use Sync (default) for:**
- Security checks
- Validations
- Blocking operations

---

## Reference

### Hook Input Format

Most hooks receive JSON input via stdin:

```json
{
  "tool_name": "Bash|Write|Edit|...",
  "tool_input": {
    // Tool-specific input
  },
  "session_id": "...",
  "timestamp": "..."
}
```

### Hook Output Format

**For Permission Control:**
```json
{
  "hookSpecificOutput": {
    "permissionDecision": "allow|ask|deny",
    "permissionDecisionReason": "Explanation..."
  }
}
```

**For Additional Context:**
```json
{
  "hookSpecificOutput": {
    "additionalContext": "Additional information..."
  }
}
```

---

## Full Documentation Links

- [CLAUDE.md](CLAUDE.md) - Main orchestration system
- [README.md](README.md) - Project overview
- [MANUAL.md](.claude/docs/MANUAL.md) - User guide
- [DECISIONS.md](.claude/docs/DECISIONS.md) - Memory system

---

**Hooks System Version:** 2.0
**Last Updated:** 2026-02-04
**Maintained By:** Claude Code Virtuoso Project
