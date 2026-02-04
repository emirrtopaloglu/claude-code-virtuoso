# Changelog

All notable changes to Claude Code Virtuoso will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Comprehensive testing infrastructure
- Observability and monitoring dashboard
- Performance optimization (caching, parallel execution)
- IDE integrations (VS Code, JetBrains)
- Interactive tutorial system

## [2.0.0] - 2026-02-04

### Added
- **Plan Mode** as default operating mode with spec-driven development
- **Mandatory ROADMAP.md and TODO.md system** for project tracking
- **Agent usage enforcement** via mandatory delegation rules
- **Comprehensive /vision discovery process** with 10-category exhaustive questioning
- **Context7 MCP integration** for up-to-date library documentation
- **Spec/Task file system** with templates and validation
- **Pre-implementation checklist** with approval gates
- **Golden Rules** documentation for critical development principles
- **13 hook events** with comprehensive security and workflow automation
- **Auto-formatting support** for Prettier, Black, rustfmt, and gofmt
- **Session management** with automatic context loading and validation
- **Security guardrails** including destructive command blocking
- **Decision memory system** via Architecture Decision Records (ADR)
- **Agent coordination protocols** with @tech-lead as orchestrator

### Changed
- **Restructured agent system** for clearer responsibilities and better coordination
- **Enhanced /vision skill** from basic discovery to comprehensive 10-category process
- **Updated session startup checklist** with new mandatory requirements
- **Improved /interview skill** with competitor analysis framework
- **Redesigned CLAUDE.md** with Plan Mode as default operating mode
- **Expanded agent roster** to 8 specialized agents with clear domains

### Fixed
- **Path traversal vulnerabilities** in file operations
- **Hook error handling** with graceful degradation
- **Agent coordination ambiguity** with clear escalation paths
- **Documentation inconsistencies** and duplicate sections
- **Missing critical files** (HOOKS.md, CHANGELOG.md, LICENSE)

### Security
- Added blocking for destructive commands (rm -rf, sudo rm, format, dd)
- Implemented path traversal protection
- Enhanced sensitive file warnings (.env, secrets, credentials)
- Added package installation validation
- Improved SSH key protection

### Documentation
- Created comprehensive HOOKS.md reference (13 events documented)
- Added marketplace-ready plugin.json
- Expanded README with better organization
- Created COMPREHENSIVE_ANALYSIS.md with improvement roadmap
- Added troubleshooting sections

## [1.0.0] - 2026-01-15

### Added
- Initial release of Claude Code Virtuoso
- 8 specialized AI agents (product-manager, tech-lead, backend-architect, frontend-architect, mobile-architect, qa-engineer, security-auditor, monetization-expert)
- 11 workflow skills (/vision, /interview, /bootstrap, /step-by-step, /polish, /record-decision, /ship-it, /guide, /roadmap, /debug, /refactor)
- Basic hooks system for session management
- Memory system via DECISIONS.md
- Agent coordination framework
- Installation script (install.sh)

### Documentation
- CLAUDE.md orchestration system
- README.md with quick start guide
- Basic agent and skill documentation
- Template files (ADR, Spec, README)

---

## Version Summary

| Version | Date | Status | Key Features |
|:--------|:-----|:-------|:-------------|
| 2.0.0 | 2026-02-04 | Stable | Plan Mode, 13 hooks, marketplace-ready |
| 1.0.0 | 2026-01-15 | Stable | Initial release, 8 agents, 11 skills |

---

## Upgrade Notes

### From 1.x to 2.0

**Breaking Changes:**
- Plan Mode is now mandatory - implementation requires specs first
- ROADMAP.md and TODO.md are required for all projects
- Some agent responsibilities have been redefined

**Migration Steps:**
1. Backup existing `.claude/` directory
2. Run installation script to update
3. Create ROADMAP.md and TODO.md for existing projects
4. Review updated CLAUDE.md for new protocols
5. Test hooks system with a sample session

**Action Required:**
- Update any custom hooks to new format
- Review agent delegations in existing workflows
- Create spec documents for ongoing work

---

## Release Types

- **Major:** Breaking changes, major new features
- **Minor:** New features, backward compatible
- **Patch:** Bug fixes, minor improvements

---

## Future Roadmap

See [ROADMAP.md](ROADMAP.md) for planned features and timeline.

---

**Changelog Format:** Keep a Changelog
**Semantic Versioning:** v2.0.0
**Last Updated:** 2026-02-04
