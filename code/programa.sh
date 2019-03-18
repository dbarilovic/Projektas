#!/bin/bash
args=("$@")
for fileName in "${args[@]}";
do
file="$fileName.filtered"
cat $fileName | awk '$6 == "CG" { print $0 }' >> $file
done
