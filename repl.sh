#!/usr/bin/env bash
set -xe
filez=$(find . -name 'CMakeLists.txt')
for c in $filez ; do
    if ! grep -qi mmtodo $c ; then
        continue
    fi
    d=$( dirname $c | cut -c 3- )
    sed -i -e "s:Add $d:Add:" $c
    echo $d
    echo $c
    echo '==='
done
