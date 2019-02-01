#!/bin/sh

status=$(pvpn --status)

public_ip=$(pvpn --status | awk -F: '/Public/ {print $2}')
conn_status=$(pvpn --status | awk -F: '/ProtonVPN Status/ {print $2}')
#server=$(pvpn --status | awk -F: '/Server Name/ {print $2}')

if [ "$conn_status" = " Not Running" ] ; then
    connected="<span color='#586E75'>{not connected}</span>"
elif [ "$conn_status" = " Running" ] ; then
    connected="<span color='#19c682'>{connected}</span> [$public_ip ]"
else
    connected="~"
fi

#printf "$connected\n"
printf "$connected\n"
