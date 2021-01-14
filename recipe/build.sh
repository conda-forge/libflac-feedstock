#!/bin/bash

cmake ${CMAKE_ARGS} -D CMAKE_BUILD_TYPE=Release     \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=lib     \
      -D BUILD_SHARED_LIBS=ON         \
      -D BUILD_EXAMPLES=OFF           \
      -D BUILD_DOXYGEN=OFF            \
      $SRC_DIR

make install -j${CPU_COUNT}
