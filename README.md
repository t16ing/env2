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
* [Dependency](#dependency)
* [Configurations Repo](#configurations-repo)
* [Terminal Environment](#terminal-environment)
  * [Shell Utilities and Aliases](#shell-utilities-and-aliases)
  * [Key Bindings](#key-bindings)
  * [Sensible Terminal Shell](#sensible-terminal-shell)
  * [Environment Integration](#environment-integration)
  * [Develop Environment](#develop-environment)
* [Desktop Environment](#desktop-environment)
  * [Key Bindings](#key-bindings-1)
  * [Desktop Theme Customization](#desktop-theme-customization)
* [Optional Install Scripts](#optional-install-scripts)
* [Fonts](#fonts)
* [External Resources](#external-resources)
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
- Consistent shell customization.
- Consistent desktop customization.

## How To Install `env2`

**WARNING: only setup `env2` on a fresh new installed environment.**

Step 1: run `env2` setup.sh

```
$ sh <(curl https://raw.githubusercontent.com/t16ing/env2/master/bin/setup.sh -L)
```

Step 2: bring-up shell with customization

```
$ install/01-base/install-zsh.sh
$ exec zsh
```

Step 3: install terminal management

```
$ install/01-base/install-tmux.sh
```

Step 4: install vim and plugins

```
$ install/01-base/install-vim.sh
```

Use [sandbox](https://github.com/tarlety/docker-apps/tree/master/security/sandbox) to try [How To Install `env2`](#how-to-install-env2):

```
$ ./zss0 config image && ./zss0 config hostname && ./zss0 config xsp
$ ./zss0 app up && ./zss0 app env2 && ./zss0 app ssh
```

## Dependency

| Environment          | Recommend Version |
|----------------------|-------------------|
| Linux Distro         | Ubuntu 22.04 LTS  |
| Desktop Environment  | Gnome 3.30        |
| Shell                | zsh 5.8           |
| Terminal Multiplexer | tmux 3.0          |

## Configurations Repo

| Environment | Software Version | Configuration                       |
|-------------|------------------|-------------------------------------|
| Editor      | neovim 0.4.3     | https://github.com/t16ing/.vim      |
| Wallpaper   | variety 0.8.5    | https://github.com/t16ing/.variety  |

## Terminal Environment

### Shell Utilities and Aliases

- `s`: start the day of shell
- `j`: smart jump to folder
- mk family:
    - `mkapplink`: make a executable as a gnome desktop application.
    - `mksrcv`: make a executable as a service.

### Key Bindings

`zsh` smart find:

| Key           | Action                     |
|---------------|----------------------------|
| `<c-n>,<c-p>` | Next history (or previous) |
| `<c-f>`       | Accept suggestion          |
| `<c-r>`       | Smart find history         |
| `<c-t>`       | Smart find files           |

`zsh` command edit:

| Key                          | Action                            |
|------------------------------|-----------------------------------|
| `<c-w>`                      | Delete back word                  |
| (multiple-line)`<alt-enter>` | Insert new line                   |
| `<esc>`                      | Enter NORMAL mode                 |
| (NORMAL)`i`                  | Exit NORMAL mode (in NORMAL mode) |
| `<esc><esc>`                 | Smart correct the last command.   |

`tmux` session:

| Key              | Action                |
|------------------|-----------------------|
| `<prefix>c`      | Create a new session  |
| `<prefix><c-s>`  | Save session          |
| `<prefix><c-r>`  | Load session          |

`tmux` window:

| key                      | Action                             |
|--------------------------|------------------------------------|
| `<prefix><c-j> or <c-k>` | Window navigation                  |
| `<prefix><tab>`          | Switch to last window              |
| `<prefix>q`              | Show window id to choose to focus. |

`tmux` pane:

| Key                      | Action                                      |
|--------------------------|---------------------------------------------|
| `<prefix>-`              | Split current window into pane horizontally |
| `<prefix>\|`             | Split current window into pane vertically   |
| `<prefix>o`              | go to next pane                             |
| `<prefix>;`              | go to last pane                             |
| `<prefix><arrow keys>`   | go to left, right, top, down pane           |
| `<prefix><c-arrow keys>` | resize pane                                 |
| `<prefix>``<`,`>`        | Swap the pane                               |

`tmux` copy mode:

| Key               | Action                    |
|-------------------|---------------------------|
| `<prefix><enter>` | Enter copy mode (vi-mode) |
| `<prefix>p`       | Paste from buffer         |
| `<prefix>P`       | Choose buffer             |

`tmux` configurations:

| Key         | Action                    |
|-------------|---------------------------|
| `<prefix>e` | Edit .tmux.conf.local     |
| `<prefix>r` | Reload tmux configuration |
| `<prefix>z` | Toggle status line        |

### Sensible Terminal Shell

`zsh` prompt status:

| Line   | Left                            | Right                            |
|--------|---------------------------------|----------------------------------|
| Line 1 | Linux Distro, work path and vcs | computer and network environment |
| Line 2 | prompt and env                  | runtime and shell environment    |

`zsh` sensible:

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

`tmux` sensible:

- copy mode works both for primary and clipboard
- force vi mode
- address vi mode switching delay issue
- sensible [key bindings](#key-bindings)
- do not clear history
- enlarge history size
- sensible pane border style
- status line theme: Dracula
- auto save and restore session

### Environment Integration

Security integration:
- ssh: ssh-agent run on startup.
- gpg: gpg-agent run on startup.

Command line integration:
- history-substring-search: `<c-n>,<c-p>` for next history or previous
- command-not-found: show missing package for the command
- fzf: enables fzf fuzzy auto-completion and key bindings
- thefuck: magnificent app which corrects your previous console command
- zsh-autosuggestions: provides auto-completion suggestions based on command history
- zsh-syntax-highlighting: highlights syntax errors and provides color coding for commands and files in the terminal

Desktop UI integration:
- safe-paste: preventing any code from actually running while pasting

### Develop Environment

`zsh` plugin integration:
- zsh-nvm: zsh plugin for nvm
- pipenv: Manage Python virtual environments with ease, the best part is auto activates and deactivates pipenv shell
- kubectl: shows kubernetes context if `kubectl` is the execution command.

gg family: *G*it confi*G* utilities:
- `ggmm`: switch to master or main branch
- `gginit`: configure user information and use store as default credential helper
- `ggls`: list all pending PULL and PUSH repositories

## Desktop Environment

### Key Bindings

| Key                   | Action                                                 |
|-----------------------|--------------------------------------------------------|
| `<super><alt>d`       | Draw on the screen. `ctrl+number` to change pen color. |
| `<ctrl><alt><shift>r` | Record a short screen cast.                            |
| `<ctrl><alt>t`        | Open Terminal                                          |
| `<ctrl><alt>r`        | Open Launcher                                          |
| `<ctrl><alt>e`        | Open File Explorer                                     |
| `<super>d`            | Hide all Windows                                       |
| `<super><up>`         | Maximize Window                                        |
| `<super><down>`       | Hide Window                                            |

### Desktop Theme Customization

Customizations:

- Launcher: Gnome Dock
- Chinese Input
- Wallpapers for login screen, lock screen, and desktop background

Install these scripts for customization:
- `install-chinese-input.sh`
- `install-wallpaper.sh`

## Optional Install Scripts

In a fresh new installed Linux Distro, packages and features can be enabled by these install scripts:

| install script               | description                                      |
|------------------------------|--------------------------------------------------|
| `install/01-base/*`          | almost required for most conditions              |
| `install/02-develop/*`       | for development, editor, and runtime environment |
| `install/03-customization/*` | fonts installation; desktop theme customization  |
| `install/04-optional/*`      | other install scripts depends on necessary       |

## Fonts

- cns11643
- powerline font
- nerd fonts: Ubuntu, Hack, Source Code Pro, Mononoki
- emoji fonts: Noto

Nerd Font and Powerline Font is required for tmux, zsh, and vim powerline.

Install scripts:
- `install-fonts.sh`

## External Resources

- [google-chrome](https://www.google.com/linuxrepositories/)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-nvm](https://github.com/lukechilds/zsh-nvm)
- [vscode](https://code.visualstudio.com/docs/setup/linux)
- [nerd fonts](https://github.com/ryanoasis/nerd-fonts)
- [Google Noto Font](https://noto-website-2.storage.googleapis.com/pkgs/Noto-hinted.zip)
- [Brave Browser](https://brave.com/linux/#release-channel-installation)
- [Edge](https://packages.microsoft.com/repos/edge)

## How to Uninstall `env2`

This is a snippet to clean up `env2`:

```
$ rm -rf bin install README.md .tmux* .p10* .zsh* .pylintrc .git .oh-my-zsh*
$ exit
```

## License

MIT
