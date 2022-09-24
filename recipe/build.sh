#!/bin/bash

set -ex

# The pandoc package is required for building the manpages,
# but it is not available currently for ppc64le.

if [[ $target_platform == linux-ppc64le ]]; then
    EXTRA_MANPAGES_OPT="-D INSTALL_MANPAGES=off"
fi


cmake ${CMAKE_ARGS} -D CMAKE_BUILD_TYPE=Release     \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=lib     \
      -D BUILD_SHARED_LIBS=ON         \
      -D BUILD_EXAMPLES=OFF           \
      $EXTRA_MANPAGES_OPT             \
      $SRC_DIR

make -j${CPU_COUNT}

make install
