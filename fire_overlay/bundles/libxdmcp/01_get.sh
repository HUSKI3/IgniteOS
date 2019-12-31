#!/bin/sh

set -e

. ../../common.sh

# Read the 'libxdmcp' download URL from '.config'.
DOWNLOAD_URL=`read_property LIBXDMCP_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'libxdmcp' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'libxdmcp' sources in the 'work/overlay/libxdmcp' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE libxdmcp

cd $SRC_DIR
