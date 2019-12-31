#!/bin/sh

set -e

. ../../common.sh

# Read the 'markupsafe' download URL from '.config'.
DOWNLOAD_URL=`read_property MARKUPSAFE_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'markupsafe' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'markupsafe' sources in the 'work/overlay/markupsafe' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE markupsafe

cd $SRC_DIR
