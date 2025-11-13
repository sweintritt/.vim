#!/bin/bash

target=min.vim
add() {
    filename=$1
    echo "\"----------------------------------------------------------------------------------" >> $target
    echo "\"- $filename" >> $target
    echo "\"----------------------------------------------------------------------------------" >> $target
    cat $filename >> $target
    echo "\"----------------------------------------------------------------------------------" >> $target
    echo "" >> $target
    echo "" >> $target
}

# clear file
echo "" > min.vim

add first.vim
add functions.vim
add baseline.vim
add settings.vim
add mappings.vim
