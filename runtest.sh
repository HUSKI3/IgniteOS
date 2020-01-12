#!/bin/sh


set -ex

cd fire_overlay
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

