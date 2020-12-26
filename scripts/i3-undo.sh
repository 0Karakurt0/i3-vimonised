#! /bin/bash

source $1

comand=$(tail -n 1 $last_action)

case $comand in
    trashbin) echo "$comand" | sed 's/hide/show/' > "$last_action-t";;


esac
