#!/bin/sh

set -e

. ../../common.sh

# Read the 'Neon' download URL from '.config'.
DOWNLOAD_URL=`read_property NEON_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'Neon' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'Neon' sources in the 'work/overlay/Neon' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE neon

cd $SRC_DIR
