`env2`
===

     ░█▀▀░█▀█░█░█░▀▀▄
     ░█▀▀░█░█░▀▄▀░▄▀░
     ░▀▀▀░▀░▀░░▀░░▀▀▀ is My Way To Keep Two Environment Consistent

<!-- vim-markdown-toc GFM -->

* [What is `env2`](#what-is-env2)
* [Screenshots](#screenshots)
* [Features](#features)
* [How To Install `env2`](#how-to-install-env2)
* [What Environment `env2` Manages](#what-environment-env2-manages)
    * [Recommend Extra Environment](#recommend-extra-environment)
* [Terminal Environment](#terminal-environment)
    * [Useful `bin` Utilities and Aliases](#useful-bin-utilities-and-aliases)
    * [Key Bindings](#key-bindings)
        * [`zsh` finder](#zsh-finder)
        * [`zsh` command edit](#zsh-command-edit)
        * [`tmux` session](#tmux-session)
        * [`tmux` window](#tmux-window)
        * [`tmux` production](#tmux-production)
        * [`tmux` misc](#tmux-misc)
    * [Sensible Shell Configuration](#sensible-shell-configuration)
        * [`zsh` prompt status](#zsh-prompt-status)
        * [`zsh` sensible](#zsh-sensible)
        * [`zsh` integration](#zsh-integration)
        * [`tmux` sensible](#tmux-sensible)
* [Desktop Environment](#desktop-environment)
    * [Key Bindings](#key-bindings-1)
    * [Desktop Theme Customization](#desktop-theme-customization)
* [Take a Look at Install Scripts](#take-a-look-at-install-scripts)
    * [Feature: `fail2cam`](#feature-fail2cam)
* [Fonts](#fonts)
* [Dependency](#dependency)
* [Workarounds for Linux Distro and Desktop](#workarounds-for-linux-distro-and-desktop)
* [How to Uninstall `env2`](#how-to-uninstall-env2)
* [License](#license)

<!-- vim-markdown-toc -->

## What is `env2`

The `env2` is my personal configurations for for Linux Desktop and Terminal environment.

It also includes special features and utilities.

It helps me to maintain a consistent Desktop and Terminal for every fresh new installed Linux system.

## Screenshots

| Shell                                                                           | Desktop                                                                           |
|---------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| <img src="https://i.imgur.com/4dCVQjI.png" alt="shell screenshot" width="480"/> | <img src="https://i.imgur.com/arBfCqH.png" alt="desktop screenshot" width="480"/> |

## Features

- Sensible `zsh` and `tmux` configurations, aliases and keybindngs
- `fail2cam` to trigger notification if login fails
- Consistent shell customization
- Consistent desktop customization

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

Step 3: enable tmux plugins

```
$ install/01-base/install-tmux-plugins.sh
```

Use [sandbox](https://github.com/tarlety/docker-apps/tree/master/security/sandbox) to test [How To Install `env2`](#how-to-install-env2).

```
$ ./zss0 config image && ./zss0 config hostname && ./zss0 config xsp
$ ./zss0 app up && ./zss0 app env2 && ./zss0 app ssh
```

## What Environment `env2` Manages

| Environment          | Designed For |
|----------------------|--------------|
| Linux Distro         | Ubuntu 20.4  |
| Desktop Environment  | Gnome        |
| Shell                | zsh          |
| Terminal Multiplexer | tmux         |

### Recommend Extra Environment

| Environment  | Recommend  | Configuration                       |
|--------------|------------|-------------------------------------|
| Editor       | vim/neovim | `https://github.com/t16ing/.vim`    |
| File Manager | ranger     | `https://github.com/t16ing/.ranger` |

- Use `install/02-develop/install-vim-enhancement.sh` to install neovim and complete vim plugin dependency.
- Use `install/05-optional/install-ranger.sh` to install ranger.

## Terminal Environment

### Useful `bin` Utilities and Aliases

- `s`: start the day of shell
- `ra`: ranger
- `vi`: smart alias to vim or nvim
- `j`: smart jump to folder
- `nvm`: npm and node.js environment management.
- gg family: *G*it confi*G* utilities

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

| key                      | Action                            |
|--------------------------|-----------------------------------|
| `<prefix><c-j> or <c-k>` | Window nagigation                 |
| `<prefix><tab>`          | Switch to last window             |
| `<prefix>-`              | Split current window horizontally |
| `<prefix>\|`             | Split current window vertically   |
| `<prefix>h,j,k,l`        | Move left,down,up,right           |
| `<prefix>H,J,K,L`        | Resize the window                 |
| `<prefix>``<`,`>`        | Swap the window                   |
| `<prefix>+`              | Maximize the window               |

#### `tmux` production

| Key               | Action                    |
|-------------------|---------------------------|
| `<prefix><enter>` | Enter copy mode (vi-mode) |
| `<prefix>p`       | Paste from buffer         |
| `<prefix>P`       | Choose buffer             |
| `<prefix>u`       | Open urlview              |

#### `tmux` misc

| Key         | Action                    |
|-------------|---------------------------|
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

- nerdfont-complete
- vcs nerd icon
- dir writable icon
- there is always an OK icon there if execution is OK.
- it makes more informative to show all kinds of error status and exit code.
- execution for 1 second is long enough to wait; show execution time in ms unit.
- customized background job icon and show the background jobs number.
- vi-mode default is INSERT mode, so hide the INSERT string.
- move network bandwidth information to tmux status line.
- extra ip interface name (e.\* or w.\*).
- show the battery remaining time.
- show start time of past command.
- full date-time format.
- more history size and keep history date/time.
- `safe-paste` plugin to avoid accident running after paste command.

#### `zsh` integration

- ssh: ssh-agent run automatically.
- gpg: gpg-agent run automatically.
- pipenv: automatically enter pipenv after cd into folder.
- kubectl: shows kubernetes context if `kubectl` is the execution command
- command-not-found: what is the missing packages for the command.

#### `tmux` sensible

- copy mode works both for primary and clipboard
- force vi mode
- address vi mode switching delay
- sensible [keybindings](#key-bindings)
- do not clear history
- more history size
- much clear pane border style
- status line theme: Dracula
- auto save and restore session status

## Desktop Environment

### Key Bindings

| Key                   | Action                     |
|-----------------------|----------------------------|
| `<super><alt>d`       | Draw on the screen.        |
| `<ctrl><alt>k`        | Toggle screenkey.          |
| `<ctrl><alt><shift>r` | Record a short screen cast. |

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

Install scripts does the customization:
- `install/01-base/install-gnome-shell-extension.sh`
- `install/02-develop/install-vscode-and-others-transparent.sh`
- `install/03-customization/install-variety.sh`
- `install/03-customization/install-mac-style.sh`
- `install/03-customization/install-mac-style-patch-nautilus-icon.sh`

## Take a Look at Install Scripts

In a fresh new installed Linux Distro, packages and features can be enabled by these install scripts:

| install script               | description                                      |
|------------------------------|--------------------------------------------------|
| `install/01-base/*`          | almost required for most conditions              |
| `install/02-develop/*`       | for development, editor, and runtime environment |
| `install/03-customization/*` | fonts installation; desktop theme customization  |
| `install/04-hack/*`          | optional: install hacker tools                   |
| `install/05-optional/*`      | other install scripts depends on necessary       |

Sensible Linux Shell Applications:

- `install/01-base/install-apps-base.sh` installs frequently system applications but not been installed by default.
- `install/05-optional/install-console-apps.sh` installs other optional console applications.

Sensible Linux Desktop Applications:

- `install/01-base/...` installs frequently used desktop applications:
- `install/05-optional/install-gui-apps.sh` installs optional GUI applications.

Security enhancement:

- `howdy`
- `gotp`

Misc:

- `install/04-hack/*`
- `install/05-optional/*`

### Feature: `fail2cam`

`install/01-base/install-fail2cam.sh`

If login fails, fail2cam can take the picture and send a notification to you.
It requires Telegram bot token and chatid.

## Fonts

- cns11643
- powerline font
- nerd fonts for Ubuntu, Hack, Source Code Pro

Nerd Font and Powerline Font is required for tmux, zsh, and vim powerline.
Recommend Hack Nerd Font.

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
    It let system uses CP950 for zip and uses '7z' instead of p7zip.

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
