#!/bin/sh

set -e

. ../../common.sh

# Read the 'xbitmaps' download URL from '.config'.
DOWNLOAD_URL=`read_property XBITMAPS_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xbitmaps' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xbitmaps' sources in the 'work/overlay/xbitmaps' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xbitmaps

cd $SRC_DIR
