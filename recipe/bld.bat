copy "%RECIPE_DIR%\CMakeLists.txt" .

mkdir build
cd build

REM This is a fix for a CMake bug where it crashes because of the "/GL" flag
REM See: https://gitlab.kitware.com/cmake/cmake/issues/16282
set "CFLAGS=-MD"

set "BUILD_SHARED_LIBS=no"

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_SHARED_LIBS=%BUILD_SHARED_LIBS% ^
      ..

cmake --build . --target install --config Release
