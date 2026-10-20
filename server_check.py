servers = ["WIN-SRV-012" , "LINUX-SSRV-01" , "ORACLE-DB"]
print("Starting check...")
print("--------------------")
for server in servers:
    print(f"Checking server: {server}...OK")

print(f"Done! Checked {len(servers)} servers.") 
 # <- NO spaces at start
