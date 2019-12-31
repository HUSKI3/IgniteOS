#!/bin/sh

set -e

. ../../common.sh

# Read the 'libxau' download URL from '.config'.
DOWNLOAD_URL=`read_property LIBXAU_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'libxau' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'libxau' sources in the 'work/overlay/libxau' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE libxau

cd $SRC_DIR
