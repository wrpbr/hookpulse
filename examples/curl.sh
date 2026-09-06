#!/usr/bin/env bash
# HookPulse — free calls, no account. 
set -euo pipefail

# Snippets for curl, cron and n8n, and the exact JSON posted on a miss
curl -s https://hookpulse.net/api/templates

# Self-described API index (how to create a monitor without an account)
curl -s https://hookpulse.net/api/

# What your job runs at the end (replace YOUR_ID)
curl -fsS https://hookpulse.net/in/YOUR_ID
