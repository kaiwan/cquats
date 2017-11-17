#!/bin/bash
# prep_cquats_src.sh

CQSRC=src/
CQTAR=cquats_src.tar.xz

## clean up kbuild/
cd ${CQSRC}/kbuild
rm -f .config* .tmpconfig*
make distclean
# mconf is the binary executable used for the 'menuconfig' target
rm -f scripts/kconfig/mconf
cd - >/dev/null

echo "[+] tar-ring folder \"${CQSRC}\" to \"${CQTAR}\" now ..."
tar cJf ${CQTAR} --directory=${CQSRC}/ . || {
  # (c)reate (J)xz-compression (f)iles-follow
  echo "Oops! tar cJf failed" ; exit 1
}
ls -lh $1 ${CQTAR}
exit 0
