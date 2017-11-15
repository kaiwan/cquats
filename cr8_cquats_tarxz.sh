#!/bin/bash
# cr8_cquats_tarxz.sh
# 
# Last Updated :
# Created      :
# 
# Author:
# Kaiwan N Billimoria
# kaiwan -at- kaiwantech -dot- com
# kaiwanTECH
# 
# License:
# MIT License.
# 
name=$(basename $0)
CQUATS_SRC=/home/kai/cquats/src

tarit()
{
tar cJf $1 --directory=${CQUATS_SRC}/ . || {
  echo "Oops!" ; exit 1
}
ls -lh $1
  # (c)reate (J)xz-compression (f)iles-follow
}

##### 'main' : execution starts here #####

[ $# -ne 1 ] && {
  echo "Usage: ${name} pathname-to-cquats.tar.xz"
  exit 1
}
cd ${CQUATS_SRC}/kbuild
# mconf is the binary executable used for the 'menuconfig' target
rm -f .config*
make distclean   #mrproper
rm -f scripts/kconfig/mconf
cd -

tarit $1

exit 0
