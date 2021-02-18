#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL=" https://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE apr

cd $SRC_DIR
