#! /bin/bash

source $1

comand=$(tail -n 1 $last_action)
exe=$( echo $comand | sed 's/left/right/;t;s/right/left/;t;s/up/down/;t;s/down/up/;t;s/hide/show/;t;s/show/hide/;t;')
echo $exe

i3-msg $exe



