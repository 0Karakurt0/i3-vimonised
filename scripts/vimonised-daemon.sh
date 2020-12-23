#! /bin/bash
# Getting varuables
i3-msg -t get_config | sed -E ':st;n;s/set\s+\$(\S+)\s+(.+)$/\1="\2"/g;tst;q;' | sed 's/ \+"$/"/' > $1
source $1
# Cleaning | Creating what's needed
mkdir -p $(basename $last_action) $(basename $counter) $(basename $windows)
touch $last_action $counter $windows
mkfifo "$notify_bar"
echo 0 > $counter
# Sub-daemons
i3-msg -m -t subscribe '["binding"]' | stdbuf -i0 -o0 -e0 jq -r '.binding.command' >> "$last_action-raw" &
tail -f "$notify_bar" | $notify_bar_program &

t=1
action_count=$(cat "$last_action-raw" | wc -l)
modes="$(i3-msg -t get_binding_modes | sed 's/\[\|\]\|,"default"//g' | sed 's/,/|/g')" # getting all modes so that it is called only once
echo "start"

until false; do
    sleep 0,05
    t=$( expr $t - 1 );
    repeat=$(cat $counter)
    echo "$t | $repeat | $action_count "

    if [ $t -le 0 ]; then
        echo "trashbin pulse"
        $script/i3-trashbin.sh daemon $Windows &
        t=300
    fi

    if [ $(cat "$last_action-raw" | wc -l) -ne $action_count ]; then
        action_count=$(cat "$last_action-raw" | wc -l)
        # Dirty hack to avoid using ionotify
        echo "last action save"
        $script/i3-last-action.sh $1 $modes
    fi
done
