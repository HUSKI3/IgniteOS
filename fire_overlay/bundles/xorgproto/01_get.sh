#!/bin/sh

set -e

. ../../common.sh

# Read the 'xorgproto' download URL from '.config'.
DOWNLOAD_URL=`read_property XORGPROTO_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xorgproto' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xorgproto' sources in the 'work/overlay/xorgproto' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xorgproto

cd $SRC_DIR
