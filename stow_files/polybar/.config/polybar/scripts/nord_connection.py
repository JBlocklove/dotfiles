#!/bin/python3
import subprocess

nord_status = subprocess.run(['nordvpn', 'status'], stdout=subprocess.PIPE)
nord_status_list = nord_status.stdout.decode('utf-8').splitlines()

while nord_status_list[0].split(': ')[0] != "Status":
    del nord_status_list[0]
    pass
status_connected = nord_status_list[0].split(': ')[1]
if status_connected == "Connected":
    status_country = nord_status_list[2].split(': ')[1]
    status_city = nord_status_list[3].split(': ')[1]
    print(" | " + status_country + " - " + status_city)
    pass
else:
    print(" | Not Connected")
    pass
