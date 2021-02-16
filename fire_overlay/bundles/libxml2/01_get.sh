#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="ftp://xmlsoft.org/libxml2/libxml2-2.9.2.tar.gz"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE libxml2

cd $SRC_DIR
