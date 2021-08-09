#! /bin/dash
mpd_dir="$HOME/Music"
cd  "$mpd_dir"
file="./$1"
size="$2"
image=$(ffmpeg -loglevel -8 -i "$file" -f image2pipe pipe:1     |\
    catimg -w $size -)
eval  $(ffmpeg -loglevel -8 -i "$file" -f ffmetadata pipe:1     |\
    sed -n '/^;/d; s/$/"/; s/=/\n="/;p'                         |\
    sed -n '1~2{s/ \|-/_/g; N;s/\n//;p}')

entry(){
    line="$1"
    length=$( echo "$1" | wc -m )
    offset=$(( (size - length) / 2 ))
    for n in $( seq 0 $offset ); do
        echo -n " "
    done
    echo "$line"
}

echo "$image"
if [ -z "$artist" -a -z "$title" ]; then
    entry "$(basename "$1")"
else
    entry "$artist - $title"
fi
entry "$album №$track"
entry "$genre"
entry "$date"
