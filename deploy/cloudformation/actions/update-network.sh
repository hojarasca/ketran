#!/bin/bash
CURRENT_DIR="$(dirname "$0")"
source "$CURRENT_DIR/functions.sh"
set -e

load-config

update-stack $NETWORK_STACK_NAME "$CURRENT_DIR/../templates/network.yml" "$CURRENT_DIR/../templates/network-params.json"