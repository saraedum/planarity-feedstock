#!/bin/bash

export CFLAGS="-g -O2 -fPIC $CFLAGS"

if [[ "$(uname)" == MINGW* ]]; then
    CC=cl.exe
    LD=link.exe
else
    export CFLAGS="-g -O2 -fPIC $CFLAGS"
fi

chmod +x autogen.sh
./autogen.sh
chmod +x configure
./configure --prefix="$PREFIX"

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check
fi
make install
