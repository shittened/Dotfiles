#! /bin/bash

for input in $(ls)
do
    output="$(echo $input | awk -F '.svg' '{print $1}')"
    echo $output
    inkscape $input --export-type=png --export-filename=$output --export-dpi=300
done
