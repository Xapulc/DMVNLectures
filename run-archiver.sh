#!/bin/bash
set -e
archiver_cmd="$1"
shift
mkdir -p generated
log_file="generated/run_archiver.log"
if ! $archiver_cmd "$@" > $log_file 2>&1 ; then
    echo "There was an error processing command:"
    echo "    $archiver_cmd $@"
    echo "Removing output files"
    rm -f generated/*.rar
    rm -f generated/*.7z
    echo "==================================== ARCHIVER ERROR LOG ="
    cat $log_file
    echo "==================================== END ================"
    exit 1
fi
