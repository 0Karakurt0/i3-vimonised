#! /bin/bash
# $1 - pipe
    comand=$(tail -n 1 $1)
    # Filtering out all modes since we don't want to trigger on that
    [[ $comand =~ "delete"|"move:"|"go"|"resize"|"launch"|"window"|"system"|"i3:"|"go_workspace"|"move_workspace"|"player"|"sound"|"brightness"|"i3:"|"last_action" ]] || echo "$comand" >> $2
# There should be a better way than this ^^^^
