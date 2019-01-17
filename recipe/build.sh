#!/bin/bash

export CFLAGS="-g -O2 -fPIC $CFLAGS"

if [[ "$(uname)" == MINGW* ]]; then
    CC=cl.exe
else
    export CFLAGS="-g -O2 -fPIC $CFLAGS"
fi

chmod +x autogen.sh
./autogen.sh
chmod +x configure
./configure --prefix="$PREFIX"

make -j${CPU_COUNT}
make check
make install
