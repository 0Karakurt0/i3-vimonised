#! /bin/bash
source $1
case $3 in
    get) i3-msg $(tail -n 1 "$last_action");;
    *)
    #touch "$last_action-raw-" "$last_action-"
    comand=$(tail -n 1 $last_action-raw)
    repeat=$(tail -n 1 $counter)

    # Filtering out all modes since we don't want to trigger on that
    if [[ ! ( $comand =~ $2 || $comand =~ "counter" ) || $comand =~ "i3-resizer.sh \w" ]]; then
            echo "valid action!"
            echo "$comand" >> $last_action

            # Making repeat function work
            if [ $repeat -gt 1 ]; then
                echo "repeating $repeat"
                $script/i3-repeater.sh $last_action $repeat $counter &
            fi
    fi
    ;;
esac

#list1=$(cat $last_action-raw)
#list2=$( cat $last_action)
#[ $(wc -l $last_action-raw | sed 's/ .*$//') -gt 100 ] && tail -n 20 $last_action-raw > $last_action-raw- && mv $last_action-raw- $last_action-raw
#[ $(wc -l $last_action | sed 's/ .*$//') -gt 100 ] && tail -n 20 $last_action > $last_action- && mv $last_action- $last_action
