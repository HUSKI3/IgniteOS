#!/bin/sh

set -e

. ../../common.sh

# Read the 'libpng' download URL from '.config'.
DOWNLOAD_URL=`read_property LIBPNG_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'libpng' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'libpng' sources in the 'work/overlay/libpng' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE libpng

cd $SRC_DIR
