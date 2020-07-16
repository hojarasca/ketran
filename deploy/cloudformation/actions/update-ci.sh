#!/bin/bash
CURRENT_DIR="$(dirname "$0")"
source "$CURRENT_DIR/functions.sh"
set -e

load-config

update-stack $CI_STACK_NAME "$CURRENT_DIR/../templates/ci.yml" "$CURRENT_DIR/../templates/ci-params.json"