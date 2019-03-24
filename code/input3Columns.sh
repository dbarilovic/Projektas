#!/bin/bash
args=("$@")
for fileName in "${args[@]}";
do
file="$fileName.columns"
cat $fileName | awk ' { print $1,$2,$3 }' >> $file
done
