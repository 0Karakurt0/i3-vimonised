#! /bin/bash
# $1 - pipe
which jq > /dev/null || echo "jq is needed to run i3-last-action"
echo "start"
# Cleaning up
echo $(tail -n20 "$1") > "$1" ;

until false; do
    comand=$(i3-msg -t subscribe '["binding"]' | jq -r '.binding.command')
    # Filtering out all modes since we don't want to trigger on that
    [[ $comand =~ "delete"|"move:"|"go"|"resize"|"launch"|"window"|"system"|"i3:"|"go_workspace"|"move_workspace"|"player"|"sound"|"brightness"|"i3:"|"last_action" ]] || echo "$comand" >> $1
# There should be a better way than this ^^^^
done
