#! /bin/bash
time=$1
comand=$(tail -n 1 $2) # Getting last action from $last_action

until [ $time -le 1 ]; do
    sleep 0.1
    i3-msg $comand & disown
    time=$( expr $time - 1 )
done
