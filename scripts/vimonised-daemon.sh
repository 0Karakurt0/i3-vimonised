#! /bin/bash
source $1
echo $(tail -n20 "$last_action") > "$last_action" ;
rm $last_action $counter $windows;
i3-msg -t subscribe '["binding"]' | jq -r '.binding.command' >> "$last_action-raw" &
mkdir /tmp/i3
touch $last_action $counter $windows
mkfifo $notify_bar
tail -f $notify_bar | $notify_bar_program

until false; do
    t=$( expr $t - 1 );
    repeat=$(cat $count)

    if [ $t -le 0 ]; then
        echo "trashbin pulse"
        $script/i3-trashbin.sh daemon $windows &
        t=10
    fi

    if [ $(cat "$last_action-raw" | wc -l) -ne $action_count ]; then
        action_count=$(cat "$last_action-raw" | wc -l)
        echo "last action save"
        $script/i3-last-action.sh "$last_action-raw" $last_action &

        if [ $repeat -gt 1 ]; then
            until [ $repeat -le 1 ]; do
                echo $repeat
                sleep 0.1
                i3-msg "$( tail -n 1 $2)" &
                repeat=$( expr $repeat - 1 )
            done
        fi
    fi

done
