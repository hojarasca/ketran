#!/bin/bash
CURRENT_DIR="$(dirname "$0")"
source "$CURRENT_DIR/functions.sh"
set -e

load-config

create-stack $APPLICATION_STACK "$CURRENT_DIR/../templates/application.yml" "$CURRENT_DIR/../templates/application-params.json"