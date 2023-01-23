#! /bin/sh

lst_num="$1"
row="$(cat $2)"

i3-msg workspace number "$row$lst_num"

