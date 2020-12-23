#! /bin/bash
# $1 - operation
# $2 - list file, aka database
# $3 - time
time=$3
[ -z "$2" ] && echo "I need storage file" && exit 1

case $1 in
    hide)
        pid=$(xdotool getwindowpid $(xdotool getwindowfocus))
        id=$(i3-msg -t get_tree | jq -r '..|try select(.focused == true)|.window')
        i3-msg "[id=$id] move scratchpad"
        # Freezing window
        kill -19 $pid
        # Saving window info
        echo "id=$id;pid=$pid;time=$time" >> $2;;

    show)
        # Getting window
        eval $(tail -n 1 "$2")
        # Removing window from list
        sed -i '$ d' "$2"
        # Unfreezing window
        kill -18 $pid
        i3-msg '[id=$id] scratchpad show' ;;

    daemon)
        # Creating tmp file. Yep, tmp tmp file ;)
        touch "$2_"
        for window in $(cat "$2")
        do
             # Getting window parameters
             eval $window
             time=$(expr "$time" - 1 )
             if [ $time -le 0 ]
             then
                 i3-msg "[id=$id] kill"
                 # Unfreezing window to so that it reacts to "kill" signal
                 kill -18 $pid
                 echo "killed window $id"
                 continue
             fi
             echo "id=$id;pid=$pid;time=$time" >> "$2_"
        done
        # Updating main list
        mv "$2_" "$2"
        echo "Windows updated"
        ;;

esac
