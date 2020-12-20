#! /bin/bash
start=$(cat $2 | wc -l)
until [ ! $start == $(cat $2 | wc -l) ]
do
    echo "waiting"
    sleep 0.3
done

times=${1:=1}

until [ $times -le 1 ]; do
    echo $times
    sleep 0.1
    i3-msg "$( tail -n 1 $2)"
    times=$( expr $times - 1 )
done
