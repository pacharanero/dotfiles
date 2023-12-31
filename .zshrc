# If you come from bash you might have to change your $PATH.

# android
export ANDROID_HOME="$HOME/apps/android-studio"
export PATH=$PATH:$ANDROID_HOME/bin
# java
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
# neo4j
export PATH=$PATH:"$PATH/home/marcus/.config/Neo4j Desktop/Application/neo4jDatabases/database-f9dc145a-cd00-46cd-93c5-bb8753c1fdb6/installation-3.5.2/bin"
# flutter
export PATH=$PATH:$HOME/node_modules/karma/bin:$HOME/bin:/usr/local/bin:$HOME/Android/Sdk/platform-tools
export PATH=$PATH:$HOME/code/flutter/flutter/bin
# aws cli
export PATH=~/.local/bin:$PATH
# golang
export PATH=$PATH:/usr/local/go/bin
# rbenv
export PATH=$PATH:/home/marcus/.rbenv/bin

# Path to your oh-my-zsh installation.
export ZSH=/home/marcus/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# (set to "" means no theme)
ZSH_THEME="bira" # previously tried: agnoster bira avit amuse blinks

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(git git-extras wd ruby docker docker-compose nvm gem npm pip rbenv poetry pyenv ansible)

source $ZSH/oh-my-zsh.sh

######## User configuration ########
# ### ALIASES ###
alias dc='docker-compose'
alias h='heroku'
alias v='vagrant'
alias dk='docker'
alias oc='overcast'
alias yt='youtube-dl'
alias bb='brave-browser'
alias brave='brave-browser'
alias c.='code .'

# quick update and profile changes aliases
alias doupdates="sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt autoclean && sudo apt autoremove"
alias profile="sudo nano /etc/profile && source /etc/profile"
alias configs="/home/marcus/code/s/configs.sh"

# apt and package management aliases
alias sai='sudo apt install'
alias sar='sudo apt remove'
alias sau='sudo apt update'
alias sacs='sudo apt-cache search'
alias sad='sudo apt dist-upgrade'
alias saar='sudo apt-add-repository'
alias saa='sudo apt autoremove'

# git
alias branches="git log --graph --decorate --oneline"
alias git-remote-ls="git remote get-url --all origin"

# file operations aliases
#alias cp='cp -iv' # makes cp command more verbose and ask for confirmation on overwrite/delete
#alias mv='mv -iv' # makes mv command more verbose and ask for confirmation on overwrite/delete
#alias rm='rm -i'  # makes rm command more verbose and ask for confirmation on overwrite/delete
alias la='ls -alh' # makes ls command more verbose and uses human-readable file sizes

# dotfiles managed as bare Git repository
# see https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# rails development aliases
alias rg='rails generate'
alias migrate='rails db:migrate'

# ### RUBY (RBENV) ###
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ### NODE NPM & NVM ###
export NVM_DIR="/home/marcus/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# ### PYTHON ###
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ### TAB COMPLETIONS ###

# required for ZSH to be able to work with bash tab completion:
autoload -U +X bashcompinit && bashcompinit

# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/marcus/anaconda3/bin/conda' shell.bash hook 2>/dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/marcus/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/marcus/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/marcus/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Overcast Tab completion
_overcast_completions() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(compgen -W "$(overcast completions)" -- "$cur"))
    return 0
}
complete -F _overcast_completions overcast

zstyle ':completion:*' completer _expand_alias _complete _ignored

setopt INC_APPEND_HISTORY

# mosh tab completion
compdef mosh=ssh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/marcus/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/home/marcus/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/marcus/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/marcus/tmp/google-cloud-sdk/completion.zsh.inc'; fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
