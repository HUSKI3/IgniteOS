#!/bin/sh

set -e

. ../../common.sh

# Read the 'mesa' download URL from '.config'.
DOWNLOAD_URL=`read_property MESA_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'mesa' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'mesa' sources in the 'work/overlay/mesa' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE mesa

cd $SRC_DIR
