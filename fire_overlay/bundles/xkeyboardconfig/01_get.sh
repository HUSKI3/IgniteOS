#!/bin/sh

set -e

. ../../common.sh

# Read the 'xkeyboardconfig' download URL from '.config'.
DOWNLOAD_URL=`read_property XKEYBOARDCONFIG_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'xkeyboardconfig' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'xkeyboardconfig' sources in the 'work/overlay/xkeyboardconfig' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE xkeyboardconfig

cd $SRC_DIR
