rm -fr _build
mkdir _build
pushd _build

qmake ../staticlib.pro
make

popd

