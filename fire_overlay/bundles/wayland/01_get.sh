#!/bin/sh

set -e

. ../../common.sh

DOWNLOAD_URL="https://wayland.freedesktop.org/releases/wayland-1.19.0.tar.xz"

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

download_source $DOWNLOAD_URL $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE

extract_source $OVERLAY_SOURCE_DIR/$ARCHIVE_FILE wayland

cd $SRC_DIR
