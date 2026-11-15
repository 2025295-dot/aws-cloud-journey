# Day 5 – Troubleshooting an nginx web server on AWS EC2

## Setup
- Launched EC2 (Amazon Linux 2023) with my user data script → [scripts/user-data-nginx.sh](scripts/user-data-nginx.sh)
- Broke the server on purpose, then found and fixed each problem

## My troubleshooting order
1. Is the service running? → `sudo systemctl status nginx`
2. Does it work from inside? → `curl http://localhost`
3. Is it the network? → Security Group, http vs https

## Problem 1 – Service stopped
- **Symptom:** browser error `ERR_CONNECTION_REFUSED` (fails fast)
- **Check:** `systemctl status nginx` → `inactive (dead)`
- **Cause:** nginx service was stopped
- **Fix:** `sudo systemctl start nginx`
- **Verify:** status `active (running)`, site loads

## Problem 2 – Port 80 blocked
- **Symptom:** browser timed out (slow fail)
- **Check:** nginx `active (running)` and `curl localhost` works → server is fine
- **Cause:** Security Group inbound rule for HTTP (port 80) was missing
- **Fix:** added inbound rule HTTP, port 80, source 0.0.0.0/0
- **Verify:** site loads again

## Key lesson
| Browser error | Usually means |
|---|---|
| Connection refused | Request reached the server, but the service is down |
| Timed out | Request blocked on the way (firewall / Security Group) |

## Also learned
- Inbound = traffic coming into the server, Outbound = traffic going out
- `localhost` can work even when the public site is down
- SSH (port 22) should be limited to "My IP" in real environments
- Always diagnose before fixing, then verify
