#!/bin/sh

set -e

. ../../common.sh

# Read the 'xfonts' download URL from '.config'.
DOWNLOAD_URL=`read_property XFONTS_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xfonts' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xfonts' sources in the 'work/overlay/xfonts' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xfonts

cd $SRC_DIR
