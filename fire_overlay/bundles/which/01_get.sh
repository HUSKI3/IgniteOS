#!/bin/sh

set -e

. ../../common.sh

# Read the 'which' download URL from '.config'.
DOWNLOAD_URL=`read_property WHICH_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'which' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'which' sources in the 'work/overlay/which' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE which

cd $SRC_DIR
