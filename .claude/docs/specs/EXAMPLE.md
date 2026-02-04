# Feature: User Authentication

**Status:** Draft
**Created:** 2026-02-04
**Last Updated:** 2026-02-04

---

## Overview

Implement secure user authentication with email/password and OAuth providers (Google, GitHub).

## Problem Statement

Users need to create accounts and log in to access personalized features. Current authentication is non-existent, preventing user onboarding and data persistence.

## User Stories

- As a **new user**, I want to sign up with email so that I can create an account
- As a **returning user**, I want to log in with Google so that I don't have to remember another password
- As a **user**, I want to reset my password so that I can regain access if I forget it

## Acceptance Criteria

- [ ] Users can sign up with email/password
- [ ] Users can log in with email/password
- [ ] Users can authenticate via Google OAuth
- [ ] Users can authenticate via GitHub OAuth
- [ ] Users can reset password via email
- [ ] Sessions persist for 7 days
- [ ] Passwords are hashed with bcrypt (cost factor 12)
- [ ] JWT tokens expire after 1 hour
- [ ] Refresh token mechanism for session renewal
- [ ] Rate limiting on login attempts (5 attempts per 15 minutes)
- [ ] Email verification before account activation

## Technical Design

### Components Affected

#### Backend
- **New:** `/auth` module
  - `auth.service.ts` - Business logic
  - `auth.controller.ts` - API endpoints
  - `auth.middleware.ts` - Route protection
  - `jwt.strategy.ts` - Token management

#### Frontend
- **New:** `/features/auth` module
  - `SignUpForm.tsx` - Registration component
  - `LoginForm.tsx` - Login component
  - `PasswordReset.tsx` - Password reset flow
  - `OAuthButton.tsx` - OAuth integration

### API Changes

#### New Endpoints

```
POST   /api/auth/signup
POST   /api/auth/login
POST   /api/auth/logout
POST   /api/auth/refresh
POST   /api/auth/forgot-password
POST   /api/auth/reset-password
GET    /api/auth/verify-email/:token
GET    /api/auth/google
GET    /api/auth/google/callback
GET    /api/auth/github
GET    /api/auth/github/callback
```

#### Request/Response Examples

**Sign Up:**
```json
POST /api/auth/signup
{
  "email": "user@example.com",
  "password": "SecurePass123!",
  "name": "John Doe"
}

Response: 201 Created
{
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "John Doe",
    "emailVerified": false
  },
  "tokens": {
    "access": "jwt-access-token",
    "refresh": "jwt-refresh-token"
  }
}
```

### Database Changes

#### New Tables

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255), -- Nullable for OAuth-only users
  name VARCHAR(255) NOT NULL,
  email_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE oauth_accounts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  provider VARCHAR(50) NOT NULL, -- 'google', 'github'
  provider_user_id VARCHAR(255) NOT NULL,
  UNIQUE(provider, provider_user_id)
);

CREATE TABLE refresh_tokens (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  token VARCHAR(500) UNIQUE NOT NULL,
  expires_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE password_reset_tokens (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  token VARCHAR(500) UNIQUE NOT NULL,
  expires_at TIMESTAMP NOT NULL,
  used BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);
```

#### Indexes

```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_refresh_tokens_user ON refresh_tokens(user_id);
CREATE INDEX idx_refresh_tokens_expires ON refresh_tokens(expires_at);
CREATE INDEX idx_password_reset_tokens_user ON password_reset_tokens(user_id);
CREATE INDEX idx_password_reset_tokens_expires ON password_reset_tokens(expires_at);
```

### UI Changes

#### New Pages
- `/signup` - Sign up form
- `/login` - Login form
- `/forgot-password` - Password reset request
- `/reset-password/:token` - Password reset form
- `/verify-email/:token` - Email verification handler

#### Modified Components
- Navigation bar - Add "Login" and "Sign Up" buttons (logged out) / User menu (logged in)
- Protected routes - Require authentication

### Security Considerations

#### Password Requirements
- Minimum 8 characters
- Must include uppercase, lowercase, number, special character
- Check against common password list

#### Token Security
- Access tokens: 1 hour expiration
- Refresh tokens: 7 days expiration
- Store in httpOnly cookies (XSS protection)
- CSRF tokens for state changes

#### Rate Limiting
- Login attempts: 5 per 15 minutes per IP
- Password reset: 3 per hour per email
- Signup: 3 per hour per IP

#### OAuth Security
- Validate OAuth state parameter to prevent CSRF
- Store OAuth tokens securely
- Implement token rotation

## Dependencies

### Backend
- `bcrypt` - Password hashing
- `jsonwebtoken` - JWT generation/validation
- `passport` - Authentication middleware
- `passport-google-oauth20` - Google OAuth
- `passport-github2` - GitHub OAuth
- `nodemailer` - Email sending

### Frontend
- No new dependencies (use existing HTTP client)

## Risks & Considerations

### Security Risks
- **Password breach:** Mitigated with bcrypt and rate limiting
- **Session hijacking:** Mitigated with httpOnly cookies and CSRF protection
- **OAuth vulnerabilities:** Mitigated with state validation

### Performance Considerations
- JWT verification on every request → Consider caching
- Database query for user session → Optimize with indexes

### Scalability Considerations
- Stateless JWT allows horizontal scaling
- Refresh token storage requires database/Redis consideration

## Open Questions

1. Should we implement 2FA? → Deferred to v2.0
2. Should we support magic link authentication? → Considered, deferred to v2.0
3. Should we implement remember-me functionality? → Handled via refresh token duration (configurable)

## Approval

- [ ] Product Manager approval
- [ ] Tech Lead approval
- [ ] Security Auditor review

## Related Decisions

- [ADR-002: Use PostgreSQL for ACID compliance](../decisions/002-postgresql.md)
- [ADR-005: Implement JWT-based authentication](../decisions/005-jwt-auth.md)

---

**Next Steps:**
1. Get approval from stakeholders
2. Create detailed task breakdown in `.claude/docs/tasks/`
3. Add to TODO.md
4. Begin implementation with `/step-by-step`
