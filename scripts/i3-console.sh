#! /bin/bash
msg=0
until false; do
if [ $msg -ne 0 ]; then
    echo -n "Press Enter to continue or write a comand to continue"
    msg=0
else
    echo -n ":"
fi
read comand
comand1="$(echo $comand | cut -c 2- )"
[ ! $comand ] && clear ;

case "$( echo $comand | cut -c 1 )" in
    !) msg=1; i3-msg '[con_mark="console"] fullscreen' &&  $SHELL -c "$comand1";;
    q) i3-msg exit;;
    w) i3-msg exit;;
    r) i3-msg restart;;
    c) i3-msg reload;;
    *) i3-msg "$comand";;
esac
done
