#!/bin/sh

set -e

. ../../common.sh

# Read the 'mako' download URL from '.config'.
DOWNLOAD_URL=`read_property MAKO_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'mako' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'mako' sources in the 'work/overlay/mako' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE mako

cd $SRC_DIR
