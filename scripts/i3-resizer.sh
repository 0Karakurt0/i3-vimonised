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
echo -n " $height -> $prcH |$width -> $prcW ==> $number -> "


case $1 in
    h) prct=$(( number * prcW ))
       echo $prct
       i3-msg resize shrink width $prct
       echo > $2 ;;
    j) prct=$(( number * prcH ))
       echo $prct
       i3-msg resize shrink height $prct
       echo > $2 ;;
    k) prct=$(( number * prcH ))
       echo $prct
       i3-msg resize grow height $prct
       echo > $2 ;;
    l) prct=$(( number * prcW ))
       echo $prct
       i3-msg resize grow width $prct
       echo > $2 ;;
    [0-9]) echo "$number$1"
           echo "$number$1" > $2 ;; # Adding digit
esac
