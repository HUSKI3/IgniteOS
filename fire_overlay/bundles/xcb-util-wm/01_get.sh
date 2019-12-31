#!/bin/sh

set -e

. ../../common.sh

# Read the 'xcb-util-wm' download URL from '.config'.
DOWNLOAD_URL=`read_property XCB-UTIL-WM_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xcb-util-wm' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xcb-util-wm' sources in the 'work/overlay/xcb-util-wm' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xcb-util-wm

cd $SRC_DIR
