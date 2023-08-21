# Detect non-interactive shells
if [[ ! $- == *i* ]]; then
  return;
fi

################################################
## ZPLUG
if [ ! -d ~/.zplug ]; then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

## CONFIG
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

## PLUGINS
zplug 'zsh-users/zsh-syntax-highlighting'
# zplug 'zsh-users/zsh-completions'
# zplug 'zsh-users/zsh-autosuggestions'
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# THEME
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_STATUS_CROSS=true

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_BACKGROUND="yellow"
POWERLEVEL9K_TIME_FOREGROUND="black"
POWERLEVEL9K_TIME_FORMAT="%B%D{%H:%M:%S}"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL9K_OS_ICON_FOREGROUND="108"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

if [ "$TERM" != 'linux' ]; then
  source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
else
  export PS1="%{%F{yellow}%}%n%{%f%} %~ › "
fi

# Install packages
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi
zplug load

fpath=(~/.zsh/completion $fpath)

export PATH=$PATH:$HOME/.local/bin/

## History wrapper
function omz_history {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    echo >&2 History file deleted. Reload the session to see its effects.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}

# Timestamp format
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
# setopt extended_history       # record timestamp of command in HISTFILE
# setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
# setopt hist_ignore_dups       # ignore duplicated commands history list
# setopt hist_ignore_space      # ignore commands that start with space
# setopt hist_verify            # show command with history expansion to user before running it
# setopt inc_append_history     # add commands to HISTFILE in order of execution
# setopt share_history          # share command history data

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
# autoload -Uz history-search-end
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
bindkey $'\E[1;5D' vi-backward-blank-word
bindkey $'\E[1;5C' vi-forward-blank-word
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# TAR
compress () { tar cfvz $1.tgz $1 }
extract () { tar xfvz $1 }

# Git
alias g='git'
alias gs='g stash'
alias gsp='gs pop'
alias gfp='git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)' # Reset the current branch to the origin state

function rebase {
    git fetch origin
    git checkout master
    git pull
    git checkout -
    git rebase -i master
}

function gb {
    git stash
    git fetch origin
    git checkout master
    git pull
    git checkout -
    git checkout -b $1
    git stash pop
}

# Misc
alias sz='source ~/.zshrc'
alias api='cd ~/projects/i24news.tv'
alias front='cd ~/projects/i24-reader'
alias back='cd ~/projects/i24NEWS-admin'
alias stack='cd ~/projects/i24news-stack'
alias friends='cd ~/projects/i24news-friends'


alias detec-docker-cadav='docker service ls | awk "{print \$4,\$2}" | grep -P "(\d)\/(?!\1)"'

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}


# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
