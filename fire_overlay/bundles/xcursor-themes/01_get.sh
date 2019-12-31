#!/bin/sh

set -e

. ../../common.sh

# Read the 'xcursor-themes' download URL from '.config'.
DOWNLOAD_URL=`read_property XCURSOR-THEMES_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xcursor-themes' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xcursor-themes' sources in the 'work/overlay/xcursor-themes' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xcursor-themes

cd $SRC_DIR
