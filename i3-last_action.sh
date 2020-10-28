#! /bin/bash
case $1 in
    --start)
        until false; do
            i3-msg -t subscribe '["binding"]' | jq -r '.binding.command' | tee -a "$2"
        done ;;
    --clear) tail -n20 "$2" | >/dev/null tee "$2" ;
        killall i3-last_action.sh;;
    --get) cat $2 | tac | grep -v "i3-last_action" | head -n 1 ;;
esac
