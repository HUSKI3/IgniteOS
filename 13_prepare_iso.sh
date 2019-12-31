#!/bin/sh

set -e

# Load common properties and functions in the current script.
. ./common.sh

init() {
  # Remove the old ISO generation area if it exists.
  echo "Removing old ISO image work area. This may take a while."
  rm -rf $ISOIMAGE

  echo "Preparing new ISO image work area."
  mkdir -p $ISOIMAGE
}

prepare_mll_bios() {
  # This is the folder where we keep legacy BIOS boot artifacts.
  mkdir -p $ISOIMAGE/boot

  # Now we copy the kernel.
  cp $KERNEL_INSTALLED/kernel \
    $ISOIMAGE/boot/kernel.xz

  # Now we copy the root file system.
  cp $WORK_DIR/rootfs.cpio.xz \
    $ISOIMAGE/boot/rootfs.xz
}

prepare_overlay() {
  # Now we copy the overlay content if it exists.
  if [ -d $ISOIMAGE_OVERLAY \
    -a ! "`ls $ISOIMAGE_OVERLAY`" = "" ] ; then

    echo "The ISO image will have overlay structure."
    cp -r $ISOIMAGE_OVERLAY/* $ISOIMAGE
  else
    echo "The ISO image will have no overlay structure."
  fi
}

prepare_boot_bios() {
  # Add the Syslinux configuration files for legacy BIOS and additional
  # UEFI startup script.
  #
  # The existing UEFI startup script does not guarantee that you can run
  # MLL on UEFI systems. This script is invoked only in case your system
  # drops you in UEFI shell with support level 1 or above. See UEFI shell
  # specification 2.2, section 3.1. Depending on your system configuration
  # you may not end up with UEFI shell even if your system supports it.
  # In this case MLL will not boot and you will end up with some kind of
  # UEFI error message.
  cp -r $SRC_DIR/minimal_boot/bios/* \
    $ISOIMAGE

  # Find the Syslinux build directory.
  WORK_SYSLINUX_DIR=`ls -d $WORK_DIR/syslinux/syslinux-*`

  # Copy the precompiled files 'isolinux.bin' and 'ldlinux.c32'. These files
  # are used by Syslinux during the legacy BIOS boot process.
  mkdir -p $ISOIMAGE/boot/syslinux
  cp $WORK_SYSLINUX_DIR/bios/core/isolinux.bin \
    $ISOIMAGE/boot/syslinux
  cp $WORK_SYSLINUX_DIR/bios/com32/elflink/ldlinux/ldlinux.c32 \
    $ISOIMAGE/boot/syslinux
}

# Genrate 'El Torito' boot image as per UEFI sepcification 2.7,
# sections 13.3.1.x and 13.3.2.x.
prepare_boot_uefi() {
  # Add the Syslinux configuration files for legacy BIOS and additional
  # UEFI startup script.
  #
  # The existing UEFI startup script does not guarantee that you can run
  # MLL on UEFI systems. This script is invoked only in case your system
  # drops you in UEFI shell with support level 1 or above. See UEFI shell
  # specification 2.2, section 3.1. Depending on your system configuration
  # you may not end up with UEFI shell even if your system supports it.
  # In this case MLL will not boot and you will end up with some kind of
  # UEFI error message.
  cp -r $SRC_DIR/minimal_boot/bios/* \
    $ISOIMAGE

  # Find the Syslinux build directory.
  WORK_SYSLINUX_DIR=`ls -d $WORK_DIR/syslinux/syslinux-*`

  # Copy the precompiled files 'isolinux.bin' and 'ldlinux.c32'. These files
  # are used by Syslinux during the legacy BIOS boot process.
  mkdir -p $ISOIMAGE/boot/syslinux
  cp $WORK_SYSLINUX_DIR/bios/core/isolinux.bin \
    $ISOIMAGE/boot/syslinux
  cp $WORK_SYSLINUX_DIR/bios/com32/elflink/ldlinux/ldlinux.c32 \
    $ISOIMAGE/boot/syslinux
}


check_root() {
  if [ ! "$(id -u)" = "0" ] ; then
    cat << CEOF

  ISO image preparation process for UEFI systems requires root permissions
  but you don't have such permissions. Restart this script with root
  permissions in order to generate UEFI compatible ISO structure.

CEOF
    exit 1
  fi
}

echo "*** PREPARE ISO BEGIN ***"

# Read the 'FIRMWARE_TYPE' property from '.config'
FIRMWARE_TYPE=`read_property FIRMWARE_TYPE`
echo "Firmware type is '$FIRMWARE_TYPE'."

case $FIRMWARE_TYPE in
  bios)
    init
    prepare_boot_bios
    prepare_mll_bios
    prepare_overlay
    ;;

  uefi)
    init
    prepare_boot_bios
    prepare_mll_bios
    prepare_overlay
    ;;

  both)
    check_root
    init
    prepare_boot_uefi
    prepare_boot_bios
    prepare_mll_bios
    prepare_overlay
    ;;

  *)
    echo "Firmware type '$FIRMWARE_TYPE' is not recognized. Cannot continue."
    exit 1
    ;;
esac


cd $SRC_DIR

echo "*** PREPARE ISO END ***"
