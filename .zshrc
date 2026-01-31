# =============================================================================
# .zshrc - Zsh Startup Configuration
# =============================================================================

# -----------------------------------------------------------------------------
# 基本環境変数
# -----------------------------------------------------------------------------
# SHELL はログイン時に自動設定されるため省略可ですが、明示したい場合は残す
# export SHELL=/bin/zsh
export EDITOR=vim
# タイムゾーンは地域名指定が推奨 (JST-9 も可ですが汎用性を考慮)
export TZ='Asia/Tokyo'

# dotfiles のルート（.zshrc があるディレクトリ）。別の場所なら .zshrc.local で DOTFILES を上書き
export DOTFILES="${DOTFILES:-$HOME/dotfiles}"

# -----------------------------------------------------------------------------
# 文字コード・ロケール
# -----------------------------------------------------------------------------
# UTF-8 統一（LC_CTYPE だけ設定でカーソル幅計算を安定させる）
case ${UID} in
  0) export LANG=C ;;
  *) export LANG=ja_JP.UTF-8 ;;
esac
export LC_CTYPE=$LANG
# LC_ALL は設定せず、必要に応じて .zshrc.local で上書き

# -----------------------------------------------------------------------------
# PATH & Environment
# -----------------------------------------------------------------------------
# typeset -U : 重複パスを自動的に削除する
typeset -U path PATH

# パスの優先順位設定 (上に書くほど優先度が高い)
path=(
  "${ASDF_DATA_DIR:-$HOME/.asdf}/shims"  # asdf は最優先
  $HOME/.local/bin
  $HOME/.vim/bin
  $HOME/local/bin
  $HOME/go/bin
  /opt/homebrew/bin       # Apple Silicon Mac
  /usr/local/bin          # Intel Mac / Linux
  /usr/local/sbin
  /usr/local/go/bin
  $path                   # システム標準パス(/bin, /usr/bin等)を末尾に追加
)
export PATH

# asdf の初期化
[ -f "${ASDF_DATA_DIR:-$HOME/.asdf}/asdf.sh" ] && . "${ASDF_DATA_DIR:-$HOME/.asdf}/asdf.sh"

# homebrew (Linux) の初期化
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

if [ -f $HOME/.cargo/env ]; then
  source "$HOME/.cargo/env"
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# -----------------------------------------------------------------------------
# シェルオプション
# -----------------------------------------------------------------------------
setopt auto_cd              # ディレクトリ名だけで cd
setopt auto_pushd           # cd -<tab> で過去のディレクトリを表示
setopt correct              # コマンドのスペルミスを指摘 (鬱陶しい場合は off 推奨)
setopt interactivecomments  # インタラクティブでも # 以降をコメント扱い
setopt list_packed          # 補完候補を詰めて表示
setopt noautoremoveslash    # 末尾スラッシュを削除しない
setopt nolistbeep           # 補完時にビープを鳴らさない
setopt magic_equal_subst    # = 以降も補完（--prefix=/usr など）
setopt pushd_ignore_dups    # pushd で重複ディレクトリを記録しない
setopt prompt_subst         # プロンプト内で変数展開
setopt transient_rprompt    # 実行後に右プロンプトを消す
setopt complete_aliases     # エイリアスも補完対象
setopt extendedglob         # (#q...) などの glob 修飾子（compinit キャッシュ判定で使用）
setopt no_nomatch          # グロブにマッチするファイルが無いときはそのまま渡す（git reset HEAD^ など）
setopt glob_dots          # . で始まるファイルも glob 補完対象に
setopt auto_menu          # Tab でメニュー補完（複数候補時）
setopt menu_complete      # 初回 Tab で即候補表示
setopt always_to_end      # 補完時にカーソルを語尾へ移動
setopt complete_in_word   # 単語途中でも補完

export KEYTIMEOUT=1       # ESC 後のモード切り替えを高速化（遅延ほぼゼロ）

# -----------------------------------------------------------------------------
# 履歴 (History)
# -----------------------------------------------------------------------------
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt extended_history      # 開始・終了時刻を記録
setopt hist_ignore_all_dups  # 重複は古い方を削除
setopt hist_ignore_space     # 先頭がスペースの行は履歴に残さない
setopt hist_verify           # 履歴から実行する前に編集可能にする
setopt hist_reduce_blanks    # 余分な空白を詰めて記録
setopt hist_save_no_dups     # 保存時に重複を除く
setopt hist_no_store         # history コマンド自体は履歴に登録しない
setopt hist_expand           # 補完時に履歴を展開
setopt share_history         # 履歴を他のシェルと共有


# -----------------------------------------------------------------------------
# atuin - 履歴管理の次世代ツール（zsh-vi-mode 対応 + フォールバック付き）
# -----------------------------------------------------------------------------
if command -v atuin &> /dev/null; then
  # 通常初期化（デフォルトバインドは zsh-vi-mode が上書きするので最小限）
  eval "$(atuin init zsh)"

  # zsh-vi-mode 公式推奨フック: viコマンドモードで ^R を atuin に再バインド（競合回避）
  return_zvm() {
    zvm_bindkey vicmd '^R' atuin-search
    zvm_bindkey viins '^R' atuin-search  # インサートモードも明示的に
  }
  zvm_after_init_commands+=(return_zvm)

  # 初回インポート推奨（ターミナルで一度だけ実行）
  # atuin import auto
else
  # atuin がない場合: 従来のインクリメンタル検索にフォールバック
  bindkey '^R' history-incremental-pattern-search-backward
  bindkey '^S' history-incremental-pattern-search-forward
fi

# -----------------------------------------------------------------------------
# 補完 (Completion)
# -----------------------------------------------------------------------------
# Homebrew の補完パス追加 (brew --prefix は遅いので固定パス判定で高速化)
if [ -d "/opt/homebrew/share/zsh/site-functions" ]; then
  fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)
elif [ -d "/usr/local/share/zsh/site-functions" ]; then
  fpath=("/usr/local/share/zsh/site-functions" $fpath)
fi

# asdf の補完
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# compinit の実行 (キャッシュ利用で高速化)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit -C  # 24時間以内ならキャッシュ利用（チェックなし）
else
  compinit -i
fi

zstyle ':completion:*' menu select
setopt complete_aliases

# -----------------------------------------------------------------------------
# キーバインド (Keybinds) - zsh-vi-mode 導入後の最小設定
# -----------------------------------------------------------------------------
# zsh-vi-mode が bindkey -v を上書きするため、手動 bindkey -v は不要（削除）

# 特殊キー（ターミナル依存で便利なので残す）
bindkey "^[[1~" beginning-of-line  # Home
bindkey "^[[4~" end-of-line        # End
bindkey "^[[3~" delete-char        # Delete
bindkey "\e[Z" reverse-menu-complete  # Shift-Tab

# history-substring-search（途中一致検索） - history-search-end の上位互換
# ↑↓キー（多くのターミナルで有効）
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# viコマンドモードで k/j を検索に活用（Vimらしい操作）
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# オプション: zsh-vi-mode のキーシーケンスタイムアウト調整（surround などのレスポンス向上）
# export ZVM_KEYTIMEOUT=0.1  # デフォルト0.4 → 0.1秒に短縮（好みで調整）

# -----------------------------------------------------------------------------
# その他 zsh 機能
# -----------------------------------------------------------------------------
autoload zed

# -----------------------------------------------------------------------------
# エイリアス
# -----------------------------------------------------------------------------
alias where='command -v'
alias j='jobs -l'

# ls
case "${OSTYPE}" in
  freebsd*|darwin*) alias ls='ls -G -w' ;;
  linux*)           alias ls='ls --color=auto' ;;
esac
alias la='ls -a'
alias lf='ls -F'
alias ll='ls -l'

# ユーティリティ
alias du='du -h'
alias df='df -h'
alias su='su -l'
# grep -n は削除(パイプ処理での事故防止)。必要な場合は grep -n を手打ちするか alias grepn を作る
alias grep='grep --color=auto'
alias grepa='grep --with-filename --line-number --color=always'

# less (環境依存のパスを避けて分岐)
export LESS='-R'
if [ -x /usr/share/source-highlight/src-hilite-lesspipe.sh ]; then
  export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
elif [ -x /usr/bin/src-hilite-lesspipe.sh ]; then
  alias lessh='LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" less -M'
fi

# Git
alias g='git'
alias ga='git add -p'
alias gr='git reset'
alias gs='git status'
alias gd='git diff'
alias gD='git diff --cached'
alias gb='git branch -a -v'
alias gl='git log --graph --pretty=format:"%Cblue%an: %Creset%s - %Cred%h%Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative --all'
alias gz='git log --graph --date=short --pretty=format:"%Cgreen%h %cd %Cblue%cn %Creset%s" --all'
alias glh='git log --graph --date=short --pretty=format:"%Creset%s" --all'
alias glp='git log -p'
alias gls='git log --pretty=short'
alias gcp='git cherry-pick'

if command -v delta &> /dev/null; then
  alias diff='delta'
fi

# eza (ls の代替)
if command -v eza &> /dev/null; then
  alias ls='eza --icons --git'
  alias ll='eza --icons --git -l'
  alias la='eza --icons --git -la'
  alias lt='eza --icons --git -T' # ツリー表示
fi

# bat (cat の代替)
if command -v bat &> /dev/null; then
  alias cat='bat'
  alias less='bat --paging=always'
fi

if command -v fd &> /dev/null; then
  alias find='fd'
fi

# コマンドの差し替え
if command -v nvim &> /dev/null; then
  alias vim='nvim'
fi

# -----------------------------------------------------------------------------
# 外部ツール
# -----------------------------------------------------------------------------
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_LEGACY_KEYBINDINGS=0
export FZF_FIND_FILE_COMMAND=$FZF_DEFAULT_COMMAND
export RIPGREP_CONFIG_PATH=$HOME/.config/.ripgreprc

# スターシップ等のプロンプト初期化 (最後の方に置くのが安全)
command -v starship &> /dev/null && eval "$(starship init zsh)"
command -v fzf &> /dev/null && eval "$(fzf --zsh)"
command -v zoxide &> /dev/null && eval "$(zoxide init zsh)"
command -v direnv &> /dev/null && eval "$(direnv hook zsh)"

# fzf-tab のスタイル・プレビュー設定（好みで調整）
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' switch-group ',' '.'  # ,/. でグループ切り替え

# プレビュー例（git branch 補完時に log 表示など）
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'  # eza 導入時

# -----------------------------------------------------------------------------
# プラグイン管理 (Sheldon)
# -----------------------------------------------------------------------------
# 【重要】compinit より前に読み込む (fpath を通すため)
if command -v sheldon &> /dev/null; then
  eval "$(sheldon source)"
fi

# zsh-syntax-highlighting（手動導入時）。フルに clone した場合のみ読み込む
if [[ -d "$DOTFILES/zsh-syntax-highlighting/highlighters" ]]; then
  source "$DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# -----------------------------------------------------------------------------
# ローカル設定
# -----------------------------------------------------------------------------
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
