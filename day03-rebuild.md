# Day 3 – Rebuilt the web server from memory + nano

## Challenge
Rebuilt the nginx web server on a new EC2 instance without looking at notes.

## Problem I solved
nginx showed `enabled` but `Active: inactive (dead)`, and `curl` said
"Could not connect to server".
- Cause: I ran `enable` but not `start`
- Fix: `sudo systemctl start nginx`

## Key lessons
| Command | What it does |
|---|---|
| `dnf install` | installs software |
| `systemctl start` | starts a service now |
| `systemctl enable` | starts it automatically after reboot |
| `systemctl status` | shows if it is running |
| `which nano` | checks if a program is installed |

- "Could not connect" = service not running
- "Timed out" in browser = firewall / Security Group blocking the port

## New skill: editing files with nano
```
sudo nano /usr/share/nginx/html/index.html
```
- Arrow keys to move (no mouse)
- Ctrl+K = cut a line
- Ctrl+O then Enter = save
- Ctrl+X = exit

Edited the page title, heading and text, then refreshed the browser.
