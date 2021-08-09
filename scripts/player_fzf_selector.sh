#! /bin/bash
mpc searchplay "$(mpc -f "[[%artist% - %title%]|[%file%]" playlist \
    | fzf -i +m \
    | sed 's/^.* - //')"


#-f "[%file%]"
    #--preview='~/.config/i3/scripts/music_previev.sh {} $FZF_PREVIEW_COLUMNS' \
    #--preview-window=right,60% \
