#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="https://curl.haxx.se/download/curl-7.75.0.tar.xz"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE curl

cd $SRC_DIR
