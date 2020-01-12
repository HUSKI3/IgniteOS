#!/bin/sh

set -e

. ../../common.sh

# Read the 'nodejs' download URL from '.config'.
DOWNLOAD_URL=`read_property NODEJS_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'nodejs' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'nodejs' sources in the 'work/overlay/nodejs' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE nodejs

cd $SRC_DIR
