#!/usr/bin/python
from __future__ import print_function
import subprocess

selfname = subprocess.check_output(['whoami']).strip(" \n\r")
users = []

for line in subprocess.check_output(['who']).split('\n'):
    if line != "":
        users.append(line.split())

alert_colour = "<fc=#FF0000>"
normal_colour = "<fc=#CCC>"
end_colour = "</fc>"

print(normal_colour + " (" + str(len(users)) + ")" + end_colour, end="")
for user in users:
    if user[0] == selfname:
        #print(normal_colour + " " + user[-1:][0] + end_colour + "    ", end="")
        pass
    else:
        print(alert_colour + " " + user[0][:8] + " " + user[-1:][0] + end_colour + "    ", end="")

