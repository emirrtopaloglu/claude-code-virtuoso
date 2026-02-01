# 📘 CLAUDE CODE VIRTUOSO - AI ORCHESTRATOR

**An AI-powered engineering team orchestration system for Claude Code.**

Virtuoso transforms Claude Code into a coordinated team of specialized AI agents. Instead of a single AI assistant, you get a complete engineering organization with Product Managers, Architects, QA Engineers, and Security Auditors—all working together under a Tech Lead orchestrator.

**What You Get:**
- 🧠 **Persistent Memory:** Decisions persist across sessions via ADR system
- 👥 **8 Specialized Agents:** Each expert in their domain (Product, Backend, Frontend, Mobile, QA, Security, Monetization)
- 🎯 **Agent Orchestration:** Tech Lead coordinates multi-agent workflows
- 🛡️ **Quality Gates:** Automatic QA and Security checks before deployment
- 🔄 **Standardized Workflows:** 10 production-ready skills for common tasks
- 📋 **Cross-Agent Communication:** Agents notify each other when changes affect their domain

**Built for:** Software engineers, CTOs, and technical founders who want AI assistance that understands software architecture, not just code syntax.

---

## 🚦 QUICK START

1. **Start New Project:** `/bootstrap`
2. **Define a Feature:** `/interview [idea]`
3. **Check Progress:** `/roadmap`
4. **Debug Issues:** `/debug [problem]`
5. **Refactor Code:** `/refactor [target]`
6. **Polish Code:** `/polish`
7. **Ship to Production:** `/ship-it`

---

## 🤖 YOUR TEAM (AGENTS)

Agents are specialized AI experts you can summon by typing `@agent-name` in your prompt.

| Agent | Role | When to Use | Model |
|:------|:-----|:------------|:------|
| **@product-manager** | Product Strategy | "Turn my vague idea into a spec" | opus |
| **@tech-lead** | Technical Decisions | "Should we use REST or GraphQL?" | opus |
| **@frontend-architect** | UI/UX & Components | "The homepage layout is messy" | sonnet |
| **@backend-architect** | APIs & Database | "I need a user authentication system" | sonnet |
| **@mobile-architect** | Mobile Development | "Build React Native navigation" | sonnet |
| **@qa-engineer** | Testing & Bugs | "Find all edge cases in this feature" | sonnet |
| **@security-auditor** | Security Review | "Check for SQL injection risks" | sonnet |
| **@monetization-expert** | Revenue Strategy | "How should I price this feature?" | sonnet |

### How to Call an Agent

```
@product-manager I want to build a dashboard for analytics. Help me define the scope.
```

---

## 🛠️ CRITICAL SKILLS (COMMANDS)

Skills are reusable workflows triggered with `/command-name`.

### 📋 `/bootstrap`
**Purpose:** Initialize a new project from scratch.  
**What it does:**
- Asks you what type of project (Web, Mobile, API, Extension)
- Scaffolds the project structure
- Sets up Git and `.claude/` configuration

**Usage:**
```
/bootstrap
```

---

### 🎤 `/interview [idea]`
**Purpose:** Turn a vague idea into a detailed specification.  
**Requires:** `@product-manager` agent  
**What it does:**
- Interviews you about the feature
- Challenges assumptions
- Generates a structured spec in `.claude/docs/specs/`

**Usage:**
```
/interview "I want users to export their data as PDF"
```

**Output:** `.claude/docs/specs/export-pdf-feature.md`

---

### 🪜 `/step-by-step [task]`
**Purpose:** Safe execution mode. Does ONE thing, then asks for approval.  
**What it does:**
- Plans the task
- Executes the first step
- Stops and asks: "Continue with next step?"

**Usage:**
```
/step-by-step "Implement the login page"
```

---

### ✨ `/polish`
**Purpose:** Clean up AI slop, fix lint errors, remove unused imports.  
**What it does:**
- Scans files changed in your current branch
- Removes comments like "// logic here"
- Fixes type errors and formatting
- Runs prettier/linter

**Usage:**
```
/polish
```

**Best Practice:** Run before every commit.

---

### 📝 `/record-decision [decision]`
**Purpose:** Save architectural decisions to long-term memory.  
**What it does:**
- Adds entry to `.claude/docs/DECISIONS.md`
- Includes date, status, and context
- Prevents future contradictory decisions

**Usage:**
```
/record-decision "We are using Tailwind CSS for all styling"
```

---

### 🚢 `/ship-it`
**Purpose:** Prepare code for production.  
**Requires:** `@qa-engineer`, `@security-auditor`  
**What it does:**
1. Runs linter and type checker
2. Executes relevant tests
3. Runs security audit
4. Creates a Pull Request

**Usage:**
```
/ship-it
```

**Output:** Ready-to-merge PR with summary.

---

### 🧭 `/guide`
**Purpose:** Quick onboarding for new users.  
**What it does:**
- Asks your experience level (Beginner/Intermediate/Expert)
- Shows relevant commands and features
- Offers hands-on demo

**Usage:**
```
/guide
```

---

### 📍 `/roadmap`
**Purpose:** View project status and get next step recommendations.  
**What it does:**
- Scans feature specs in `.claude/docs/specs/`
- Shows status (Not Started / In Progress / Done)
- Analyzes pending decisions and TODOs
- **Recommends the most important next action**

**Usage:**
```
/roadmap
```

**Output:** Visual roadmap with prioritized next step.

---

### 🐛 `/debug [bug_description]`
**Purpose:** Systematic bug investigation and resolution.  
**What it does:**
1. Analyzes bug report
2. Reproduces the issue
3. Traces root cause (5 Whys technique)
4. Implements minimal fix
5. Adds regression test
6. Documents resolution

**Usage:**
```
/debug "Login fails with 'undefined' error"
/debug "API returns 500 on large payloads"
```

---

### ♻️ `/refactor [target]`
**Purpose:** Safe, incremental code refactoring.  
**What it does:**
1. Analyzes current code structure
2. Creates refactoring plan
3. Executes with test verification at each step
4. Ensures behavior unchanged

**Usage:**
```
/refactor "src/utils/helpers.ts"
/refactor "extract user validation logic"
```

**Recipes:** Extract Function, Replace Conditional, Simplify Nesting, Remove Duplication

---

## 🎯 WORKFLOW PATTERNS

### Pattern 1: New Feature (Full Cycle)

```bash
# Step 1: Define the feature
/interview "Add user profile editing"

# Step 2: Review the generated spec
# Check: .claude/docs/specs/user-profile-editing.md

# Step 3: Implement it safely
/step-by-step "Implement the user profile editing feature"

# Step 4: Clean up
/polish

# Step 5: Ship it
/ship-it
```

---

### Pattern 2: Technical Decision

```bash
# Step 1: Consult the tech lead
@tech-lead Should we use PostgreSQL or MongoDB for our e-commerce app?

# Step 2: Record the decision
/record-decision "Use PostgreSQL for transactional data integrity"
```

---

### Pattern 3: Bug Hunting

```bash
# Step 1: Call QA engineer
@qa-engineer Review the checkout flow for edge cases

# Step 2: Fix issues found

# Step 3: Verify with security
@security-auditor Check the payment integration for vulnerabilities
```

---

## 🔒 SECURITY & PERMISSIONS

The system has built-in safety checks:

- **Destructive Commands:** (`rm -rf`, `drop table`) → Asks for confirmation
- **Sensitive Files:** (`.env`, `secrets.json`) → Warns before editing
- **Auto-formatting:** Prettier runs after file edits (if `package.json` exists)

---

## 📁 PROJECT STRUCTURE

Your `.claude/` folder contains:

```
.claude/
├── agents/              # Specialized AI experts
├── docs/
│   ├── DECISIONS.md     # Architecture Decision Records
│   ├── MANUAL.md        # This file
│   └── specs/           # Feature specifications
├── skills/              # Reusable workflows
├── templates/           # File templates (ADR, SPEC, README)
└── settings.json        # Hook configurations
```

---

## 🚨 THE GOLDEN RULE

**YOU are the CEO. Claude is the CTO.**

- For major decisions (architecture, libraries, deletions), Claude MUST ask for permission.
- If Claude proceeds without asking, say: **"STOP. Ask for permission."**
- Once you make a decision, Claude will follow it exactly.

---

## 🆘 TROUBLESHOOTING

### "Agent not responding"
- Check that you used `@` prefix: `@product-manager` not `product-manager`

### "Skill not found"
- Check that you used `/` prefix: `/polish` not `polish`

### "DECISIONS.md not loaded"
- Restart your Claude session (hooks run on startup)

### "Changes not formatted"
- Ensure `package.json` exists (auto-formatting only works for JS/TS projects)

---

## 🎓 LEARN MORE

- **Agent Details:** See `.claude/agents/[agent-name].md`
- **Skill Details:** See `.claude/skills/[skill-name]/SKILL.md`
- **Decision History:** Check `.claude/docs/DECISIONS.md`
- **Templates:** Use `.claude/templates/` for consistent docs

---

## 📞 SUPPORT

For questions, issues, or feature requests:
- GitHub: [claude-code-virtuoso](https://github.com/emirrtopaloglu/claude-code-virtuoso)
- Documentation: Check `.claude/docs/`

---

**Built with ❤️ using Claude Code**
