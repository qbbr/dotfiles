# QBBR dotfiles

      ___  ____  ____  ____
     / _ \| __ )| __ )|  _ \
    | | | |  _ \|  _ \| |_) |
    | |_| | |_) | |_) |  _ <
     \__\_\____/|____/|_| \_\
         _       _    __ _ _
      __| | ___ | |_ / _(_) | ___  ___
     / _` |/ _ \| __| |_| | |/ _ \/ __|
    | (_| | (_) | |_|  _| | |  __/\__ \
     \__,_|\___/ \__|_| |_|_|\___||___/

## Binds

 * `Selected text + Shift + MouseBtn1` - open url/path in browser
 * `Selected text + Shift + MouseBtn2` - open url/path in phpstorm
 * `Ctrl + Shift + c` - copy selected text to CLIPBOARD
 * `Ctrl + Shift + v` - paste from CLIPBOARD
 * `Shift + Home` - scroll to top
 * `Shift + End` - scroll to bottom
 * `Ctrl + slash` - bash history

## Bash functions

 * `start/stop/restart/status <daemon_name>` - for managing daemons `/etc/init.d/<daemon_name>`
 * `extract <archive_path>` - for extract any archive
 * `n/nls/nrm/nprint` - [simple notes](#simple-notes)


## Simple notes

### Requirements

 * [bash-completion](https://packages.debian.org/jessie/bash-completion)
 * [tree](https://packages.debian.org/jessie/tree)
 * [pandoc](https://packages.debian.org/jessie/pandoc)

### Installation


```bash
$ sudo apt install bash-completion tree pandoc
$ sudo ln -sf $PWD/.config/simplenotes /etc/bash_completion.d/
```

### Usage

`n <note_name>` - edit `<note_name>.markdown`
`nls` - ls notes dir
`nrm <note_name>` - rm `<note_name>.markdown`
`nprint <note_name`  cat `<note_name>.markdown`
