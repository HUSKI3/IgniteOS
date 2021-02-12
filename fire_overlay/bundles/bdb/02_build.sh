#!/bin/sh

set -e

. ../../common.sh

cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/db-*`

make_clean

rm -rf $DEST_DIR

# Apply patch (from Beyond-LFS)
sed -i 's/\(__atomic_compare_exchange\)/\1_db/' src/dbinc/atomic.h

echo "Configuring '$BUNDLE_NAME'."
cd build_unix
CFLAGS="$CFLAGS" ../dist/configure --prefix=/usr      \
                  --enable-compat185 \
                  --enable-dbm       \
                  --disable-static   \
                  --enable-cxx

# Change ownerships (?? - Requires testing)
chown -v -R root:root                        \
      /usr/bin/db_*                          \
      /usr/include/db{,_185,_cxx}.h          \
      /usr/lib/libdb*.{so,la}                \
      /usr/share/doc/db-5.3.28

echo "Building '$BUNDLE_NAME'."
make_target

echo "Installing '$BUNDLE_NAME'."
make_target install DESTDIR=$DEST_DIR

echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
