#!/bin/sh

set -e

. ../../common.sh

# Read the 'nspr' download URL from '.config'.
DOWNLOAD_URL=`read_property NSPR_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'nspr' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'nspr' sources in the 'work/overlay/nspr' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE nspr

cd $SRC_DIR
