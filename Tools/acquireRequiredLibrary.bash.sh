#!/bin/bash
mkdir --parent Tools/Tools__temporary_working_directory/
cd Tools/Tools__temporary_working_directory/

# 取得 VCCL 函式庫來源程式碼
git clone https://github.com/Vdragon/Vdragons_C_CPP_Libraries_Collection.git
cd Vdragons_C_CPP_Libraries_Collection/Buildsystem_CMake
cmake ..
make
cp --force --recursive Build/Libraries/* ../../../../Libraries
cp --force --recursive Build/Library_headers/* ../../../../Library_headers
cd ../../../../
rm -rf Tools/Tools__temporary_working_directory
exit 0