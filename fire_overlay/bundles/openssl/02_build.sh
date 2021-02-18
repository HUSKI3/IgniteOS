#!/bin/sh

set -e

. ../../common.sh

cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/openssl*`

make_clean

rm -rf $DEST_DIR

echo "Configuring '$BUNDLE_NAME'."
CFLAGS="$CFLAGS" ./configure  --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

echo "Building '$BUNDLE_NAME'."
make_target

echo "Installing '$BUNDLE_NAME'."
make_target install DESTDIR=$DEST_DIR

echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
