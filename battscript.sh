#!/bin/sh

CHARGESTAT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'state' | awk -F" " '{ print $2 }' | sed -e 's/discharging//' -e 's/charging/+/') 

LEVEL=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'percentage' | awk -F" " '{ print $2 }' | sed -e 's/%//')

if [ "$CHARGESTAT" == "+" ]; then
    echo "Batt:<fc=#CEFFAC>"$LEVEL"</fc>%"$CHARGESTAT
elif [ "$LEVEL" -lt "20" ]; then
    echo "Batt:<fc=#FFB6B0>"$LEVEL"</fc>%!"
elif [ "$LEVEL" -ge "98" ]; then
    echo "Batt:<fc=#CEFFAC>"$LEVEL"</fc>%"
else
    echo "Batt:<fc=#FFFFCC>"$LEVEL"</fc>%"
fi
