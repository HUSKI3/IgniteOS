#!/bin/sh

set -e

. ../../common.sh

cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/apr-util*`

make_clean

rm -rf $DEST_DIR

echo "Configuring '$BUNDLE_NAME'."
CFLAGS="$CFLAGS" ./configure --prefix=/usr       \
            --with-apr=$OVERLAY_WORK_DIR/apr/apr-1.7.0/     \
            --with-gdbm=/usr    \
            --with-openssl=/usr \
	    --with-berkeley-db=$OVERLAY_WORK_DIR/bdb/db-5.3.28/build_unix/\
            --with-crypto


echo "Building '$BUNDLE_NAME'."
make_target

echo "Installing '$BUNDLE_NAME'."
make_target install DESTDIR=$DEST_DIR

echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
