#!/bin/sh

set -e

. ../../common.sh

# Read the 'xcb-util-image' download URL from '.config'.
DOWNLOAD_URL=`read_property XCB-UTIL-IMAGE_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xcb-util-image' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xcb-util-image' sources in the 'work/overlay/xcb-util-image' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xcb-util-image

cd $SRC_DIR
