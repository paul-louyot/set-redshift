#!/bin/bash

kill `pidof redshift`
file="${HOME}/.config/redshift.conf"

var=$(awk 'BEGIN { FS="="; }
/temp-day/ { print $2; }' $file)
ntemp=$(($var + $1))
sed -i "s/temp-night=$var/temp-night=$ntemp/" $file
sed -i "s/temp-day=$var/temp-day=$ntemp/" $file
redshift &>/dev/null & 

