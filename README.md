# Configuration for i3 with vim philosophy
```
├──d (delete)
│  ├──[1-9]?     starts a script to repeat next i3 command N times
│  ├──p✓         delete parent
│  ├──d✓         delete window
│  ├──w✓         delete window
│  ├──a✓         delete all windows on a workspace
│  ├──n✓         delete notification
│  └──N✓         delete all notifications
│
├──m (move)
│  ├──[1-9]?     starts a script to repeat next i3 command N times
│  ├──h✓         move left
│  ├──j✓         move down
│  ├──k✓         move up
│  ├──l✓         move rught
│  ├──t❌         move to ...
│  │  └──?       move to window or container
│  ├──s✓         move to workspace ...
│  │  └──[1-9]   move to workspace number N
│  ├──f✓         move focused window to floating (or back)
│  └──m✓         toggle fulscreen
│
├──g (go)
│  ├──[1-9]?     starts a script to repeat next i3 command N times
│  ├──s✓         go to workSpace
│  ├──w❌        go to Window
│  ├──g✓         go to workspace 1
│  ├──m✓         go to mark
│  │  └──<mark>      
│  ├──p✓         go to previous window 
│  ├──n✓         go to next window 
│  ├──f✓         go to floating (focus floating and back)
│  ├──h✓         go left
│  ├──j✓         go down
│  ├──k✓         go up
│  └──l✓         go rught
│
├──l (launch)
│  ├──[1-9]?     starts a script to repeat next i3 command N times
│  ├──t✓         launch Terminal
│  ├──f✓         launch Filemanager
│  ├──b✓         launch Browser
│  └──l✓         launch Launcher
│
├──s (system)
│  ├──[1-9]?     starts a script to repeat next i3 command N times
│  ├──s✓         toggle split
│  ├──m✓         dunstctl context ???
│  ├──r✓         restart i3
│  ├──L✓         lock screen
│  └──l✓         layout toggle
│
├──q✓            exit i3
├──r✓            resize window (launches i3-input)
│  └──<number>
│      ├──h✓     right
│      ├──j✓     down
│      ├──k✓     up
│      └──l✓     left
├──.?            repeat last action
├──M✓            Mark window
│  └──<mark>
├──G✓            go to workspace 0
└──l✓            layout toggle
```

## Plans:
 - find better keyloger than i3-input
 - make window finding work all the time
 - make choosing window by letters, not thriugh dmenu
 - make repeater ignore mode changes
 - add more commands (which?)
