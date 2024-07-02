rm -fr _bin
mkdir _bin

rm -fr _build
mkdir _build

pushd _build

qmake ../file.pro
make -j10

popd

cp file/magic/magic.mgc _bin/

sh makemgcc.sh
