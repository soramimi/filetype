#!/usr/bin/bash

pushd file

cp /usr/share/libtool/build-aux/ltmain.sh .

autoheader
aclocal
automake -a -c
autoconf
./configure

make -j10

popd

