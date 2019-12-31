#!/bin/sh

set -e

. ../../common.sh

# Read the 'rpm' download URL from '.config'.
DOWNLOAD_URL=`read_property RPM_SOURCE_URL`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'rpm' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'rpm' sources in the 'work/overlay/rpm' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE rpm

cd $SRC_DIR
