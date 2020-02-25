#!/usr/bin/env bash

function subdirs_generate() {
    for dir in $(ls -1)
    do
        if test -d "$dir" ; then
            echo "add_subdirectory(${dir})"
        fi
    done
}

function clean_cmake() {
    find . -name "CMakeFiles" -exec rm -rf {} +
    find . -name "*.cmake" -exec rm -fr {} +
    find . -name "Makefile" -exec rm -fr {} +
    find . -name "CMakeCache.txt" -exec rm -fr {} +
}
