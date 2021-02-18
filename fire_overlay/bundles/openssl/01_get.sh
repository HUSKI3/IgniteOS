#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="https://www.openssl.org/source/openssl-3.0.0-alpha12.tar.gz"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE openssl

cd $SRC_DIR
