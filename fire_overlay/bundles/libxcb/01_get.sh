#!/bin/sh

set -e

. ../../common.sh

# Read the 'libxcb' download URL from '.config'.
DOWNLOAD_URL=`read_property LIBXCB_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'libxcb' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'libxcb' sources in the 'work/overlay/libxcb' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE libxcb

cd $SRC_DIR
