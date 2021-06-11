# QBBR dotfiles

	  ____  ____  ____  _____
	 / __ \|  _ \|  _ \|  __ \
	| |  | | |_) | |_) | |__) |
	| |  | |  _ <|  _ <|  _  /
	| |__| | |_) | |_) | | \ \
	 \___\_\____/|____/|_| _\_\
	     _       _    __ _ _
	  __| | ___ | |_ / _(_) | ___  ___
	 / _` |/ _ \| __| |_| | |/ _ \/ __|
	| (_| | (_) | |_|  _| | |  __/\__ \
	 \__,_|\___/ \__|_| |_|_|\___||___/

## Bash binds

 * `Selected text + Shift + MouseBtn1` - open url/path in browser (ff)
 * `Selected text + Shift + MouseBtn2` - open url/path in idea (intellij)
 * `Ctrl + Shift + c` - copy selected text to CLIPBOARD
 * `Ctrl + Shift + v` - paste from CLIPBOARD
 * `Shift + Home` - scroll to top
 * `Shift + End` - scroll to bottom
 * `Ctrl + /` - bash history

for X see [.xbindkeysrc](.xbindkeysrc)

## Bash functions

see [.bash_variables](.bash_variables)  
see [.bash_functions](.bash_functions)

 * `hello_msg`
 * `f` - fork terminal with session
 * `l` - colorful ls
 * `p/pm` - colorful process usage
 * `m` - colorful mount
 * `df` - colorful df
 * `extract` - extract any archive
 * `swap` - swap 2 files
 * `md` - print markdown
 * `pp` - pretty-print any file (pygmentize)
 * `n/nls/nrm/nprint/np/ncat` - [simple notes](#simple-notes)
 * `apt-history` - install/upgrade/remove/rollback
 * `tailf-monolog` - colorful tail -f for [monolog](https://github.com/Seldaek/monolog)
 * `get-cert-names`
 * `less-tree`
 * `data-url`
 * `decode-url`
 * `decode-base64`
 * `decode-imap-folder-name`
 * `set-tor-proxy`
 * `unset-tor-proxy`

## Requirements

 * [bash-completion](https://packages.debian.org/jessie/bash-completion) (optional for simple-notes)
 * [gawk](https://www.gnu.org/software/gawk/)
 * [tree](https://packages.debian.org/jessie/tree) (optional for simple-notes)
 * [pandoc](https://packages.debian.org/jessie/pandoc) (optional for simple-notes)
 * [xttitle](https://packages.debian.org/stretch/xttitle) (optional)
 * [lua](https://www.lua.org/), [lua-json](https://www.eharning.us/wiki/luajson/), [lua-socket](http://w3.impa.br/~diego/software/luasocket/) for [conky](https://github.com/brndnmtthws/conky) scripts (optional)
 * [pygmentize](https://pygments.org/) (optional)

## Scripts

 * [backlight-brightness-control](bin/backlight-brightness-control)
 * [volume-control](bin/volume-control)
 * [offlineimap-notify-send](bin/offlineimap-notify-send)
 * [on-online-runner](bin/on-online-runner)
 * [dmenu-mpc-playlist](bin/dmenu-mpc-playlist)
 * [hl](bin/hl) - color highlight by regexp pattern from stdin

## Simple notes

### Installation

```bash
make install-simple-notes
```

### Usage

 * `n <note>` - edit `<note>.markdown`
 * `nls` - ls notes dir
 * `nrm <note>` - rm `<note>.markdown`
 * `nprint <note>` - print `<note>.markdown` via `$NOTES_PRINT_CMD`
 * `ncat <note>` - cat `<note>.markdown`

## Screenshots

\w [dwm](https://github.com/qbbr/dwm) + [dzenbar](https://github.com/qbbr/dzenbar)

[conky](.config/conky):

[![qbbr-conky](https://i.imgur.com/p3H3sz0l.png)](https://i.imgur.com/p3H3sz0.png)

firefox-esr:

[![qbbr-firerfox-esr](https://i.imgur.com/1vnahXxl.png)](https://i.imgur.com/1vnahXx.png)

[vim](https://github.com/qbbr/dotvim) + [mc](.config/mc) + xterm:

[![qbbr-vim-mc-xterm](https://i.imgur.com/3dddM1hl.png)](https://i.imgur.com/3dddM1h.png)

[mutt](.muttrc):

[![qbbr-mutt](https://i.imgur.com/1vEF78Hl.png)](https://i.imgur.com/1vEF78H.png)

[xmonad](https://github.com/qbbr/xmonad-cfg):

[![qbbr-xmonad-xterm](https://i.imgur.com/JvDkJ5el.png)](https://i.imgur.com/JvDkJ5e.png)

android termux:

[![qbbr-android-termux](https://i.imgur.com/oR2tBa3l.jpg)](https://i.imgur.com/oR2tBa3.jpg)
