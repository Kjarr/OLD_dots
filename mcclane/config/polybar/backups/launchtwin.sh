#!/usr/bin/env sh

#Terminate already running bar instances
killall -q i3bar
killall -q polybar
# Launch bar1 and bar2
polybar oneplus
#echo "Polybar OK..."

#COMPTOSITOR
killall -q compton
while pgrep -x compton >/dev/null; do sleep 1; done
compton --glx-no-stencil --glx-no-rebind-pixmap --glx-swap-method exchange --config ~/.config/compton/compton &
