# Configuration for i3 with vim philosophy

## Why?
Why not, actually?
Even though it started as a joke in one of my Linux chats, it failed to cease into nothingness after I tried it for a bit.
I believe there is something to it, and that is what keeps this project going.
Now this is my starting point for Devim (read like devil, pun intended) - Desktop Environment with Vim In Mind, who's optimal goal would be to apply vim's way for "speaking to computer" to everything I will get my hands onto.

## Vim Philosophy
> The "Zen" of vi is that you're speaking a language
                                Jim Dennis
Many applications claim to be vim-like after just adding hjkl and that sickens me. One of the intentions behind i3-vimonised was to have an example I can point to, where "vim-like" actually means anything. And it also is a part of my own jorney to explore and learn vi ways.
What's wrong with just hjkl? That it is misleading. If a person knows vim enough, hearing "vim-like" establishes an expectation of suttle interconnection of all hotkeys in an application that has some sort of a meaning behind it, that you can *understand* and not learn. A *language* to be spoken to computer, sort of. 
I won't go deeper into that here, but I strongly recommend a talk "Mastering the Vim Language" by Chris Toomey.

So...
## How it works
To preform an action, all you need to do is to "convert it into words". All hotkeys are starting with a "verb", that defines an action, followed by the "noun" that defines the subject of that action. Betwen or before them can be inserted a number that quantifies repeats of that action. Some keys see that number as an argument, where you expect it to be (as in resizing, for example).

##### Verbs:
 - Change
 - Delete
 - Go
 - Move
 - Open
 - Set
 - Toggle

##### Nouns:
 - Window
 - Manager
 - workspAce
 - Player

All of them are in development, so the best place to read about them is configuration file itself.

