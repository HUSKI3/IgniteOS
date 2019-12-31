#!/bin/sh

set -e

. ../../common.sh

# Read the 'xcb-util-keysyms' download URL from '.config'.
DOWNLOAD_URL=`read_property XCB-UTIL-KEYSYMS_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xcb-util-keysyms' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xcb-util-keysyms' sources in the 'work/overlay/xcb-util-keysyms' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xcb-util-keysyms

cd $SRC_DIR
