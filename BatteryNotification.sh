#!/bin/bash

var=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|percentage")
#echo "$var"

percent="${var##*$'\n'}"
		size=${#percent} 
		status=${percent:(size-3):2}

if [[ $var == *"discharging"* ]]
	then		
		if [[ "$status" -lt 30 ]]
			then
				zenity --warning --text "Your energy is getting low!\n$percent" --title "Low energy" --display=:0.0
		fi

elif [[ "$status" -gt 85 ]]
	then
		zenity --info --text "Your energy is full!\n$percent" --title "Enough energy" --display=:0.0
fi
