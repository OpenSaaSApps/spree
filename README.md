# spree

> Click To Deploy Spree — Open Source eCommerce Platform

[![Sync](https://github.com/opensaasapps/spree/actions/workflows/sync.yml/badge.svg)](https://github.com/opensaasapps/spree/actions/workflows/sync.yml) [![Docker](https://github.com/opensaasapps/spree/actions/workflows/docker.yml/badge.svg)](https://github.com/opensaasapps/spree/actions/workflows/docker.yml) [![Docker Pulls](https://img.shields.io/docker/pulls/thefractionalpm/spree)](https://hub.docker.com/r/thefractionalpm/spree)

Upstream: [spree/spree](https://github.com/spree/spree) · Auto-synced daily

---

## One-Command Deploy

```bash
cp .env.example .env && nano .env
docker compose up -d
```

## Coolify / Dokploy

1. New service → **Docker Compose**
2. Paste `docker-compose.yml`
3. Set env vars in UI
4. Deploy

## Environment Variables

| Variable | Required | Description |
|---|---|---|
| `DATABASE_URL` | ⚪ | |
| `REDIS_URL` | ⚪ | |
| `SECRET_KEY_BASE` | ✅ | |
| `RAILS_FORCE_SSL` | ⚪ | |
| `MEILISEARCH_URL` | ⚪ | |

## Image

```
docker pull ghcr.io/spree/spree:latest
docker pull thefractionalpm/spree:latest
```

## Ports

| Port | Service |
|---|---|
| `3000` | Main app |

---

*Part of the [OpenSaaSApps](https://github.com/opensaasapps) Click-To-Deploy collection.*
