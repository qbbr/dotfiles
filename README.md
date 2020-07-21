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

```bash
cp .bash_variables ~
$EDITOR ~/.bash_variables
```

## Bash binds

 * `Selected text + Shift + MouseBtn1` - open url/path in browser
 * `Selected text + Shift + MouseBtn2` - open url/path in phpstorm
 * `Ctrl + Shift + c` - copy selected text to CLIPBOARD
 * `Ctrl + Shift + v` - paste from CLIPBOARD
 * `Shift + Home` - scroll to top
 * `Shift + End` - scroll to bottom
 * `Ctrl + /` - bash history

for X see [.xbindkeysrc](.xbindkeysrc)

## Bash functions

 * `start/stop/restart/status <daemon_name>` - for managing daemons `/etc/init.d/<daemon_name>`
 * `extract <archive_path>` - for extract any archive
 * `n/nls/nrm/nprint` - [simple notes](#simple-notes)
 * `update_xtitle` - update X title after cd
 * `f` - fork terminal with session
 * `apt-history` - install/upgrade/remove/rollback
 * `tailf-monolog` - tail -f for [monolog](https://github.com/Seldaek/monolog)

## Requirements

 * [powerline (optional)](https://github.com/powerline/powerline)
 * [powerline-fonts (optional)](https://github.com/powerline/fonts)
 * [bash-completion](https://packages.debian.org/jessie/bash-completion)
 * [tree](https://packages.debian.org/jessie/tree)
 * [pandoc](https://packages.debian.org/jessie/pandoc) (optional, see [.bash_variables.dist](.bash_variables.dist#L10))
 * [xttitle](https://packages.debian.org/stretch/xttitle)
 * [lua](https://www.lua.org/), [lua-json](https://www.eharning.us/wiki/luajson/), [lua-socket](http://w3.impa.br/~diego/software/luasocket/) for [conky](https://github.com/brndnmtthws/conky) scripts (optional)

## Scripts

 * [backlight-brightness-control](bin/backlight-brightness-control)
 * [volume-control](bin/volume-control)
 * [offlineimap-notify-send](bin/offlineimap-notify-send)
 * [on-online-runner](bin/on-online-runner)
 * [dmenu-mpc-playlist](bin/dmenu-mpc-playlist)

## Simple notes

### Installation

```bash
apt install bash-completion tree #pandoc
ln -sf $PWD/etc/bash_completion.d/simplenotes /etc/bash_completion.d/
```

### Usage

 * `n <note_name>` - edit `<note_name>.markdown`
 * `nls` - ls notes dir
 * `nrm <note_name>` - rm `<note_name>.markdown`
 * `nprint <note_name>` - print `<note_name>.markdown`

# Screenshots

\w [dwm](https://github.com/qbbr/dwm) + [dzenbar](https://github.com/qbbr/dzenbar)

[conky](.config/conky):

[![qbbr-conky](https://i.imgur.com/p3H3sz0l.png)](https://i.imgur.com/p3H3sz0.png)]

firefox-esr:

[![qbbr-firerfox-esr](https://i.imgur.com/1vnahXxl.png)](https://i.imgur.com/1vnahXx.png)]

[vim](https://github.com/qbbr/dotvim) + [mc](.config/mc) + xterm:

[![qbbr-vim-mc-xterm](https://i.imgur.com/3dddM1hl.png)](https://i.imgur.com/3dddM1h.png)]

[mutt](.muttrc):

[![qbbr-mutt](https://i.imgur.com/1vEF78Hl.png)](https://i.imgur.com/1vEF78H.png)]
