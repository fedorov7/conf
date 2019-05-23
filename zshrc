export HISTFILE=~/.zsh_history

# zplug support
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

# Load completion library for those sweet [tab] squares
zplug "lib/completion", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/grep", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/spectrum", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh

# Supports oh-my-zsh plugins
zplug "plugins/cargo",   from:oh-my-zsh
zplug "plugins/colored-man-pages",   from:oh-my-zsh
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/docker-compose",   from:oh-my-zsh
zplug "plugins/extract",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/gitignore",   from:oh-my-zsh
zplug "plugins/golang",   from:oh-my-zsh
zplug "plugins/kubectl",   from:oh-my-zsh
zplug "plugins/npm",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/python",   from:oh-my-zsh
zplug "plugins/web-search",   from:oh-my-zsh

# Supports prezto plugins
zplug "modules/spectrum", from:prezto
zplug "modules/archive", from:prezto

# Custom theme
zplug "fedorov7/conf", use:fedorov.zsh-theme, from:github, as:theme

# Custom user configuration
zplug "fedorov7/conf", use:"zshrc.user"

# Custom osx configuration
zplug "fedorov7/conf", use:"zshrc.darwin", if:"[[ $OSTYPE == *darwin* ]]"

# Custom linux configuration
zplug "fedorov7/conf", use:"zshrc.linux", if:"[[ $OSTYPE == *linux* ]]"

# Custom commands
zplug "fedorov7/conf", as:command, use:"bin/uuidc.py", rename-to:uuidc

# Supports zsh-users
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-history-substring-search", from:github, as:plugin

# Bind terminal-specific up and down keys
# Bind in both emacs and vi modes so it works in both, and is not
# sensitive to whether this is loaded before or after the vi-mode plugin
if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey '^[[A' history-substring-search-up
  bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
  bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi
if [[ -n "$terminfo[kcud1]" ]]; then
  bindkey '^[[B' history-substring-search-down
  bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
  bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi

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
