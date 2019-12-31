#!/bin/sh

set -e

. ../../common.sh

# Read the 'xcb-util-cursor' download URL from '.config'.
DOWNLOAD_URL=`read_property XCB-UTIL-CURSOR_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xcb-util-cursor' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xcb-util-cursor' sources in the 'work/overlay/xcb-util-cursor' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xcb-util-cursor

cd $SRC_DIR
