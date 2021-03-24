---
title: 'weechat setup'
date: 201811162311.30
tags:
- 'irc'
- 'linux'
- 'weechat'
---

so you decided to switch from irssi to weechat?

what options do you need to set? what plugins? what scripts?

i'll go over some of the most essential of these, and share my full
configs.

------------------------------------------------------------------------

## options

-   `logger.level.irc` the default is 9, which includes joins and parts.
    in most cases you can set this to 3, which only includes messages
-   `weechat.look.buffer_notify_default` the default here is "all",
    which will add joins and parts to your hotlist. set it to "message".
-   `weechat.look.confirm_quit` set this to on. you'll thank me when you
    type `/quit` and mean `/close`
-   `weechat.look.highlight` add a comma-separated list of names/terms
    you'd like to trigger a highlight here
-   `weechat.look.prefix_align_max` set this to something between 10
    and 20. otherwise, long nicks will crush your available screen real
    estate.
-   `buflist.format.indent` try something like
    `${color:237}${if:${buffer.next_buffer.local_variables.type}=~^(channel|private)$?├:└}`
-   `buflist.format.number` if you want to skip the . or space after the
    number, set it to `${color:green}${number}`
-   `irc.look.color_nicks_in_names` set this to on
-   `irc.look.color_nicks_in_nicklist` set this to on
-   `irc.look.server_buffer` set this to independent to prevent
    automatic merges with the core weechat buffer. especially useful if
    you plan on using
    [autosort.py](https://weechat.org/scripts/source/autosort.py.html/)
-   `irc.server_default.autoconnect` set this to on so you don't have to
    set it for every new network you add.

## scripts

these scripts can be managed with the built in `/script` tool. press i,
then enter on the selected script to install it.

-   [highmon.pl](https://weechat.org/scripts/source/highmon.pl.html/) -
    set aside a buffer to list the places your nick has been mentioned
-   [colorize\_nicks.py](https://weechat.org/scripts/source/colorize_nicks.py.html/) -
    show nicks in chat with colors
-   [go.py](https://weechat.org/scripts/source/go.py.html/) - fuzzy
    quick jump by buffer number of channel name
-   [autojoin.py](https://weechat.org/scripts/source/autojoin.py.html/) -
    use `/autojoin --run` to save all the channels you're currently in
    to be autojoined the next time you start weechat
-   [autosort.py](https://weechat.org/scripts/source/autosort.py.html/) -
    use this script in tandem with irc.look.server\_buffer=independent
    to keep you channel and server list in order
-   [colorize\_lines.pl](https://weechat.org/scripts/source/colorize_lines.pl.html/) -
    i use this script to highlight the entire line of messages i've been
    mentioned in. check the options in the source or with
    `/help colorize_lines`
-   [grep.py](https://weechat.org/scripts/source/grep.py.html/) -
    quickly search history and buffers with `/grep`

## the rest of my configs

you can find the rest of my configs
[here](https://tildegit.org/ben/dotfiles/src/branch/master/weechat/.weechat).

if you have any questions, feel free to ping me on irc. i'm benharri on
freenode and ben on [tilde.chat](https://tilde.chat)

## screenshot

here's a screenshot of my current configs

![](https://bhh.sh/pub/screenies/weechat.png)

## bonus

if you have an existing setup, you can check the config changes you've
made with `/set diff`

additionally, feel free to [use my
.gitignore](https://tildegit.org/ben/dotfiles/src/branch/master/weechat/.weechat/.gitignore),
add your ~/.weechat to source control, and compare.

hope you've enjoyed customizing your weechat!

tags: [irc](tag_irc.html), [linux](tag_linux.html),
[weechat](tag_weechat.html)
