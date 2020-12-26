#! /bin/bash
case $1 in
    [0-9]) echo $1 > $2;;

    *)
    time=$2
    comand=$(tail -n 1 $1) # Getting last action from $last_action

    until [ $time -le 1 ]; do
        sleep 0.1
        i3-msg $comand & disown
        time=$( expr $time - 1 )
    done
    echo 0 > $3
    ;;

esac
