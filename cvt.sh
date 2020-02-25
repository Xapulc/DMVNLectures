#!/usr/bin/env bash

cmake_files="$(find . -name 'CMakeLists.txt')"
for cmf in $cmake_files ; do
    python ./convert.py "$cmf"
done
