#!/bin/sh

set -e

. ../../common.sh

# Change to the xcb-util-cursor source directory which ls finds, e.g. 'xcb-util-cursor-0.1.3'.
cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/xcb-util-cursor-*`

make_clean

rm -rf $DEST_DIR

echo "Configuring '$BUNDLE_NAME'."
CFLAGS="$CFLAGS" ./configure \
  FORCE_UNSAFE_CONFIGURE=1 \
  --prefix=/usr 


echo "Building '$BUNDLE_NAME'."
make_target

echo "Installing '$BUNDLE_NAME'."
make_target install DESTDIR=$DEST_DIR

echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
