---
"@spree/sdk": minor
---

### Refresh token support

- `AuthTokens` type now includes `refresh_token` field — returned by login, register, and password reset
- `client.auth.refresh({ refresh_token })` — exchanges a refresh token for a new access JWT + rotated refresh token. No Authorization header needed.
- `client.auth.logout({ refresh_token })` — revokes the refresh token server-side
