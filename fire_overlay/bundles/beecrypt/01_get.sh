#!/bin/sh

set -e

. ../../common.sh

# Read the 'beecrypt' download URL from '.config'.
DOWNLOAD_URL=`read_property BEECRYPT_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'beecrypt' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'beecrypt' sources in the 'work/overlay/beecrypt' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE beecrypt

cd $SRC_DIR
