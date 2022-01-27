export SHELL=/usr/bin/zsh
export TERM=xterm-256color
export EDITOR=vim


# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac
export LANG=ja_JP.UTF-8
eval $(/usr/bin/locale-check C.UTF-8)

export TZ=JST-9

export DISPLAY=:0.0
#export PATH=/usr/local/bin:/bin:/usr/local/sbin/:/usr/local/mysql/bin:$PATH:/usr/sbin:$HOME/local/bin:/usr/local/libexec/git-core/
#export PATH=$PATH:$HOME/local/bin
export PATH=$PATH:$HOME/.vim/bin:$HOME/local/bin:/usr/local/bin:/bin:/usr/local/sbin/:$HOME/local/AdobeAIRSDK/bin:/usr/local/flex3/bin:/usr/local/mysql/bin:/usr/sbin:$HOME/local/flex_sdk_4.1.0/bin:/var/lib/gems/1.8/bin:$HOME/local/android-sdk-linux_x86/tools:/opt/airsdk/bin:/opt/flex/bin
export PERL5LIB=$PERL5LIB:./lib
# export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.20
# export JAVA_HOME=/usr/lib/jvm/java-6-sun
# export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:/home/pochy/glassfishv3/jdk/lib:/home/pochy/glassfishv3/jdk/jre/lib:/home/pochy/glassfishv3/mq/lib

export DISPLAY=127.0.0.1:0.0
export LIBGL_ALWAYS_INDIRECT=1
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

#export RBENV_ROOT="/opt/rbenv"
#export PATH="${RBENV_ROOT}/bin:${PATH}"
#eval "$(rbenv init -)"

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="%{${fg[red]}%}%~%%%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -v
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color=auto"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"
alias grep="grep -n --color=auto "
alias grepa="grep --with-filename --line-number --color=always"
LESS=' -R '
LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
alias lessh='LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" less -M '


## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# bindkey "^H" backward-delete-char

# /usr/lib/oracle/xe/app/oracle/product/10.2.0/client/bin/oracle_env.sh


# ${fg[...]} や $reset_color をロード
autoload -U colors; colors


function locallib () {
  INSTALL_BASE=$1
  if [ -d $INSTALL_BASE ]; then
    eval $(~/local/bin/use-locallib $INSTALL_BASE)
  fi
}

# locallib $HOME/extlib/local

function rprompt-git-current-branch {
        local name st color
        name=`git branch 2> /dev/null | grep '^\*' | cut -b 3-`
        if [[ -z $name ]]; then
                return
        fi
        st=`git status`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=${fg[green]}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=${fg[yellow]}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=${fg_bold[red]}
        else
                color=${fg[red]}
        fi

        if [ "$INSTALL_BASE" = "" ]; then
          CURRENT_LOCALLIB=""
        else
          CURRENT_LOCALLIB="%{${fg[magenta]}%}$(echo $INSTALL_BASE | sed -e "s|$HOME/||; s|extlib/||") %{$reset_color%}"
        fi
        # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
        # これをしないと右プロンプトの位置がずれる
        echo "${CURRENT_LOCALLIB}%{$color%}$name%{$reset_color%} "
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

RPROMPT='[`rprompt-git-current-branch`]'

alias g="git"
alias ga="git add -p"
alias gr="git reset"
# alias go="git checkout"
alias gs="git status"
alias gd="git diff"
alias gD="git diff --cached"
alias gb="git branch -a -v"
alias gl="git log --graph --pretty=format:'%Cblue%an: %Creset%s - %Cred%h%Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --all"
alias gz="git log --graph --date=short --pretty=format:'%Cgreen%h %cd %Cblue%cn %Creset%s' --all"
alias gh="git log --graph --date=short --pretty=format:'%Creset%s' --all"
alias glp="git log -p"
alias gls="git log --pretty=short"
alias gcp="git cherry-pick"

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forwar

autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

autoload -Uz surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround


export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.yarn.lock}" -g "!yarn.lock"'

## load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine
