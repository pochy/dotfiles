export SHELL=/bin/zsh
#export TERM=xterm-256color
export EDITOR=vim

export TZ=JST-9
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# users generic .zshrc file for zsh(1)

## ======================================
## Environment variable configuration
## ======================================
#
# LANG
# 文字コードはUTF-8
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac
#eval $(/usr/bin/locale-check C.UTF-8)
export LANG=ja_JP.UTF-8
# not working Mac
#eval $(/usr/bin/locale-check C.UTF-8)


## ======================================
## PATH
## ======================================
#
export PATH=$PATH:$HOME/.local/bin:$HOME/.vim/bin:$HOME/local/bin:/usr/local/bin:/bin:/usr/local/sbin/:/usr/local/mysql/bin:/usr/sbin
export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

if [ -f $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
  export PATH="$HOME/.cargo/bin:$PATH"
fi

export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

#export PATH="$HOME/.anyenv/bin:$PATH"
#eval "$(anyenv init -)"
#eval "$(nodenv init -)"

#export PATH="$HOME/bin:$PATH"
#export DOCKER_HOST='tcp://127.0.0.1:2375'
#export DOCKER_HOST='unix:///Users/pochy/.lima/docker_x86_64/sock/docker.sock'

#export RBENV_ROOT="/opt/rbenv"
#export PATH="${RBENV_ROOT}/bin:${PATH}"
#eval "$(rbenv init -)"

## ======================================
## Default shell configuration
## ======================================
#
# set prompt
#

# auto change directory
# ディレクトリ名でcd
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# command correct edition before each completion attempt
# コマンドのスペルミスを指摘
setopt correct

# インタラクティブシェルでもコメントを許可する
setopt interactivecomments

# compacked complete list display
# 候補が多い場合は詰めて表示
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
# 補完候補表示時にビープ音を鳴らさない
setopt nolistbeep

# コマンドラインの引数でも補完を有効にする（--prefix=/userなど）
setopt magic_equal_subst

# auto_pushdで重複するディレクトリは記録しない
setopt pushd_ignore_dups


## ======================================
## Command history configuration
## ======================================
#
HISTFILE=${HOME}/.zsh_history
# メモリ上に保存される件数（検索できる件数）
HISTSIZE=100000
export HISTFILESIZE=100000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 保管時にヒストリを自動的に展開
setopt hist_expand
# history共有
setopt share_history

# historical backward/forward search with linehead string binded to ^P/^N
# 履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


## ======================================
## Keybind configuration
## ======================================
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -v
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## ======================================
## Completion configuration
## ======================================
# autoload -Uz compinit
# compinit

autoload -Uz compinit && compinit -i  # 補完を有効にする
zstyle ':completion:*' menu select  # Tab で選択中の項目をハイライト


## ======================================
## zsh editor
## ======================================
#
autoload zed


## ======================================
## Prediction configuration
## ======================================
#
#autoload predict-on
#predict-off


## ======================================
## Alias configuration
## ======================================
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


## ======================================
## terminal configuration
## ======================================
#

# bindkey "^H" backward-delete-char


## ======================================
## prompt configuration
## ======================================
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
# コマンドの実行直後に右プロンプトが消える。
setopt transient_rprompt

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
alias glh="git log --graph --date=short --pretty=format:'%Creset%s' --all"
alias glp="git log -p"
alias gls="git log --pretty=short"
alias gcp="git cherry-pick"
alias vim="nvim"


alias vim="nvim"

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

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

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


export FZF_DEFAULT_COMMAND="rg --files --follow --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_LEGACY_KEYBINDINGS=0
export FZF_FIND_FILE_COMMAND=$FZF_DEFAULT_COMMAND
export RIPGREP_CONFIG_PATH=$HOME/.config/.ripgreprc


## ======================================
## env
## ======================================
#export PATH="$HOME/.anyenv/bin:$PATH"
#eval "$(anyenv init -)"

#. "$HOME/.asdf/asdf.sh"

## ======================================
## oh-my-zsh
## ======================================
plugins=(
  asdf last-working-dir command-not-found
)

## ======================================
## other
## ======================================
eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

## load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

export PATH="$PATH:$(go env GOPATH)/bin"
[ -f "/Users/pochy/.ghcup/env" ] && source "/Users/pochy/.ghcup/env" # ghcup-env

eval "$(starship init zsh)"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/pochy/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Added by Windsurf
export PATH="/Users/pochy/.codeium/windsurf/bin:$PATH"
# source ~/miniconda3/bin/activate  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pochy/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pochy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/pochy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pochy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# pnpm
export PNPM_HOME="/Users/pochy/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export ENHANCD_HOOK_AFTER_CD=""
