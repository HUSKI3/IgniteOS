#!/bin/sh

set -e

. ../../common.sh

# Read the 'xcb-util-renderutil' download URL from '.config'.
DOWNLOAD_URL=`read_property XCB-UTIL-RENDERUTIL_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xcb-util-renderutil' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xcb-util-renderutil' sources in the 'work/overlay/xcb-util-renderutil' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xcb-util-renderutil

cd $SRC_DIR
