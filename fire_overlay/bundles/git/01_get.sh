#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="https://www.kernel.org/pub/software/scm/git/git-2.30.1.tar.xz"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE git

cd $SRC_DIR
