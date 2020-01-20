#!/bin/sh

set -e

SRC_DIR=$PWD
STATUS=xxx
TEMP_DIR=xxx
IGNITE_ISO=xxx

welcome() {
cat << CEOF

  ####################################################################
  #                                                                  #
  # Before generating the docker image, you need to generate the iso #
  #                                                                  #
  ####################################################################

CEOF
}

finalWords() {
cat << CEOF

  ##################################################################
  #                                                                #
  #     Ignite OS image 'igniteos.tgz' has been generated.         #
  #                                                                #
  #  You can import the Ignite image in Docker like this:          #
  #                                                                #
  #    docker import igniteos.tgz ingite-os:latest                 #
  #                                                                #
  #  Then you can run Ignite shell in Docker container like this:  #
  #                                                                #
  #    docker run -it igniteos /bin/sh                             #
  #                                                                #
  ##################################################################

CEOF
}

cleanup() {
  chmod -R ugo+rw $TEMP_DIR
  rm -rf $TEMP_DIR
}

buildImage() {
  rm -f $SRC_DIR/igniteos.tgz
  cd $TEMP_DIR/image_root
  tar -zcf $SRC_DIR/igniteos.tgz *
  cd $SRC_DIR
}

prepareImage() {
  mkdir $TEMP_DIR/image_root
  cp -r $TEMP_DIR/rootfs_extracted/* $TEMP_DIR/image_root

  if [ -d $TEMP_DIR/iso_extracted/minimal/rootfs ] ; then
  # Copy the overlay content.
  # With '--remove-destination' all possibly existing soft links in
  # '$TEMP_DIR/image_root' will be overwritten correctly.
    cp -r --remove-destination $TEMP_DIR/iso_extracted/minimal/rootfs/* \
      $TEMP_DIR/image_root
  fi
}

extractRootfs() {
  xz -d -k $TEMP_DIR/iso_extracted/rootfs.xz
  mkdir $TEMP_DIR/rootfs_extracted
  cp $TEMP_DIR/iso_extracted/rootfs $TEMP_DIR/rootfs_extracted
  cd $TEMP_DIR/rootfs_extracted
  cpio -F rootfs -i
  rm -f rootfs
  cd $SRC_DIR
}

extractISO() {
  xorriso -osirrox on -indev $IGNITE_ISO -extract / $TEMP_DIR/iso_extracted
  chmod ugo+rw $TEMP_DIR/iso_extracted
}

prepareTempDir() {
  if [ -d igniteos ] ; then
    chmod -R ugo+rw igniteos
    rm -rf igniteos
  fi

  TEMP_DIR=$SRC_DIR/igniteos
}

checkPrerequsites() {
  if [ "$1" = "" ] ; then
    if [ -f igniteos.iso ] ; then
      echo "Using 'igniteos.iso' ISO image."
      IGNITE_ISO=igniteos.iso
    else
      echo "ISO image 'igniteos.iso' does not exist. Cannot continue."
      exit 1
    fi
  elif [ ! -f "$1" ] ; then
    echo "Cannot locate ISO image `$1`. Cannot continue."
    exit 1
  else
    IGNITE_ISO=$1
  fi

  STATUS=OK

  if [ "`which docker`" = "" ] ; then
    STATUS=ERROR
    echo "ERROR: Cannot locate 'docker'."
  fi

  if [ "`which xorriso`" = "" ] ; then
    STATUS=ERROR
    echo "ERROR: Cannot locate 'xorriso'."
  fi

  if [ "$STATUS" = "ERROR" ] ; then
    echo "You have to install 'docker' and 'xorriso'. Cannot continue."
    exit 1
  fi
}

main() {
  welcome
  checkPrerequsites "$@"
  prepareTempDir
  extractISO
  extractRootfs
  prepareImage
  buildImage
  cleanup
  finalWords
}

main "$@"
