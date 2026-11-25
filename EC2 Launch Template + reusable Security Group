# Day 6 – EC2 Launch Template + reusable Security Group

## Goal
Launch identical nginx web servers in one click, without setting everything by hand.

## What I built
- **Security group `web-sg`**
  - HTTP (port 80) from `0.0.0.0/0` → everyone can see the website
  - SSH (port 22) from **My IP** only (`/32` = one single IP) → least-privilege access
- **Launch template `web-server-template`**
  - Amazon Linux 2023, t3.micro
  - Security group: `web-sg`
  - User data: [scripts/user-data-nginx.sh](scripts/user-data-nginx.sh) (installs and starts nginx on first boot)
- Launched **2 instances from the template** in one click → both served the same page

## What I learned
- A launch template is a saved "recipe" for a server: AMI, instance type, security group, user data
- **Create launch template** = make the recipe; **Launch instance from template** = use it
- Every server from a template is identical, so there are fewer mistakes
- Launch templates are needed for **Auto Scaling groups**
- SSH limited to "My IP" can block EC2 Instance Connect (it connects from AWS IP ranges)
- Add a `Name` tag in the template so every instance gets a name automatically

## Mistakes I fixed
| Problem | Fix |
|---|---|
| My template wasn't in the list | I was on "Launch instance from template" – had to create it first |
| An extra EBS volume was added by accident | Removed it – the 8 GiB root volume is enough |
| Description field looked filled in | It was only grey placeholder text – typed a real description |
