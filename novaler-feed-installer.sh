#!/bin/bash

FEED="/etc/opkg/novaler-feed.conf"
left=">>>>"
right="<<<<"
LINE1="---------------------------------------------------------"
LINE2="-------------------------------------------------------------------------------------"

        echo "$LINE1"
        echo "> Novaler 4K Multibox"
        sleep 3
        echo "$LINE1"
    

echo "$LINE1"
echo "> Installing Novaler Feed Please Wait ..."
echo "$LINE1"
sleep 3

cat <<F >"$FEED"
src/gz novaler-feed https://gitlab.com/eliesat/novaler/-/raw/main/
F

    echo "$LINE1"
    echo "> Novaler Feed Installed Successfully"
    echo "$LINE1"
    sleep 3s

rm -rf /var/cache/opkg/*
rm -rf /var/lib/opkg/lists/*

echo "> your device will reboot now enjoy...
        ${left}         ELIESAT    ${right}"
echo "$LINE1"
sleep 3
reboot
exit 0