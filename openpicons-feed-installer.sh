#!/bin/bash

left=">>>>"
right="<<<<"
LINE1="---------------------------------------------------------"
LINE2="-------------------------------------------------------------------------------------"
    
echo "$LINE1"
echo "> Installing Openpicon Feed Please Wait ..."
echo "$LINE1"
sleep 3

echo "src/gz snp-feed https://openpicons.com/picons/full-motor-snp/ipk" >>/etc/opkg/snp-feed.conf

echo "src/gz srp-feed https://openpicons.com/picons/full-motor-srp/ipk" >>/etc/opkg/srp-feed.conf

    echo "$LINE1"
    echo "> Openpicons Feed Installed Successfully"
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