# Day 7 – Auto Scaling group + Application Load Balancer

## Goal
Build a highly available web app that heals itself when a server fails.

## Architecture
```
Internet → Application Load Balancer (web-alb)
              → Target group (web-tg, health check on /)
                  → Auto Scaling group (web-asg)
                      → 2 x EC2 nginx servers in 2 Availability Zones
                        (from launch template web-server-template)
```

## What I built
- **Target group `web-tg`**: HTTP:80, health check on `/` (healthy after 5 OK checks, unhealthy after 2 fails)
- **Application Load Balancer `web-alb`**: internet-facing, 2 AZs (us-east-1a + us-east-1d), security group `web-sg`, listener HTTP:80 → `web-tg`
- **Auto Scaling group `web-asg`**: launch template `web-server-template`, same 2 AZs, desired 2 / min 2 / max 4, ELB health checks on, tag `Name = web-server`

## Self-healing test
1. Terminated one instance on purpose
2. The website stayed online through the load balancer (the other server answered)
3. The ASG detected 1 < min 2 and launched a replacement automatically, in the same AZ

## What I learned
- **Load balancer** = one address for many servers; sends traffic only to healthy ones
- **Auto Scaling group** = keeps the number of servers between min and max, replaces failed ones
- An ALB needs **at least 2 Availability Zones**, and the ASG should use the same ones
- **ELB health checks** let the ASG replace servers that are running but not serving the website
- Clean-up order matters: delete the **ASG first**, or it recreates the instances

## Mistakes I fixed
| Problem | Fix |
|---|---|
| Skipped the "Integrate with other services" step | Went back and attached the ASG to `web-tg` |
| ELB health check option was greyed out | It only unlocks after attaching a load balancer |
| Load balancer page timed out | Browser used `https` (443); the ALB only listens on `http` (80) |
