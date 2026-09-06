import requests

t = requests.get("https://hookpulse.net/api/templates", timeout=30).json()
print(t["templates"]["ingest_cron"])
print(t["templates"]["miss_json"]["type"])
