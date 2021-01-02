#! /bin/bash
# $1 - command
# $2 - "storage"
number=$(cat $2)
case $1 in
    h) i3-msg resize shrink width $number; echo 0 > $2 ;;
    j) i3-msg resize shrink height $number; echo 0 > $2 ;;
    k) i3-msg resize grow height $number; echo 0 > $2 ;;
    l) i3-msg resize grow width $number; echo 0 > $2 ;;
    [0-9]) number="$number$1"; # Adding digit
           echo $number > $2 ;;
esac
