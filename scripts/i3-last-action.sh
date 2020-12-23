#! /bin/bash
source $1
#touch "$last_action-raw-" "$last_action-"
comand=$(tail -n 1 $last_action-raw)
repeat=$(tail -n 1 $counter)

# Filtering out all modes since we don't want to trigger on that
if [[! $comand =~ $2 ]]; then
    echo "$comand" >> $last_action

    if [ $repeat -gt 1 ]; then
        ( $script/i3-repeater.sh $repeat $last_action $counter ) &
        echo 0 > $counter
    fi

fi

#list1=$(cat $last_action-raw)
#list2=$( cat $last_action)
#[ $(wc -l $last_action-raw | sed 's/ .*$//') -gt 100 ] && tail -n 20 $last_action-raw > $last_action-raw- && mv $last_action-raw- $last_action-raw
#[ $(wc -l $last_action | sed 's/ .*$//') -gt 100 ] && tail -n 20 $last_action > $last_action- && mv $last_action- $last_action
