#! /bin/bash
file=${1:=/etc/i3/config}
lines=$(cat $file)
IFS=$'\n'
for line in $lines
do
    echo $line
    [[ $line =~ "set" ]] && echo $line | sed -r 's/set\s+\$(\S+)\s+(.+)$/\1="\2"/' >> $2
done
