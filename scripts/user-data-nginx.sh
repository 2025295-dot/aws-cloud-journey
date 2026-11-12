#!/bin/bash
# EC2 user data script - auto-installs nginx web server on first boot
# Tested on: Amazon Linux 2023 (AWS Academy Learner Lab, us-east-1)
# Usage: EC2 > Launch instance > Advanced details > User data
# Note: Security Group must allow HTTP (port 80)
# Log file if something fails: /var/log/cloud-init-output.log

# Install nginx (Amazon Linux = Fedora family = dnf)
dnf install -y nginx

# Start nginx now and enable it after reboot
systemctl enable --now nginx

# Replace default page with my own page
echo "<h1>Built automatically by Yahya's user data script</h1>" > /usr/share/nginx/html/index.html
