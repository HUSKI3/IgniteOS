#!/bin/sh

set -e

. ../../common.sh

# Read the 'apt' download URL from '.config'.
DOWNLOAD_URL=`read_property APT_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'apt' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'apt' sources in the 'work/overlay/apt' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE apt

cd $SRC_DIR
