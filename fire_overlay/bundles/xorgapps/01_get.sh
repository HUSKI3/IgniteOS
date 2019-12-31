#!/bin/sh

set -e

. ../../common.sh

# Read the 'xorgapps' download URL from '.config'.
DOWNLOAD_URL=`read_property XORGAPPS_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xorgapps' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xorgapps' sources in the 'work/overlay/xorgapps' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xorgapps

cd $SRC_DIR
