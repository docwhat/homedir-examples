#!/bin/sh

set -e

cd $(dirname "$0")
TOPDIR=$(dirname $(pwd))


## Fetch templates and el files
cd "${TOPDIR}/.emacs.d/common"
wget --timestamping \
     --no-parent \
     --no-host-directories \
     --cut-dirs=2 \
     --accept='*.lse' \
     --accept='*.el' \
     --level=1 \
     --recursive \
     'http://www.zipworld.com.au/~peterm/'

## Fetch documentation
cd "${TOPDIR}/docs"
wget --timestamping \
     --no-parent \
     --no-host-directories \
     --cut-dirs=2 \
     --accept='*.pdf' \
     --accept='*.texi' \
     --accept='*.info' \
     --level=1 \
     --recursive \
     'http://www.zipworld.com.au/~peterm/'
