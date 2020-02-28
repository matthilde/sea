#!/bin/sh -e

# Installation script for sea

log () {
    # print fancy outputs
    printf "%b\n" "\u001b[36m[#] \u001b[0m$1"
}

die () {
    # exit program with 1
    printf "%b\n" "\u001b[35m[x] \u001b[1m\u001b[31m$1"
    exit 1
}

[ "$(id -u)" = 0 ] || die "Script must be run as root."

log "Checking for cURL..."
command -v curl || die "cURL not present. Please install it with your package manager."
log "cURL present."

log "Checking for tar..."
command -v tar || die "tar not present. Please install it with your package manager."
log "tar present."

log "Checking for gzip..."
command -v gzip || die "gzip not present. Please install it with your package manager."
# Actually start the install.

cp sea /usr/bin
# Do not install man if it is not installed.
command -v man && {
    gzip -c sea.1>/usr/share/man/man1/sea.1.gz
    mandb
}
