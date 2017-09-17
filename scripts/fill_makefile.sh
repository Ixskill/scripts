#!/usr/bin/env bash

dirlist=$(ls srcs)

for dir in $dirlist
do
	entrylist=$(ls srcs/$dir)
	for entry in $entrylist
	do
		echo $dir/$entry
	done
done
