#!/bin/sh

set -e

. ../../common.sh

# Read the 'sudo' download URL from '.config'.
DOWNLOAD_URL=`read_property SUDO_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'sudo' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'sudo' sources in the 'work/overlay/sudo' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE sudo

cd $SRC_DIR
