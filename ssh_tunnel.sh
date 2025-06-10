#!/bin/bash
# File: ssh_tunnel.sh
# Name: SSH Tunnel Creator
# Description: Establishes an SSH tunnel from a local port to a remote port for secure forwarding.
# Author: Bocaletto Luca
# Usage: ./ssh_tunnel.sh user@remote_host local_port remote_port
# Example: ./ssh_tunnel.sh bob@example.com 8080 80

if [ $# -ne 3 ]; then
    echo "Usage: $0 user@remote_host local_port remote_port"
    exit 1
fi

REMOTE="$1"
LOCAL_PORT="$2"
REMOTE_PORT="$3"

echo "Establishing SSH tunnel: localhost:${LOCAL_PORT} -> $REMOTE:${REMOTE_PORT}"
ssh -N -L ${LOCAL_PORT}:localhost:${REMOTE_PORT} "$REMOTE"
