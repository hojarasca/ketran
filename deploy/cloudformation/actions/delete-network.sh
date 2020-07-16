#!/bin/bash
CURRENT_DIR="$(dirname "$0")"
source "$CURRENT_DIR/functions.sh"
set -e

load-config

delete-stack $NETWORK_STACK_NAME