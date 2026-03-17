---
"@spree/next": minor
---

### Refresh token support

- New `_spree_refresh_token` cookie — stored alongside JWT on login/register/password reset
- `withAuthRefresh()` now uses refresh tokens for 401 recovery instead of re-sending the expired JWT
- Proactive token refresh triggers at 5 minutes before expiry (was 1 hour)
- `logout()` now revokes the refresh token server-side before clearing cookies
- `login()`, `register()`, `resetPassword()` automatically save the refresh token cookie
