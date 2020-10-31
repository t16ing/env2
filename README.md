env2
===

## What is env2

The `env2` is my personal configurations and some useful console utilities for Linux Desktop and Shell.

It includes dotfiles for tmux and zsh, install scripts, and some useful shell bin utilities.

This helps me to maintain a consistent Terminal and Desktop environment for every fresh new installed Linux Distro.

## Which environment `env2` configures

| Environment          | Preferred |
|----------------------|-----------|
| Linux Distro         | Ubuntu    |
| Desktop Environment  | Gnome     |
| Shell                | zsh       |
| Terminal Multiplexer | tmux      |

## Recommend External Configurations

| Environment  | Preferred  | Recommend Configuration                  |
|--------------|------------|------------------------------------------|
| Editor       | vim/neovim | `https://github.com/t16ing/.vim`         |
| File Manager | ranger     | `https://github.com/t16ing/.ranger` |

## How to use env2

**NOTICE**: only install on a fresh new installed environment.

### Step 1: run `env2` setup.sh

```
$ sh <(curl https://raw.githubusercontent.com/t16ing/env2/master/bin/setup.sh -L)
```

Or

```
$ git clone --no-checkout https://github.com/t16ing/env2 ~/.git~ ; mv ~/.git~/.git ~/.git ; rmdir ~/.git~
$ cd ~ ; git restore --staged . && git checkout -- .
```

### Step 2: choose install scripts

In a fresh installed Linux Distro, choose install scripts by the order:

| install script               | description                                      |
|------------------------------|--------------------------------------------------|
| `install/01-base/*`          | almost required for most conditions             |
| `install/02-develop/*`       | for development, editor, and runtime environment |
| `install/03-customization/*` | fonts installation; desktop theme customization  |
| `install/04-hack/*`          | optional: install hacker tools                   |
| `install/05-optional/*`      | other install scripts depends on necessary       |

To get minimal usable environment, recommend bring-up zsh first.

```
$ install/01-base/install-zsh.sh
$ git checkout -- ~/.zshrc
$ exit
$ exec zsh
```

Hint: the snippet to clean up `env2`.

```
$ rm -rf bin install README.md .tmux* .p10* .zsh* .pylintrc .git* .oh-my-zsh*
```

## Extra Features Highlight

- fail2cam
- bin utility: gginit for *g*it confi*g* *init*alization

## Issues and Workarounds for Linux Distro and Desktop

- The system is extremely slow to respond due to GPU driver not compatible with hardware.
- The filename is unrecognized after unzip from windows zipped file.
- System crashes (hard to respond and hard drive led blinks) due to OOM.
- The nerd font is incorrect in vim nerdtree.

## Customizations

### Shell: zsh

- oh-my-zsh
- powerlevel10k

### Terminal multiplexer: tmux

- oh-my-tmux

### Fonts:

- cns11643
- powerline font
- nerd fonts for Ubuntu, Hack, Source Code Pro

Nerd Font and Powerline Font is required for tmux, zsh, and vim powerline.
Recommend Hack Nerd Font.

### Desktop Customizations

- Wallpapers for login screen, lock screen, and desktop background.
- Launcher and Dock.
- Transparent Background.

## Key bindings

Shell:

| key     | action            |
|---------|-------------------|
| `<esc>` | Enter NORMAL mode |

Terminal multiplexer:

| key         | action             |
|-------------|--------------------|
| `<prefix>z` | toggle status line |

## Dependency

1. Docker for wls2 Ubuntu

    For wls2 Ubuntu, before installing docker.io, please read https://docs.docker.com/docker-for-windows/wsl/.

2. Test environement

    Use [sandbox](https://github.com/tarlety/docker-apps/tree/master/security/sandbox) for testing, with minimal zsh installation:

    <img src="https://i.imgur.com/P7hZ6js.png" alt="drawing" width="480"/>

## License

MIT
