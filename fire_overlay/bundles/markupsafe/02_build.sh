#!/bin/sh

set -e

. ../../common.sh

# Change to the markupsafe source directory which ls finds, e.g. 'markupsafe-1.1.1'.
cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/markupsafe-*`

make_clean

rm -rf $DEST_DIR

echo "Configuring '$BUNDLE_NAME'."
CFLAGS="$CFLAGS" ./configure \
  FORCE_UNSAFE_CONFIGURE=1 \
  --prefix=/usr 


echo "Building '$BUNDLE_NAME'."
python2 setup.py build &&
python3 setup.py build

echo "Installing '$BUNDLE_NAME'."
python2 setup.py install --optimize=1 &&
python3 setup.py install --optimize=1

echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
