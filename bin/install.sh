#!/bin/bash
set -eo pipefail

log_info "Installing/Updating direnv..."

curl -s https://direnv.net/install.sh | bash

log_info "You can safely ignore any instructions printed above"
