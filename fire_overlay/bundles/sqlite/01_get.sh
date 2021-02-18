#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="https://sqlite.org/2021/sqlite-autoconf-3340100.tar.gz"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE sqlite

cd $SRC_DIR
