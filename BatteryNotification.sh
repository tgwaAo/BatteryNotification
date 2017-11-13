#!/bin/bash

var=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|percentage")
#echo "$var"

if [[ $var == *"discharging"* ]]
	then
		percent="${var##*$'\n'}"
		size=${#percent} 
		status=${percent:(size-3):2}
		
		if [[ "$status" -lt 30 ]]
			then
				zenity --warning --text "Your energy is getting low!\n$percent" --title "Low energy" --display=:0.0
		fi
fi

