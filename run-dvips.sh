#!/bin/bash
set -e
dvips_cmd="$1"
shift
mkdir -p generated
cd generated
log_file="run_dvips.log"
if ! $dvips_cmd "$@" > $log_file 2>&1 ; then
    echo "There was an error processing command:"
    echo "    $dvips_cmd $@"
    echo "Removing output files"
    rm -f *.ps
    echo "==================================== DVIPS ERROR LOG ===="
    cat $log_file
    echo "==================================== END ================"
    exit 1
fi
