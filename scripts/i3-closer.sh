#! /bin/sh
steps=5
eval $( i3-msg -t get_tree | jq -r '..|try select(.focused == true)| "window_x=\(.rect.x)\nwindow_y=\(.rect.y)\nwindow_width=\(.rect.width)\nwindow_height=\(.rect.height)"')
i3-msg -q mark test
step_x=$(( ( $window_width - 50 ) / $steps ))
step_y=$(( ( $window_height - 50 ) / $steps ))
halfstep_x=$(( $step_x / 2 ))
halfstep_y=$(( $step_y / 2 ))
i3-msg "open ; mark placeholder ;\
        [ con_mark="placeholder" ] floating enable ;\
        [ con_mark="placeholder" ] swap with mark test;\
        [ con_mark="test" ] resize set $window_width $window_height ;\
        [ con_mark="test" ] move absolute position $window_x $window_y"
for i in $(seq 1 $steps ); do
    i3-msg -q "[ con_mark="test" ] resize shrink width  $step_x ;\
               [ con_mark="test" ] move right $halfstep_x ;\
               [ con_mark="test" ] resize shrink height $step_y ;\
               [ con_mark="test" ] move down  $halfstep_y"
done
i3-msg -q "[ con_mark="test" ] kill ;\
           [ con_mark="placeholder" ] kill"
