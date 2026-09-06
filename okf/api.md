---
type: "API"
title: "API do HookPulse"
description: "Superfície HTTP e MCP do HookPulse, com o modelo de cobrança."
resource: "https://hookpulse.net/api/"
---

# API do HookPulse

Base: https://hookpulse.net

## Como pagar

Endpoint e monitoramento têm faixa grátis. As rotas pagas cobram por requisição (x402) ou descontam de crédito pré-pago (`POST /api/credito?usd=10`).

## Endpoints

* `GET /okf/:arquivo` — OKF bundle (Open Knowledge Format v0.1): markdown with frontmatter so an agent reads the whole product without parsing HTML.
* `GET /.well-known/:arquivo` — Machine discovery before the home page: `api-catalog` (RFC 9727, a linkset with the API and the MCP), `security.txt` (RFC 9116) and `mcp-registry-auth` (the official MCP registry key).
* `GET /apis.json` — APIs.json (apisjson.org, 0.19): the index APIs.io harvests — the API, the MCP, OpenAPI, guide and OKF bundle in one file. Also at `/.well-known/apis.json`.
* `GET /api/` — Self-describing index: the whole API surface, with quota and quickstart.
* `GET /api/health` — Liveness and the commit deployed right now — it is how the smoke waits for its own deploy.
* `POST /mcp` — MCP server over HTTP (Streamable HTTP, JSON-RPC 2.0) — plugs into the client with nothing to install.
* `POST /api/guest` — Creates a guest `hp_…` — it is the anonymous owner of your monitors.
* `GET /api/endpoints` — Lists the owner's monitors, with the state of each one.
* `POST /api/endpoints` — Creates a dead-man switch: silence beyond the interval becomes an alert.
* `GET /api/endpoints/:id` — State of one monitor — accepts the owner's token or the monitor's own token.
* `PATCH /api/endpoints/:id` — Changes the monitor's name, interval or alert channels.
* `DELETE /api/endpoints/:id` — Deactivates the owner's monitor; it stops taking pings and alerting.
* `GET /api/endpoints/:id/events` — The latest pings received at this monitor's ingest.
* `GET /in/:id` — The ingest URL: this is where your cron or webhook proves it is alive.
* `POST /in/:id` — The same ingest by POST, for whoever can only send webhooks.
* `GET /api/status-feed` — Returns (minting it the first time) the public status URL of all your monitors.
* `DELETE /api/status-feed` — Rotates the feed token: the previous URL stops working immediately.
* `GET /s/:token.json` — The status dashboard as JSON, with no header at all — the token in the path is the credential.
* `GET /s/:token.rss` — The same dashboard as RSS 2.0, for a feed reader, a chat bot or a status page.
* `GET /api/templates` — Ingest snippets (curl, cron, n8n) and the exact JSON we POST on a miss.
* `GET /api/billing` — Free allowance, x402 prices in force and the state of the account's trial.
* `GET /api/me` — The session's account, its monitors and the state of the trial.
* `POST /api/auth/start` — Sends the 6-digit code by e-mail to create the account or sign in to it.
* `POST /api/auth/verify` — Exchanges the code for a session — and confirming the e-mail grants the trial on the spot.
* `POST /api/auth/claim` — Moves the guest's monitors to the signed-in account.
* `POST /api/auth/logout` — Invalidates the current session.
* `POST /api/contact` — Talks to support: a human solves Turnstile, an agent pays $0.10 in x402.
* `POST /api/visit` — Ping from the interface that increments the day's visits. Agents need not call it.
* `GET /api/metrics` — Metrics of the last 7 days. With the operator token, includes payments.
* `POST /api/credito` — Top up prepaid credit: pay once with x402 and get the token that debits on any API of the house.
* `GET /api/credito` — Credit balance and statement — the latest movements, without returning the token.

Catálogo completo: https://hookpulse.net/llms-full.txt · OpenAPI: https://hookpulse.net/openapi.json
