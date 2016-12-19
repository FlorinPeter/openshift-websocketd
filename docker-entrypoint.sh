#!/bin/bash
set -e

if [ "$1" = 'websocketd' ]; then
	exec "$@"
fi

exec "$@"
