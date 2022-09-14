setlocal EnableDelayedExpansion

cmake -G "NMake Makefiles" ^
  -D CMAKE_BUILD_TYPE=Release ^
  -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -D BUILD_SHARED_LIBS=ON ^
  -D BUILD_EXAMPLES=OFF ^
  -D BUILD_DOXYGEN=OFF ^
  -D INSTALL_MANPAGES=off ^
  %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
