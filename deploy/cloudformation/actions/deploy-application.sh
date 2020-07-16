#!/bin/bash
CURRENT_DIR="$(dirname "$0")"
source "$CURRENT_DIR/functions.sh"
set -e

load-config

deploy-stack $APPLICATION_STACK_NAME "$CURRENT_DIR/../templates/application.yml" "$CURRENT_DIR/../templates/application-params.json"