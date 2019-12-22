#!/usr/bin/env sh

#POLYBAR
#Terminate Existing Instances
killall -q i3bar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#Launch Polybar
for MONITOR in $(polybar --list-monitors | cut -d":" -f1);
do
	polybar --reload top &
	polybar --reload bottom &
done

