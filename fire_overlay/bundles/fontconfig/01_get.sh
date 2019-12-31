#!/bin/sh

set -e

. ../../common.sh

# Read the 'fontconfig' download URL from '.config'.
DOWNLOAD_URL=`read_property FONTCONFIG_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'fontconfig' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'fontconfig' sources in the 'work/overlay/fontconfig' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE fontconfig

cd $SRC_DIR
