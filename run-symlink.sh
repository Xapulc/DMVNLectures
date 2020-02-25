#!/usr/bin/env bash

set -e

function link_files() {
    linked_files="../$1"
    for f in $linked_files ; do
        if ! [ -e "$f" ] ; then
            return 0
        fi
        if ! [ -e ./$(basename "$f") ] ; then
            ln -sf "$f" .
        fi
    done
}

mkdir -p generated
cd generated
for i in $@ ; do
    link_files "$i"
done

touch symlink.done
