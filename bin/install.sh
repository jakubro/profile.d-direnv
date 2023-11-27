#!/bin/bash

log_info "Installing/Updating direnv..."

curl -s https://direnv.net/install.sh | bash || exit 1

log_info "You can safely ignore any instructions printed above"
