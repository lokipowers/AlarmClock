#!/bin/bash

echo -n "Running Update"

cd /home/pi/AlarmClock

npm run build 

echo -n "Update Complete"

echo -n "Restarting Kiosk Service"

killall /usr/lib/chromium-browser/chromium-browser-v7

bash /home/pi/kiosk