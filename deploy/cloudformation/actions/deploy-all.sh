#!/bin/bash
set -e
CURRENT_DIR="$(dirname "$0")"
source "$CURRENT_DIR/deploy-network.sh" || true # Should always try to deploy the next one.
source "$CURRENT_DIR/deploy-ci.sh" || true # Should always try to deploy the next one.
source "$CURRENT_DIR/deploy-application.sh"