#!/bin/bash

set -ex

cmake ${CMAKE_ARGS} -D CMAKE_BUILD_TYPE=Release     \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=lib     \
      -D BUILD_SHARED_LIBS=ON         \
      -D BUILD_EXAMPLES=OFF           \
      $SRC_DIR

make -j${CPU_COUNT}

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
    ctest -V
fi

make install
