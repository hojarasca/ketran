#!/bin/bash
set -e
CURRENT_DIR="$(dirname "$0")"
source "$CURRENT_DIR/delete-application.sh"
source "$CURRENT_DIR/delete-network.sh"