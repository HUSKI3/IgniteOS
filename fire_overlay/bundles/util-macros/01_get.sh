#!/bin/sh

set -e

. ../../common.sh

# Read the 'util-macros' download URL from '.config'.
DOWNLOAD_URL=`read_property UTIL-MACROS_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'util-macros' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'util-macros' sources in the 'work/overlay/util-macros' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE util-macros

cd $SRC_DIR
