#!/bin/bash


# Read battery status and send notification.
#
# If the status is not so important, just send a message.
# If the status is really low, show a textbox.


var=$(upower -i $(upower -e | grep BAT) | grep -E "state|percentage")

percent="${var##*$'\n'}"
size=${#percent} 
status=${percent:(size-3):2}

if [[ $var == *"discharging"* ]]
	then		
		if [[ "$status" -lt 24 ]]
		then
		    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
            export DISPLAY=:0 
			play /usr/share/sounds/freedesktop/stereo/complete.oga
			zenity --warning --text "Your energy is getting very low\!\n$percent" --title "Very low energy" 
		elif [[ "$status" -lt 30 ]]
		then
			XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -u critical "Low energy" "Your energy is getting low\!\n$percent"
		fi

elif [[ "$status" -gt 85 ]]
then
	XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -u critical "Enough energy" "Your energy is full.\n$percent"
fi
