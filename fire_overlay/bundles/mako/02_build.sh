#!/bin/sh

set -e

. ../../common.sh

# Change to the mako source directory which ls finds, e.g. 'mako-1.1.0'.
cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/mako-*`

make_clean

rm -rf $DEST_DIR

echo "Configuring '$BUNDLE_NAME'."
CFLAGS="$CFLAGS" ./configure \
  FORCE_UNSAFE_CONFIGURE=1 \
  --prefix=/usr 


echo "Building '$BUNDLE_NAME'."


echo "Installing '$BUNDLE_NAME'."
python3 setup.py install --optimize=1

echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
