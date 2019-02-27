# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="afowler"
#ZSH_THEME="steeef"
ZSH_THEME="fedorov"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-completions cargo kubectl python pip colored-man-pages cp extract golang zsh-syntax-highlighting docker docker-compose)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

# User configuration

[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.local/bin"

# set linux brew bin PATH
#if [ -d "$HOME/.linuxbrew/bin" ] ; then
#    PATH="$HOME/.linuxbrew/bin:$PATH"
#fi

if [ -d "/usr/lib/ccache" ] ; then
    PATH="/usr/lib/ccache:$PATH"
fi

# golang support
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

export PATH="$PATH:/snap/bin"

#rust cargo support
export PATH="$PATH:$HOME/.cargo/bin"

# npm support
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# linuxbrew
# export PATH="$HOME/.linuxbrew/bin:$PATH"
# export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
# export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias gitv="nvim -c Gitv"

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
