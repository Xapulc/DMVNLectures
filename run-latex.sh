#!/usr/bin/env bash

set -e

source_file="$1"
shift

latex_cmd="$1"
shift

function link_mask() {
    linked_files="../*.$1"
    for f in $linked_files ; do
        if ! [ -e "$f" ] ; then
            return 0
        fi
        if ! [ -e ./$(basename "$f") ] ; then
            ln -sf "$f" .
        fi
    done
}

function run_latex_iteration() {
    index_file="$(echo $source_file | sed -re 's/\.tex$/.ind/')"
    touch "$index_file"
    source_for_log="$(basename "$source_file")"
    log_file="run_latex.$source_for_log.$iteration.log"
    if ! $latex_cmd "$@" "$source_file" > $log_file 2>&1 ; then
        echo "There was an error processing command:"
        echo "    $latex_cmd $@"
        echo "Removing output files"
        rm -f *.dvi
        rm -f *.aux
        echo "==================================== LATEX ERROR LOG [$iteration]="
        cat $log_file
        echo "==================================== END ================"
        exit 1
    fi
}

mkdir -p generated
cd generated
link_mask "sty"
link_mask "tex"
link_mask "eps"

iteration=1
log_file="run_latex.log"
while true ; do
    run_latex_iteration "$@"
    if ! grep -q "Rerun" $log_file ; then
        break
    fi
    echo "  Rebuilding $@ to get proper xrefs"
    iteration=$((iteration + 1))
    if [ "$iteration" -gt "4" ] ; then
        echo "Something goes wrong with xref rebuilding, please check $log_file"
        exit 1
    fi
done

if [ -e "*.idx" ] ; then
    echo "Index files detected, running makeindex..."
    makeindex *.idx
fi

# obtain remaining warnings from last log
grep -i warning $log_file || true
grep -i overfull $log_file || true
