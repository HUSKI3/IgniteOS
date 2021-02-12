#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="http://anduin.linuxfromscratch.org/BLFS/bdb/db-5.3.28.tar.gz"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE apr

cd $SRC_DIR
