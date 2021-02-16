#!/bin/sh

set -e

. ../../common.sh

cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/wayland*`

make_clean

rm -rf $DEST_DIR

echo "Configuring '$BUNDLE_NAME'."
CFLAGS="$CFLAGS" ./configure LIBXML_CFLAGS=-I/usr/include LIBXML_LIBS=-L/usr/lib/x86_64-linux-gnu/ --prefix=/usr\
            --disable-static\
            --disable-documentation
#LIBXML_CFLAGS=-I$OVERLAY_WORK_DIR/$BUNDLE_NAME/libxml2/libxml2-2.9.2/include LIBXML_LIBS=-L$OVERLAY_WORK_DIR/$BUNDLE_NAME/libxml2/libxml2-2.9.2/lib \
LIBXML_CFLAGS=-I/usr/include LIBXML_LIBS=-L/usr/lib/x86_64-linux-gnu/ 
echo "Building '$BUNDLE_NAME'."
make_target LIBXML_CFLAGS=-I/usr/include LIBXML_LIBS=-L/usr/lib/x86_64-linux-gnu/

echo "Installing '$BUNDLE_NAME'."
make_target install DESTDIR=$DEST_DIR

echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
