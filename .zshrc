# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# if in terminal recording mode, use a simpler prompt
ZSH_THEME_RANDOM_CANDIDATES=(
    "wezm" "miloshadzic" "gozilla" "crunch" "wuffers" "miloshadzic"
    "apple" "kolo" "avit" "minimal" "amuse" "frontcube"
    )
[[ "${ASCIINEMA_REC}" == "1" ]] && { ZSH_THEME="random" }

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()
plugins+=(ssh-agent)
command -v gpg-agent > /dev/null \
    && plugins+=(gpg-agent)
plugins+=(autojump)
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('esctags eslint instant-markdown-d')
plugins+=(zsh-nvm)
plugins+=(vi-mode)
plugins+=(command-not-found)
plugins+=(safe-paste)
plugins+=(history-substring-search)
plugins+=(fzf)
plugins+=(pipenv)
plugins+=(thefuck)
plugins+=(kubectl)
[[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] \
    && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
    || plugins+=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
#
# preferred nvim
command -v nvim > /dev/null && EDITOR=nvim || EDITOR=vim
[[ -z "$DISPLAY" ]] && alias vi="$EDITOR -X" || alias vi="$EDITOR"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=tty --group-directories-first'
function ra {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}
function s {
    case $(($RANDOM % 4)) in
    0)
        # yellow, purple
        neofetch --colors 13 8 8 3 8 7 --ascii_colors 5 3 8 8 8 8
        ;;
    1)
        # purple, green
        neofetch --colors 2 8 8 13 8 7 --ascii_colors 5 2 8 8 8 8
        ;;
    2)
        # blue, purple
        neofetch --colors 6 5 8 6 8 8 --ascii_colors 5 6 8 8 8 8
        ;;
    *)
        distros=(
            AIX Alpine Anarchy Android Antergos antiX AOSC
            Apricity ArcoLinux ArchBox ARCHlabs ArchStrike
            XFerience ArchMerge Arch Artix Arya Bedrock Bitrig
            BlackArch BLAG BlankOn BlueLight bonsai BSD
            BunsenLabs Calculate Carbs CentOS Chakra ChaletOS
            Chapeau Chrom Cleanjaro ClearOS Clear_Linux Clover
            Condres Container_Linux CRUX Cucumber Debian Deepin
            DesaOS Devuan DracOS DragonFly Drauger Elementary
            EndeavourOS Endless EuroLinux Exherbo Fedora Feren FreeBSD
            FreeMiNT Frugalware Funtoo GalliumOS Gentoo Pentoo
            gNewSense GNU GoboLinux Grombyang Guix Haiku Huayra
            Hyperbola janus Kali KaOS KDE_neon Kibojoe Kogaion
            Korora KSLinux Kubuntu LEDE LFS Linux_Lite
            LMDE Lubuntu Lunar macos Mageia MagpieOS Mandriva
            Manjaro Maui Mer Minix LinuxMint MX_Linux Namib
            Neptune NetBSD Netrunner Nitrux NixOS Nurunner
            NuTyX OBRevenge OpenBSD OpenIndiana OpenMandriva
            OpenWrt osmc Oracle PacBSD Parabola Pardus Parrot
            Parsix TrueOS PCLinuxOS Peppermint popos Porteus
            PostMarketOS Proxmox Puppy PureOS Qubes Radix Raspbian
            Reborn_OS Redstar Redcore Redhat Refracted_Devuan Regata
            Rosa sabotage Sabayon Sailfish SalentOS Scientific Septor
            SharkLinux Siduction Slackware SliTaz SmartOS Solus
            Source_Mage Sparky Star SteamOS SunOS openSUSE_Leap
            openSUSE_Tumbleweed openSUSE SwagArch Tails Trisquel
            Ubuntu-Budgie Ubuntu-GNOME Ubuntu-MATE Ubuntu-Studio Ubuntu
            Void Obarun windows10 Windows7 Xubuntu Zorin and IRIX
            Arch_old Ubuntu_old Redhat_old Dragonfly_old
            Ubuntu-Mate Ubuntu-Budgie
            Arcolinux_small Dragonfly_small Fedora_small Alpine_small Arch_small Ubuntu_small
            CRUX_small Debian_small Gentoo_small FreeBSD_small Mac_small NixOS_small OpenBSD_small android_small
            Antrix_small CentOS_small Cleanjaro_small ElementaryOS_small GUIX_small Hyperbola_small
            Manjaro_small MXLinux_small NetBSD_small Parabola_small POP_OS_small PureOS_small
            Slackware_small SunOS_small LinuxLite_small OpenSUSE_small Raspbian_small
            postmarketOS_small Void_small
        )
        distro=${distros[$RANDOM % ${#distros[@]} ]}

        case $(($RANDOM % 5)) in
        0)
            # wallpaper with chaos
            neofetch --colors $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) \
                --chafa
            ;;
        1)
            # ubuntu in a chaos
            neofetch --colors $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) \
                --ascii_colors $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16))
            ;;
        2)
            # not a mac
            neofetch --ascii-distro mac
            ;;
        3)
            # distro chaos
            echo Introducing $distro !
            neofetch --ascii_distro $distro
            ;;
        *)
            # totally chaos
            echo Itnorudicng $distro !
            neofetch --colors $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) \
                --ascii_colors $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) \
                --ascii_distro $distro
            ;;
        esac
        ;;
    esac
}

# Plugin Sections

# for history-substring-search post-configuration
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# bind Alt+Return to insert a literal newline in a multiline zsh command
bindkey '^[^M' self-insert-unmeta

# for zsh-autosuggestions
bindkey '^f' autosuggest-accept

# for color partial tab completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# for fzf default command to ignore .git/* files
export FZF_DEFAULT_COMMAND='rg --files'

# for fzf preview configuration
# example: /usr/share/doc/fzf/examples/key-bindings.zsh
export FZF_CTRL_T_OPTS="--preview \
    '(mimetype=\$(file --mime {}) ; \
        [[ \$mimetype =~ directory ]] && tree -C -L 1 {} || \
        [[ \$mimetype =~ binary ]] && xxd {} || \
        highlight -O ansi -l {} 2> /dev/null || \
        highlight -O ansi -l -S txt {} 2> /dev/null || \
        cat {} \
    ) 2> /dev/null | head -500' \
    --preview-window=right:66%"
export FZF_DEFAULT_OPTS="--height=80%"

# zsh-syntax-highlighting must be last plugin
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] \
    && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    || source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Login Messages for ./install/install-fail2cam.sh
[[ -a /tmp/fail2cam-`hostname`-*.png ]] && ( echo "###FAIL2CAM WARNING###"; ls -al /tmp/fail2cam-`hostname`-*.png )

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Powerlevel10k Personal Customization
[[ ! -f ~/.p10k.local.zsh ]] || source ~/.p10k.local.zsh
