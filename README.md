# HookPulse

> A dead man's switch for cron jobs and webhooks: your job pings a URL; silence beyond the interval becomes an alert.

**Live:** https://hookpulse.net · **API index:** https://hookpulse.net/api/ · **OpenAPI:** https://hookpulse.net/openapi.json · **MCP server:** https://hookpulse.net/mcp · **Docs for agents:** https://hookpulse.net/llms.txt

## What it does

HookPulse watches for silence. A backup that did not run, a cron that died, a webhook that stopped arriving — none of them raise an error, so HookPulse turns the absence into one.

Create a monitor (name, interval), get a private check-in link, and make the job call it: `curl -fsS https://hookpulse.net/in/ID` at the end of the script, or a GET/POST from n8n, Make, Zapier or a GitHub Action. Every five minutes HookPulse compares the last ping with the interval; a miss goes out by e-mail or as a JSON POST (`type: hookpulse.miss`, `last_event_at`, `interval_sec`) to your alert URL, at most once every 24 hours per monitor. The last pings, latency and a body preview stay on the monitor page; a status page is available as JSON and RSS.

## Quickstart (no account)

Snippets for curl, cron and n8n, and the exact JSON posted on a miss:

```bash
curl -s https://hookpulse.net/api/templates
```

Self-described API index (how to create a monitor without an account):

```bash
curl -s https://hookpulse.net/api/
```

What your job runs at the end (replace YOUR_ID):

```bash
curl -fsS https://hookpulse.net/in/YOUR_ID
```

## MCP server (remote, nothing to install)

Streamable HTTP over the same public API. Every tool is a call on this API; `operationId` in the OpenAPI is the tool name. Server card: `GET https://hookpulse.net/mcp`.

Claude Code:

```bash
claude mcp add --transport http hookpulse https://hookpulse.net/mcp
```

Cursor (`.cursor/mcp.json`):

```json
{
  "mcpServers": {
    "hookpulse": {
      "url": "https://hookpulse.net/mcp"
    }
  }
}
```

Main tools: `create_endpoint`, `list_endpoints`, `get_endpoint`, `list_events`, `ping_ingest`, `status_feed_url`, `list_templates`, `create_guest`.

## Pricing

**Free.** Ten monitors, intervals from 90 seconds, one alert e-mail, unlimited pings and a status page, without an account. Confirm an e-mail and get 90 days without limits.

**Paid.** Per request (x402) or prepaid credit: an extra monitor US$ 0.10, intervals under 90 seconds US$ 0.05, an extra alert e-mail US$ 0.10.

## What it is not

It is not uptime monitoring: it never calls your endpoints; your job calls it.

## Files in this repository

| | |
|---|---|
| `README.md` | this page |
| `openapi.json` | OpenAPI 3 document; `operationId` = MCP tool name |
| `llms.txt` | short guide for agents (endpoints, auth, pricing, MCP) |
| `llms-full.txt` | full reference: params, body, response field by field, errors (when published) |
| `apis.json` | APIs.json index (APIs.io) |
| `mcp/server.json` | manifest published in the Official MCP Registry (`net.hookpulse/hookpulse`) |
| `okf/` | OKF bundle: markdown with front-matter (index, about, API, FAQ) |
| `examples/` | `curl.sh` and `python.py` with the free calls above |

## About this repository

This repository mirrors the public, machine-readable surfaces of HookPulse as served at https://hookpulse.net: the OpenAPI document, the `llms.txt` guide, the MCP registry manifest, the OKF bundle and the APIs.json index. The product itself is not open source; the mirror exists so the API and the MCP server can be found, read and linked from here. Files are regenerated from the live surfaces (last sync: 2026-09-05); if something here disagrees with the site, the site is right.

Issues and suggestions are welcome here. Contact: contato@hookpulse.net. Author: Wendel ([@wrpbr](https://github.com/wrpbr)).
