# Day 2 – Web server on AWS EC2 with nginx

## What I did
- Launched an EC2 instance (Amazon Linux 2023, t2.micro)
- Opened HTTP (port 80) in the Security Group
- Installed and ran nginx
- Hosted my own web page, reachable from the internet

## Commands
```
cat /etc/os-release          # check the OS (ID_LIKE=fedora -> use dnf)
sudo dnf install -y nginx    # install nginx
sudo systemctl start nginx   # start the service
sudo systemctl enable nginx  # start automatically after reboot
sudo systemctl status nginx  # check if it is running
curl http://localhost        # test from inside the server
echo "<h1>Hello from Yahya's cloud server</h1>" | sudo tee /usr/share/nginx/html/index.html
```

## Errors I fixed
| Error | Cause | Fix |
|---|---|---|
| `command not found` | typo (`is` instead of `ls`) | check spelling |
| `Access denied` | forgot `sudo` | use `sudo` (or `sudo !!`) |
| `event not found` | `!` inside double quotes | remove the `!` |
| Browser timed out | browser used https (port 443) | use `http://` (port 80) |

## Also learned
- DNS turns names into IPs (port 53, AWS Route 53)
- Settings files live in `/etc`, logs in `/var/log`
