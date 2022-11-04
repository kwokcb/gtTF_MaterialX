@echo off
if "%~1"=="" goto :usage

git submodule update --init --recursive
mkdir build
cd build
cmake -DMATERIALX_ROOT="%1" -DMATERIALX_TEST_RENDER=ON -G "Visual Studio 16 2019" -A "x64" -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
cmake --build . --target install --config RelWithDebInfo
ctest -VV --output-on-failure --build-config RelWithDebInfo -j1

REM cd ..
REM build\installed\bin\glTF2Mtlx --gltf ./resources/ABeautifulGame/glTF/ABeautifulGame.gltf --assignments
REM echo "-- Converstion to MTLTX from GLTF --" > conversion_log.txt
REM cat ./resources/ABeautifulGame/glTF/ABeautifulGame.gltf.mtlx >> conversion_log.txt

REM build\installed\bin\glTF2Mtlx --mtlx ./resources/ABeautifulGame/glTF/ABeautifulGame.gltf.mtlx 
REM echo "-- Converstion to GLTF from MTLX --" >> conversion_log.txt
REM cat ./resources/ABeautifulGame/glTF/ABeautifulGame.gltf.mtlx._converted.gltf >> conversion_log.txt
goto :eof

:usage
@echo Path to MaterialX install needs to be specified as first argument
exit /B 1


