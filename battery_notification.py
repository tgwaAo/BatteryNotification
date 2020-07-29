#!/usr/bin/python3

import subprocess

UPPER_PERCENTAGE = 85
LOWER_PERCENTAGE = 30
VERY_LOW_PERCENTAGE = 20
DISPLAY=0

batterie = subprocess.check_output(["upower", "-i", "/org/freedesktop/UPower/devices/battery_BAT0"])

batterie = batterie.split(b"\n")
found = 0
subprocess.call(["zenity", "--warning", "--text", "is this working?", "--title", "Low energy", "--display=:0"])

for info in batterie:
	if b"state" in info:
		state = info.split(b":")[1]
		found += 1
	
	elif b"percentage" in info:
		percentage = int(info.split(b":")[1][:-1])
		found += 1
	
	if found == 2:
		break
		
if found == 2:
	if b"discharging" in state:
		if VERY_LOW_PERCENTAGE >= percentage:
			subprocess.call(["zenity", "--warning", "--text", "Your energy is getting low!\n{}".format(percentage), "--title", "Very low energy", "--display=:{}".format(DISPLAY)])
		elif LOWER_PERCENTAGE >= percentage:
			subprocess.call(["notify-send", "Low energy", "Your energy is getting low!\n{}".format(percentage), "--display=:{}".format(DISPLAY)])
	elif UPPER_PERCENTAGE <= percentage:
		subprocess.call(["notify-send", "Enough energy", "Your energy is full!\n{}".format(percentage), "--display=:{}".format(DISPLAY)])
