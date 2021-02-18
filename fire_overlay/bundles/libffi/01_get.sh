#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="https://github.com/libffi/libffi/releases/download/v3.3/libffi-3.3.tar.gz"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE libffi

cd $SRC_DIR
