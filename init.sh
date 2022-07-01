#!/bin/sh
wg-quick up wg0
/usr/local/bin/entrypoint.sh "$@"
