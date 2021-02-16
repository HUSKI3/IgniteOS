#!/bin/sh

set -e

. ../../common.sh

cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/libxml2*`

make_clean

rm -rf $DEST_DIR

echo "AAAAAAAAAAAAAAAAA"
#wget http://www.linuxfromscratch.org/patches/blfs/svn/libxml2-2.9.10-security_fixes-1.patch
#patch -p1 -i libxml2-2.9.10-security_fixes-1.patch
echo "Configuring '$BUNDLE_NAME'."
CFLAGS="$CFLAGS" ./configure --prefix=/usr \
	    --disable-static \
            --with-history   \
            --with-python=/usr/bin/python3

echo "Building '$BUNDLE_NAME'."
make_target

echo "Installing '$BUNDLE_NAME'."
make_target install DESTDIR=$DEST_DIR

echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
