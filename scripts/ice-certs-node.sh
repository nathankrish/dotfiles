#!/usr/bin/env bash
# Runs NodeJS with ICE's MITM certs added to the chain.
export NODE_TLS_REJECT_UNAUTHORIZED=1
export NODE_EXTRA_CA_CERTS='/home/knathan1/certs/nscacert.pem'
exec node "$@"

