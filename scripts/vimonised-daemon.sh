#! /bin/bash
source $1

t=1
action_count=0
modes="$(i3-msg -t get_binding_modes | sed 's/\[\|\]\|,"default"//g' | sed 's/,/|/g')" # getting all modes so that it is called only once
echo "start"

until false; do
    sleep 0,05
    t=$( expr $t - 1 );
    repeat=$(cat $counter)
    echo -n "$t | $repeat | $action_count || "

    if [ $t -le 0 ]; then
        echo -n "trashbin pulse..."
        $script/i3-trashbin.sh daemon $Windows &
        t=300
    fi

    if [ $(cat "$last_action-raw" | wc -l) -ne $action_count ]; then
        action_count=$(cat "$last_action-raw" | wc -l)
        # Dirty hack to avoid using ionotify
        echo -n "last action save..."
        $script/i3-last-action.sh $1 $modes
    fi
    echo
done
