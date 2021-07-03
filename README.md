`env2`
===

     ░█▀▀░█▀█░█░█░▀▀▄
     ░█▀▀░█░█░▀▄▀░▄▀░
 Use ░▀▀▀░▀░▀░░▀░░▀▀▀ to Keep All Environment Consistent.

<!-- vim-markdown-toc GFM -->

* [What is `env2`](#what-is-env2)
* [Screenshots](#screenshots)
* [Features](#features)
* [How To Install `env2`](#how-to-install-env2)
* [Compatbile Environments](#compatbile-environments)
    * [Advanced Environments](#advanced-environments)
* [Terminal Environment](#terminal-environment)
    * [Extra `bin` Utilities and Aliases](#extra-bin-utilities-and-aliases)
    * [Key Bindings](#key-bindings)
        * [`zsh` finder](#zsh-finder)
        * [`zsh` command edit](#zsh-command-edit)
        * [`tmux` session](#tmux-session)
        * [`tmux` window](#tmux-window)
        * [`tmux` editing](#tmux-editing)
        * [`tmux` misc](#tmux-misc)
    * [Sensible Shell Configuration](#sensible-shell-configuration)
        * [`zsh` prompt status](#zsh-prompt-status)
        * [`zsh` sensible](#zsh-sensible)
        * [`zsh` integration](#zsh-integration)
        * [`tmux` sensible](#tmux-sensible)
* [Desktop Environment](#desktop-environment)
    * [Key Bindings](#key-bindings-1)
    * [Desktop Theme Customization](#desktop-theme-customization)
* [Optional Install Scripts](#optional-install-scripts)
    * [Feature: `fail2cam`](#feature-fail2cam)
* [Fonts](#fonts)
* [Dependency](#dependency)
* [Workarounds for Linux Distro and Desktop](#workarounds-for-linux-distro-and-desktop)
* [How to Uninstall `env2`](#how-to-uninstall-env2)
* [License](#license)

<!-- vim-markdown-toc -->

## What is `env2`

The `env2` is my personal configurations for Linux Gnome Desktop and Shell Terminal environment.

It also includes extra features and utilities.

It maintains a consistent Desktop and Terminal environment for every fresh new installed Linux system.

## Screenshots

| Shell                                                                           | Desktop                                                                           |
|---------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| <img src="https://i.imgur.com/4dCVQjI.png" alt="shell screenshot" width="480"/> | <img src="https://i.imgur.com/arBfCqH.png" alt="desktop screenshot" width="480"/> |

## Features

- Sensible `zsh` and `tmux` configurations, aliases and key bindings.
- `fail2cam` to trigger notification if login fails.
- Consistent shell customization.
- Consistent desktop customization.

## How To Install `env2`

**NOTIC: only setup `env2` on a fresh new installed environment.**

Step 1: run `env2` setup.sh

```
$ sh <(curl https://raw.githubusercontent.com/t16ing/env2/master/bin/setup.sh -L)
```

Step 2: bring-up shell environment

```
$ install/01-base/install-zsh.sh
$ exec zsh
```

Step 3: install tmux plugins

```
$ install/01-base/install-tmux-plugins.sh
```

Use [sandbox](https://github.com/tarlety/docker-apps/tree/master/security/sandbox) to try [How To Install `env2`](#how-to-install-env2):

```
$ ./zss0 config image && ./zss0 config hostname && ./zss0 config xsp
$ ./zss0 app up && ./zss0 app env2 && ./zss0 app ssh
```

## Compatbile Environments

| Environment          | Recommend Version |
|----------------------|-------------------|
| Linux Distro         | Ubuntu 20.4       |
| Desktop Environment  | Gnome 3.30        |
| Shell                | zsh 5.8           |
| Terminal Multiplexer | tmux 3.0          |

### Advanced Environments

| Environment  | Recommend Version | Configuration                       |
|--------------|-------------------|-------------------------------------|
| Editor       | neovim 0.4.3      | `https://github.com/t16ing/.vim`    |
| File Manager | ranger 1.9.3      | `https://github.com/t16ing/.ranger` |

- Use `install/02-develop/install-vim-enhancement.sh` to install neovim and plugin dependency.
- Use `install/05-optional/install-ranger.sh` to install ranger.

## Terminal Environment

### Extra `bin` Utilities and Aliases

- `s`: start the day of shell
- `ra`: ranger
- `vi`: smart alias for vim/nvim
- `j`: smart jump to folder
- `nvm`: npm and node.js environment management.
- gg family: *G*it confi*G* utilities
    - `ggmm`: switch to master or main branch
    - `gginit`: configure user information and use store as default credential helper
    - `ggls`: list all pending PULL and PUSH repositories
- mk family:
    - `mkapplink`: make a executable as a gnome desktop application.
    - `mksrcv`: make a executable as a service.

### Key Bindings

#### `zsh` finder

| Key                          | Action                     |
|------------------------------|----------------------------|
| `<c-n>,<c-p>`                | Next history (or previous) |
| `<c-f>`                      | Accept suggestion          |
| `<c-r>`                      | Smart find history         |
| `<c-t>`                      | Smart find files           |

#### `zsh` command edit

| Key                          | Action                          |
|------------------------------|---------------------------------|
| `<c-w>`                      | Delete back word                |
| (multiple-line)`<alt-enter>` | Insert new line                 |
| `<esc>`                      | Enter NORMAL mode               |
| (NORMAL)`v`                  | Visual edit the command         |
| `<esc><esc>`                 | Smart correct the last command. |

#### `tmux` session

| Key              | Action                |
|------------------|-----------------------|
| `<prefix>c`      | Create a new session  |
| `<prefix><c-s>`  | Save session          |
| `<prefix><c-r>`  | Load session          |

#### `tmux` window

| key                        | Action                             |
|----------------------------|------------------------------------|
| `<prefix><c-j> or <c-k>`   | Window navigation                  |
| `<prefix><tab>`            | Switch to last window              |
| `<prefix>-`                | Split current window horizontally  |
| `<prefix>\|`               | Split current window vertically    |
| `<prefix><arrow key>`      | Move left,down,up,right            |
| `<prefix><ctrl+arrow key>` | Resize the window                  |
| `<prefix>``<`,`>`          | Swap the window                    |
| `<prefix>+`                | Maximize the window                |
| `<prefix>q`                | Show window id to choose to focus. |

#### `tmux` editing

| Key               | Action                    |
|-------------------|---------------------------|
| `<prefix><enter>` | Enter copy mode (vi-mode) |
| `<prefix>p`       | Paste from buffer         |
| `<prefix>P`       | Choose buffer             |

#### `tmux` misc

| Key         | Action                    |
|-------------|---------------------------|
| `<prefix>u` | Open urlview              |
| `<prefix>e` | Edit .tmux.conf.local     |
| `<prefix>r` | Reload tmux configuration |
| `<prefix>z` | Toggle status line        |

### Sensible Shell Configuration

#### `zsh` prompt status

| Line   | Left                            | Right                            |
|--------|---------------------------------|----------------------------------|
| Line 1 | Linux Distro, work path and vcs | computer and network environment |
| Line 2 | prompt and env                  | runtime and shell environment    |

#### `zsh` sensible

- Support nerdfont-complete for powerlevel.
- Support nerd icons (ex: `vcs` and dir writable) for powerlevel.
- There is always an OK icon there if execution is OK.
- More informative to show all kinds of error status and exit code.
- Show execution time if longer than 1 second. Show in ms unit.
- Customized background job icon and show the background jobs number.
- Default INSERT vi-mode; therefore hide the INSERT string.
- Move network bandwidth information to tmux status line.
- Sense ip with more interface name (e.\* or w.\*).
- Show the battery remaining time.
- Show start time of past command.
- Full date-time format.
- Enlarge history size and keep history date/time.
- `safe-paste` plugin to avoid accident running after paste command.

#### `zsh` integration

- ssh: ssh-agent run on startup.
- gpg: gpg-agent run on startup.
- pipenv: enter pipenv after cd into folder.
- kubectl: shows kubernetes context if `kubectl` is the execution command.
- command-not-found: show missing package for the command.

#### `tmux` sensible

- copy mode works both for primary and clipboard
- force vi mode
- address vi mode switching delay issue
- sensible [key bindings](#key-bindings)
- do not clear history
- enlarge history size
- sensible pane border style
- status line theme: Dracula
- auto save and restore session

## Desktop Environment

### Key Bindings

| Key                   | Action                                                 |
|-----------------------|--------------------------------------------------------|
| `<super><alt>d`       | Draw on the screen. `ctrl+number` to change pen color. |
| `<ctrl><alt>k`        | Toggle screenkey.                                      |
| `<ctrl><alt><shift>r` | Record a short screen cast.                            |

### Desktop Theme Customization

Customizations:

- Dock: Plank (replace Gnome Dock)
- Spotlight: Albert
- Hide activities
- Remove drop down arrows
- Hide top bar
- Application indicator
- Wallpapers for login screen, lock screen, and desktop background
- Transparent Background

Install these scripts for customization:
- `install/01-base/install-gnome-shell-extension.sh`
- `install/02-develop/install-vscode-and-others-transparent.sh`
- `install/03-customization/install-variety.sh`
- `install/03-customization/install-mac-style.sh`
- `install/03-customization/install-mac-style-patch-nautilus-icon.sh`

## Optional Install Scripts

In a fresh new installed Linux Distro, packages and features can be enabled by these install scripts:

| install script               | description                                      |
|------------------------------|--------------------------------------------------|
| `install/01-base/*`          | almost required for most conditions              |
| `install/02-develop/*`       | for development, editor, and runtime environment |
| `install/03-customization/*` | fonts installation; desktop theme customization  |
| `install/04-hack/*`          | hacker tools                                     |
| `install/05-optional/*`      | other install scripts depends on necessary       |

Recommend Linux Shell Applications:

- `install/01-base/install-apps-base.sh` installs most used system applications but not been installed by default.
- `install/05-optional/install-console-apps.sh` installs other optional console applications.

Recommend Linux Desktop Applications:

- `install/01-base/...` installs most used desktop applications.
- `install/05-optional/install-gui-apps.sh` installs optional GUI applications.

Security enhancement:

- `howdy`
- `gotp`

Misc:

- `install/04-hack/*`
- `install/05-optional/*`

### Feature: `fail2cam`

`install/01-base/install-fail2cam.sh`

If login fails, fail2cam takes the picture and sends a notification to you.

It requires a configured Telegram bot API token.

## Fonts

- cns11643
- powerline font
- nerd fonts: Ubuntu, Hack, Source Code Pro, Mononoki
- emoji fonts: Noto

Nerd Font and Powerline Font is required for tmux, zsh, and vim powerline.

Install scripts:
- `install/03-customization/install-fonts.sh`

## Dependency

1. Docker for wls2 Ubuntu

    For wls2 Ubuntu, before installing docker.io, please read https://docs.docker.com/docker-for-windows/wsl/.

2. Out-of-box extensions

    - [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    - [powerlevel10k](https://github.com/romkatv/powerlevel10k)
    - [oh-my-tmux](https://github.com/gpakosz/.tmux)

## Workarounds for Linux Distro and Desktop

1. The Gnome Desktop stops to respond sometimes.

    The Gnome Desktop running on my laptop stops to respond very often, even with Ubuntu Live CD.
    `install/01-base/install-disable-nouveau.sh` is the script to help this.
    After GPU driver is disabled, the Gnome Desktop responds normally.

2. The zip file from windows has unrecognized filename.

    Windows platform does not use unicode encoding for zip files.
    For those zip files comming from Windows Platform, the filename encoding will be incorrect.
    `install/01-base/install-fix-unzip-encoding-issue.sh` is the script to help this.
    It lets system use CP950 for zip and uses '7z' instead of p7zip.

3. System crashes (hard to respond and hard drive led blinks) due to OOM.

    My laptop has limited available memory. Every time system ran out of memory, the system freezes.
    How come? Linux shall be a reliable and stable system.
    Here is the brief explaination.
    The default OOM strategy is somehow expensive and slow. (vm.oom_kill_allocating_task=0)
    When OOM happens, kernel may not have enough resource to scan entire tasklist.
    `install/01-base/install-oom-workaround.sh` is the script to help this.
    This script changes OOM strategy; kernel simply kills the task triggered OOM. (vm.oom_kill_allocating_task=1)

## How to Uninstall `env2`

This is a snippet to clean up `env2`:

```
$ rm -rf bin install README.md .tmux* .p10* .zsh* .pylintrc .git .oh-my-zsh*
$ exit
```

## License

MIT
