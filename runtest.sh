#!/bin/sh


set -ex

cd fire_overlay
echo "******************************"
echo "***** glibc_full TEST BEGIN *****"
echo "******************************"
./overlay_clean.sh
./overlay_build.sh glibc_full
echo "****************************"
echo "***** glibc_full TEST END *****"  
echo "****************************"

for bundle in `ls bundles` ; do
  echo "******************************"
  echo "***** $bundle TEST BEGIN *****"
  echo "******************************"
  ./overlay_clean.sh
  ./overlay_build.sh $bundle
  echo "****************************"
  echo "***** $bundle TEST END *****"  
  echo "****************************"
done

