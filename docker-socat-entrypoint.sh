#!/bin/sh
host_ip=$(/sbin/ip route show default | /usr/bin/awk '/default/ {print $3}')
IN="${host_ip}:4999"
OUT="4999"
socat -d -d tcp-listen:$OUT,fork,reuseaddr tcp-connect:$IN
