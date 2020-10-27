# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins+=(autojump)
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
plugins+=(zsh-nvm)
plugins+=(vi-mode)
plugins+=(command-not-found)
plugins+=(safe-paste)
plugins+=(history-substring-search)
plugins+=(fzf)
plugins+=(pipenv)
plugins+=(thefuck)

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
which nvim > /dev/null && { export EDITOR='nvim' ; alias vi="nvim" } || { export EDITOR='vim' ; alias vi="vim" }

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=tty --group-directories-first'
alias ra='ranger'
alias s='case $(($RANDOM % 10)) in
    0|1|2)
        # yellow, purple
        neofetch --colors 13 8 8 3 8 7 --ascii_colors 5 3 8 8 8 8
        ;;
    3|4|5)
        # purple, green
        neofetch --colors 2 8 8 13 8 7 --ascii_colors 5 2 8 8 8 8
        ;;
    6|7|8)
        # blue, purple
        neofetch --colors 6 5 8 6 8 8 --ascii_colors 5 6 8 8 8 8
        ;;
    *)
        # chaos
        neofetch --colors $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) \
            --ascii_colors $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16)) $(($RANDOM % 16))
        ;;
esac'

# Plugin Sections

# for history-substring-search post-configuration
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# for zsh-autosuggestions
bindkey '^f' autosuggest-accept

# for color partial tab completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# plugins by apt install
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# for kubectl completion
function kubectl() {
  if ! type __start_kubectl >/dev/null 2>&1; then
    source <(command kubectl completion zsh)
  fi
  command kubectl "$@"
}

# Login Messages for ./install/install-fail2cam.sh
[[ -a /tmp/fail2cam-`hostname`-*.png ]] && ( echo "###FAIL2CAM WARNING###"; ls -al /tmp/fail2cam-`hostname`-*.png )

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Powerlevel10k Personal Customization
[[ ! -f ~/.p10k.local.zsh ]] || source ~/.p10k.local.zsh
