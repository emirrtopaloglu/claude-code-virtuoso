# 📘 VIBE CODING OS USER MANUAL

Welcome, CEO. This system is designed to help you build a $1M product with high velocity.

## 🚦 QUICK START

1.  **Start New Project:** `/bootstrap`
2.  **Define a Feature:** `/interview [idea]`
3.  **Check Progress:** `/roadmap`
4.  **Save a Decision:** `/record-decision "Use PostgreSQL"`

## 🤖 YOUR TEAM (AGENTS)

| Role                | When to use?                                   | Command                         |
| :------------------ | :--------------------------------------------- | :------------------------------ |
| **Product Manager** | I have a vague idea, turn it into a spec.      | Use `product-manager` agent     |
| **Tech Lead**       | I need to decide on a library or architecture. | Use `tech-lead` agent           |
| **Frontend Arch.**  | UI looks bad or component structure is messy.  | Use `frontend-architect` agent  |
| **Backend Arch.**   | Database schema or API logic is needed.        | Use `backend-architect` agent   |
| **Monetization**    | How do I charge for this?                      | Use `monetization-expert` agent |
| **Competitor Spy**  | What is [Competitor X] doing?                  | Use `competitor-spy` agent      |
| **QA Engineer**     | Find bugs I missed.                            | Use `qa-engineer` agent         |

## 🛠️ CRITICAL COMMANDS

### `/interview`

**Purpose:** Turns a raw thought into a detailed plan.
**Usage:** `/interview "I want a dashboard for user analytics"`

### `/step-by-step`

**Purpose:** Safe coding mode. Executes one atomic step, then asks for confirmation.
**Usage:** `/step-by-step "Implement the login page"`

### `/polish`

**Purpose:** The "Janitor". Cleans up logs, lint errors, and unused imports. Run before every commit.
**Usage:** `/polish`

### `/record-decision`

**Purpose:** Writes to the `DECISIONS.md` memory file.
**Usage:** `/record-decision "We are using Tailwind for styling"`

## 🚨 THE GOLDEN RULE

**YOU are the Authority.**
If Claude tries to make a major decision (delete file, add heavy lib) without asking, say **"STOP. Ask for permission."**
