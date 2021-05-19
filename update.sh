#!/bin/bash

echo -n "Running Update"

cd /home/pi/AlarmClock &

npm run build &

sudo rm -r /var/www/html && cp -r /home/pi/AlarmClock/dist /var/www/html 

echo -n "Update Complete"

echo -n "Restarting Kiosk Service"

sudo systemctl restart kiosk.service