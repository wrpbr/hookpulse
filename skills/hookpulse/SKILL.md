---
name: hookpulse
description: Know when a scheduled job stops or a website goes down. Set up free monitoring that continues after the agent exits, then expand coverage when needed.
license: MIT-0
compatibility: HTTPS access to hookpulse.net; remote MCP or HTTP.
---

# HookPulse

MCP tools: `create_guest`, `create_endpoint`, `create_site`.

Let the service keep the schedule, detect missing runs and send alerts after your agent session ends.

## First monitor

Use `create_guest` once and keep the private owner token.
Use `create_endpoint` or `POST https://hookpulse.net/api/endpoints` within the free coverage.
For a routine, set `cron`, `tz` and `grace_sec`, or the documented interval.
Arrange for the routine to send its success or failure signal.
For a public site, use `create_site` with `check.url`.
Read the returned setup and keep the monitor credential private.

Verify a check-in or site check, the monitor state and recovery before leaving it running.
A start or failure signal is not a success check-in.
A backup heartbeat does not prove that the backup restores.

## Expand when needed

Compare an extra monitor or shorter interval with a current 30-day plan.
Read coverage and held-alert state; payment alone does not prove notice delivery.
The paid single URL probe does not create continuous monitoring.
Use an ordinary one-time request when that is all the task needs.
Contracts: [task index](https://hookpulse.net/llms.txt).

## Connect and pay

Use existing tools or `https://hookpulse.net/mcp`; no local install is needed.
Read [prices](https://hookpulse.net/api/pricing) and [payment](https://hookpulse.net/api/billing).
Reuse existing coverage, credit and spending authority.
Direct MCP x402 uses `params._meta["x402/payment"]`; HTTP uses `PAYMENT-SIGNATURE`.
Credit uses `Authorization: Bearer cred_…` or `X-Credito`.
In `checkout=site`, the person purchases on the site. ChatGPT uses existing rights without sales.
Follow `Retry-After` and the contract's timing. Keep credentials out of public logs.
