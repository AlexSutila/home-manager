#!/usr/bin/env bash

HOSTNAME="sslvpn.asu.edu/2fa"
connect() {
    /opt/cisco/secureclient/bin/vpn -s connect "$1"
}

STATE=`/opt/cisco/secureclient/bin/vpn state | grep "state:" | head -n 2 | tail -n 1`
STATE=$(awk '{printf $NF}' <<< $STATE)

if [ "$STATE" == "Disconnected" ]; then
    connect "$HOSTNAME"
else
    echo "Already connected"
fi
