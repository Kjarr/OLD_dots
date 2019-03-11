#!/usr/bin/env sh

#POLYBAR
#Terminate Existing Instances
killall -q i3bar
killall -q polybar
#Launch Polybar
polybar one

#COMPOSITOR
#Terminate
killall -q compton
#Launch
while pgrep -x compton >/dev/null; do sleep 1; done
compton --glx-no-stencil --glx-no-rebind-pixmap --glx-swap-method exchange --config ~/.config/compton/compton &

#ADDITIONAL


