#! /bin/bash
# $1 - command
# $2 - "storage"
number=$(cat $2)

eval $( \
    i3-msg -t get_outputs \
    | jq -r '.[0]| "width=\(.rect.width)\nheight=\(.rect.height)\nworkspace=\(.current_workspace)"' \
)
prcH=$(( height / 100 ))
prcW=$(( width / 100 ))
echo "$prcH | $prcW | $number | $height | $width"


case $1 in
    h) prct=$(( number * prcY ))
       i3-msg resize shrink width $prct
       echo $prct
       echo > $2 ;;
    j) prct=$(( number * prcH ))
       i3-msg resize shrink height $prct
       echo $prct
       echo > $2 ;;
    k) prct=$(( number * prcH ))
       i3-msg resize grow height $prct
       echo $prct
       echo > $2 ;;
    l) prct=$(( number * prcY ))
       i3-msg resize grow width $prct
       echo $prct
       echo > $2 ;;
    [0-9]) number="$number$1"; # Adding digit
           echo $number > $2 ;;
esac
