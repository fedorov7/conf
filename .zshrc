export HISTFILE=~/.zsh_history

# zplug support
source ~/.zplug/init.zsh

# Load completion library for those sweet [tab] squares
zplug "lib/completion", from:oh-my-zsh
zplug "lib/function", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings:", from:oh-my-zsh

# Supports oh-my-zsh plugins and the like
zplug "plugins/cargo",   from:oh-my-zsh
zplug "plugins/colored-man-pages",   from:oh-my-zsh
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/docker-compose",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/extract",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/golang",   from:oh-my-zsh
zplug "plugins/kubectl",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/python",   from:oh-my-zsh

zplug "fedorov7/conf", use:fedorov.zsh-theme, from:github, as:theme

zplug "zsh-users/zsh-completions", from:github

zplug "zsh-users/zsh-history-substring-search", from:github, as:plugin

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# User configuration

[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.local/bin"

# set linux brew bin PATH
#if [ -d "$HOME/.linuxbrew/bin" ] ; then
#    PATH="$HOME/.linuxbrew/bin:$PATH"
#fi

#if [ -d "/usr/lib/ccache" ] ; then
#    PATH="/usr/lib/ccache:$PATH"
#fi

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
