#!/bin/sh

set -e

PATH="/opt/bin:$PATH"

cd "$(dirname "$0")"
touch acme.json
chmod 0600 acme.json

export HOSTNAME="$(hostname -f)"

sed -i "s/localhost/$HOSTNAME/" pretix_config/pretix.cfg

exec docker-compose up
