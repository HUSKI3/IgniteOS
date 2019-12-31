#!/bin/sh

set -e

. ../../common.sh

# Read the 'xlib' download URL from '.config'.
DOWNLOAD_URL=`read_property XLIB_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xlib' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xlib' sources in the 'work/overlay/xlib' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xlib

cd $SRC_DIR
