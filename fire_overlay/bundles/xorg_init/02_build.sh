#!/bin/sh

set -e

. ../../common.sh

cd `ls -d $OVERLAY_WORK_DIR/$BUNDLE_NAME/`

make_clean

rm -rf $DEST_DIR

echo "Preparing Xorg env"
mkdir $DEST_DIR/etc
export XORG_PREFIX="/usr"
export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc \
    --localstatedir=/var --disable-static"
cat > $DEST_DIR/etc/profile.d/xorg.sh << EOF
XORG_PREFIX="$XORG_PREFIX"
XORG_CONFIG="--prefix=\$XORG_PREFIX --sysconfdir=/etc --localstatedir=/var --disable-static"
export XORG_PREFIX XORG_CONFIG
EOF
chmod 644 $DEST_DIR/etc/profile.d/xorg.sh
echo "Xorg env setup finished!"
echo "Reducing '$BUNDLE_NAME' size."
reduce_size $DEST_DIR/usr/bin

install_to_overlay

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
