copy "%RECIPE_DIR%\CMakeLists.txt" .

mkdir build
cd build

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      ..

cmake --build . --target install --config Release
