#Configuration for i3 with vim philosophy
>├──d
>│  ├──[1-9]     starts a script to repeat next i3 command N times
>│  ├──p         delete parent
>│  ├──d         delete window
>│  ├──w         delete window
>│  ├──a         delete all windows on a workspace
>│  ├──n         delete notification
>│  └──N         delete all notifications
>│
>├──m
>│  ├──[1-9]     starts a script to repeat next i3 command N times
>│  ├──h         move left
>│  ├──j         move down
>│  ├──k         move up
>│  ├──l         move rught
>│  ├──t         move to ...
>│  │  └──?      move to window or container
>│  ├──s         move to workspace ...
>│  │  └──[1-9]  move to workspace number N
>│  ├──f         move focused window to floating (or back)
>│  └──m         toggle fulscreen
>│
>├──g
>│  ├──[1-9]     starts a script to repeat next i3 command N times
>│  ├──s         go to workSpace
>│  ├──w         go to Window
>│  ├──g         go to workspace 1
>│  ├──G         go to workspace 0
>│  ├──m         go to mark
>│  │  └──<mark>      
>│  ├──p         go to previous window 
>│  ├──n         go to next window 
>│  ├──f         go to floating (focus floating and back)
>│  ├──h         go left
>│  ├──j         go down
>│  ├──k         go up
>│  └──l         go rught
>│
>├──d
>│  ├──[1-9]     starts a script to repeat next i3 command N times
>│  ├──p         delete parent
>│  ├──d         delete window
>│  ├──w         delete window
>│  ├──a         delete all windows on a workspace
>│  ├──n         delete notification
>│  └──N         delete all notifications
>├──d
>│  ├──[1-9]     starts a script to repeat next i3 command N times
>│  ├──p         delete parent
>│  ├──d         delete window
>│  ├──w         delete window
>│  ├──a         delete all windows on a workspace
>│  ├──n         delete notification
>│  └──N         delete all notifications
>├──d
>│  ├──[1-9]     starts a script to repeat next i3 command N times
>│  ├──p         delete parent
>│  ├──d         delete window
>│  ├──w         delete window
>│  ├──a         delete all windows on a workspace
>│  ├──n         delete notification
>│  └──N         delete all notifications
  Delete 
  dw(window), dd (parent), da(all), dn(notification), dN(all notifications)
  
  Move:
  mh, mj, mk, ml, mf(to floating)
  
  Go:
  gh, gj, gk, gl, gp(previous), gn(next), gf(to floating)
  
  lt(launch terminal)
  
  Resize:
  rNh, rNj, rNk, rNl where N in a number up to 2000
 
i, s, q, Return

Plans:
 - add mt, ms, gs, gw (moving between workspaces and windows)
 - maybe get rid of madness (resize modes) through i3-input (how???)
 - add more commands (which?)
