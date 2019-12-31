#!/bin/sh

set -e

. ../../common.sh

# Read the 'xcb-proto' download URL from '.config'.
DOWNLOAD_URL=`read_property XCB-PROTO_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xcb-proto' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xcb-proto' sources in the 'work/overlay/xcb-proto' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xcb-proto

cd $SRC_DIR
