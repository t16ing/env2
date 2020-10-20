# The list of segments shown on the left. Fill it with the most important segments.
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  os_icon                 # os identifier
  direnv                  # direnv status (https://direnv.net/)
  virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
  dir                     # current directory
  dir_writable            # powerlevel9k style dir writable state
  vcs                     # git status
  # =========================[ Line #2 ]=========================
  newline                 # \n
  vi_mode                 # vi mode (you don't need this if you've enabled prompt_char)
  prompt_char             # prompt symbol
)

# The list of segments shown on the right. Fill it with less important segments.
# Right prompt on the last prompt line (where you are typing your commands) gets
# automatically hidden when the input line reaches it. Right prompt above the
# last prompt line gets hidden if it would overlap with left prompt.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  commit_message
  asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
  anaconda                # conda environment (https://conda.io/)
  pyenv                   # python environment (https://github.com/pyenv/pyenv)
  goenv                   # go environment (https://github.com/syndbg/goenv)
  nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
  nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
  nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
  # node_version          # node.js version
  # go_version            # go version (https://golang.org)
  # rust_version          # rustc version (https://www.rust-lang.org)
  # dotnet_version        # .NET version (https://dotnet.microsoft.com)
  # php_version           # php version (https://www.php.net/)
  # laravel_version       # laravel php framework version (https://laravel.com/)
  # java_version          # java version (https://www.java.com/)
  # package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
  rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
  rvm                     # ruby version from rvm (https://rvm.io)
  fvm                     # flutter version management (https://github.com/leoafarias/fvm)
  luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
  jenv                    # java version from jenv (https://github.com/jenv/jenv)
  plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
  phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
  scalaenv                # scala version from scalaenv (https://github.com/scalaenv/scalaenv)
  haskell_stack           # haskell version from stack (https://haskellstack.org/)
  kubecontext             # current kubernetes context (https://kubernetes.io/)
  terraform               # terraform workspace (https://www.terraform.io)
  aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
  aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
  azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
  gcloud                  # google cloud cli account and project (https://cloud.google.com/)
  google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
  context                 # user@hostname
  nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
  ranger                  # ranger shell (https://github.com/ranger/ranger)
  nnn                     # nnn shell (https://github.com/jarun/nnn)
  vim_shell               # vim shell indicator (:sh)
  midnight_commander      # midnight commander shell (https://midnight-commander.org/)
  nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
  # vpn_ip                # virtual private network indicator
  # load                  # CPU load
  # disk_usage            # disk usage
  # swap                  # used swap
  todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
  timewarrior             # timewarrior tracking status (https://timewarrior.net/)
  taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
  ram                   # free RAM
  battery               # internal battery
  ip                    # ip address and bandwidth usage for a specified network interface
  wifi                  # wifi speed
  public_ip             # public IP address
  # =========================[ Line #2 ]=========================
  newline
  status                  # exit code of the last command
  command_execution_time  # duration of the last command
  background_jobs         # presence of background jobs
  history
  time                    # current time
  # proxy                 # system-wide http/https/ftp proxy
  # example               # example user-defined segment (see prompt_example function below)
)

# Defines character set used by powerlevel10k. It's best to let `p10k configure` set it for you.
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'

##################################[ dir: current directory ]##################################
# If set to true, embed a hyperlink into the directory. Useful for quickly
# opening a directory in the file manager simply by clicking the link.
# Can also be handy when the directory is shortened, as it allows you to see
# the full directory that was used in previous commands.
typeset -g POWERLEVEL9K_DIR_HYPERLINK=true
# Enable special styling for non-writable directories. See POWERLEVEL9K_LOCK_ICON and
# POWERLEVEL9K_DIR_CLASSES below.
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v1
# The default icon shown next to non-writable directories when POWERLEVEL9K_DIR_SHOW_WRITABLE is
# set to v2.
typeset -g POWERLEVEL9K_LOCK_ICON=''

#####################################[ vcs: git status ]######################################
# Branch icon. Set this parameter to '\uF126 ' for the popular Powerline branch icon.
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '

# Don't show Git status in prompt for repositories whose workdir matches this pattern.
# For example, if set to '~', the Git repository at $HOME/.git will be ignored.
# Multiple patterns can be combined with '|': '~(|/foo)|/bar/baz/*'.
typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN=''

##########################[ status: exit code of the last command ]###########################
# Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
# it will signify success by turning green.
typeset -g POWERLEVEL9K_STATUS_OK=true

# Status when some part of a pipe command fails but the overall exit status is zero. It may look
# like this: 1|0.
typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true

# Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
# it will signify error by turning red.
typeset -g POWERLEVEL9K_STATUS_ERROR=true

# Status when the last command was terminated by a signal.  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
# Use terse signal names: "INT" instead of "SIGINT(2)".
typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=true

# Status when some part of a pipe command fails and the overall exit status is also non-zero.
# It may look like this: 1|0.
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true

###################[ command_execution_time: duration of the last command ]###################
# Execution time color.
# Show duration of the last command if takes at least this many seconds.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
# Show this many fractional digits. Zero means round to seconds.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3

#######################[ background_jobs: presence of background jobs ]#######################
# Show the number of background jobs.
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true
# Custom icon.
#typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='≡'

###########[ vi_mode: vi mode (you don't need this if you've enabled prompt_char) ]###########
# Text and color for insert vi mode.
typeset -g POWERLEVEL9K_VI_INSERT_MODE_STRING=

###########[ ip: ip address and bandwidth usage for a specified network interface ]###########
# Run `ifconfig` or `ip -4 a show` to see the names of all network interfaces.
typeset -g POWERLEVEL9K_IP_INTERFACE='(e.*|w.*)'

################################[ battery: internal battery ]#################################
# Show battery in red when it's below this level and not connected to power supply.
# Show the remaining time to charge/discharge.
typeset -g POWERLEVEL9K_BATTERY_VERBOSE=true

####################################[ time: current time ]####################################
# Format for the current time: 09:51:02. See `man 3 strftime`.
typeset -g POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %Y-%m-%d}"
# If set to true, time will update when you hit enter. This way prompts for the past
# commands will contain the start times of their commands as opposed to the default
# behavior where they contain the end times of their preceding commands.
typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=true
