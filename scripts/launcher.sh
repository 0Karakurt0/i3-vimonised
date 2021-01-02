#! /bin/bash
i3-msg -t get_config | sed -E ':st;n;s/set\s+\$(\S+)\s+(.+)$/\1="\2"/g;tst;q;' | sed 's/ \+"$/"/' > $1
source $1
echo "...got environment"

# Creating what's needed
mkdir -p $(dirname $last_action) $(dirname $counter) $(dirname $Windows)
touch $last_action $counter $windows
mkfifo "$notify_bar"
echo "...created workfiles"

# Cleaning
echo 0 > $counter
echo 0 > $last_action
echo 0 > $last_action-raw
killall vimonised_daemon.sh
killall jq
killall tail
echo "...cleaned before start"
[ $2 == "clear" ] && exit

# Main daemon
$script/vimonised_daemon.sh $1 &
echo "...started main daemon"

# Sub-daemons
i3-msg -m -t subscribe '["binding"]' | stdbuf -i0 -o0 -e0 jq -r '.binding.command' >> "$last_action-raw" &
tail -f "$notify_bar" | $notify_bar_program &

echo "Sucsesfully started!"
