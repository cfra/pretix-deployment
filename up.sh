#!/bin/sh

set -e

PATH="/opt/bin:$PATH"

cd "$(dirname "$0")"
touch acme.json
chmod 0600 acme.json

export HOSTNAME="$(hostname -f)"

exec docker-compose up
