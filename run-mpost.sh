#!/usr/bin/env bash

set -e

done_fn="$1"
pic_name="$2"
mpost_cmd="$3"
shift 3 || true
mkdir -p generated
cd generated
log_file="run_mpost.log"
ln -sf ../$pic_name .
if ! $mpost_cmd "$@" "$pic_name" > $log_file 2>&1 ; then
    echo "There was an error processing command:"
    echo "    $mpost_cmd $@" "$pic_name"
    echo "Removing output files"
    echo "==================================== MPOST ERROR LOG ===="
    cat $log_file
    echo "==================================== END ================"
    exit 1
fi
touch $done_fn
