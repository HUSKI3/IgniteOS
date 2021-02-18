#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="https://archive.apache.org/dist/subversion/subversion-1.14.1.tar.bz2"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE subversion

cd $SRC_DIR
