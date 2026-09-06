---
type: "FAQ"
title: "FAQ — HookPulse"
description: "Perguntas e respostas sobre o HookPulse, as mesmas publicadas na página."
resource: "https://hookpulse.net/"
---

# Perguntas frequentes — HookPulse

## How is this different from uptime monitoring?

An uptime checker fetches your site. HookPulse never fetches anything of yours: your routine calls our private URL, and silence for longer than the interval is the miss. That is what catches a cron that stopped, a backup that never finished or a scenario that was paused.

## How often do you check, and when does the alert leave?

Every 5 minutes we compare each monitor's last ping with its interval (90 seconds to 24 hours). Past the interval we record a miss and alert once — by e-mail and by POST to your webhook URL — at most once per 24 hours, or per interval if it is longer. The next ping clears it.

## What exactly do you send on a miss?

A JSON body with type hookpulse.miss, the monitor id and name, last_event_at, interval_sec, miss_count, and text/content lines that Slack and Discord display as-is. GET /api/templates on the monitor returns the same body, so nothing is guessed.

## What counts as a ping?

Any HTTP request to the monitor's check-in link — GET from a crontab curl, POST from an n8n HTTP Request node, a fetch at the end of a script. Each hit is stored as an event and resets the clock. Pings are free and unlimited.

## What is free and what costs?

Ten monitors, intervals from 90 seconds, one e-mail alert destination, the status page and unlimited pings are free without an account. An extra monitor costs US$ 0.10, an interval under 90 seconds US$ 0.05 and an e-mail destination beyond the first US$ 0.10, per request (x402) or from prepaid credit. Sign in and confirm your e-mail for 90 days without the paywall.

## Do I need an account?

No. This browser keeps a guest session and your monitors stay editable here. Sign in with your e-mail later and the monitors are claimed by your account, which also starts the 90-day trial. Agents pay per request instead.
