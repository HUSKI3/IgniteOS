#!/bin/sh

set -e

. ../../common.sh

# Read the 'pcre2' download URL from '.config'.
DOWNLOAD_URL=" https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.bz2"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

# Download 'pcre2' source archive in the 'source/overlay' directory.
download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

# Extract all 'pcre2' sources in the 'work/overlay/sudo' directory.
extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE pcre2

cd $SRC_DIR
