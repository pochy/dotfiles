# Neovim Configuration

このディレクトリは [LazyVim](https://github.com/LazyVim/LazyVim) をベースにした Neovim 設定です。トップレベルの dotfiles リポジトリから `~/.config/nvim` へリンクして使う前提です。

## 前提条件

- Neovim 0.11.2 以上
- Git 2.19 以上
- Nerd Font v3 以上を推奨
- `tree-sitter` CLI と C コンパイラを推奨
- `ripgrep`, `fd`, `lazygit`, `yazi` は入っていると便利

## インストール

トップレベルの README に従って dotfiles 全体を clone した後、次を実行します。

```bash
ln -sfn "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
nvim
```

初回起動時に Lazy.nvim がプラグインを自動インストールします。

## 現在の挙動

- デフォルトのカラースキームは `catppuccin`
- 代替として `tokyonight` と `gruvbox-material` をインストール済み
- lualine に tmux セッション名を表示
- `markdown`, `text`, `gitcommit` は診断を既定で無効化
  必要なら `<leader>ct` で現在バッファの診断を再有効化できます。
- カレントディレクトリか親ディレクトリに `project.godot` がある場合は Godot 用の server pipe を開始
- `:ConfigReload` と `<leader>cR` で設定を部分的に再読み込み可能
- `lua/plugins/example.lua` は upstream の無効化済みサンプルで、実際の設定には使っていません

## 主なカスタムプラグイン

- `dial.nvim`
  `+` / `-` で数値、日付、semver、bool などを増減します。
- `blink.cmp`
  `<leader>ux` で補完を一時的に ON / OFF できます。
- `neogen`
  `<leader>cn` で注釈を自動生成します。
- `refactoring.nvim`
  ビジュアルモードで `<leader>r` を押すとリファクタリングメニューを開きます。
- `outline.nvim`
  `<leader>co` でアウトラインを表示します。
- `vim-tmux-navigator`
  `Ctrl-h/j/k/l` と `Ctrl-\` で tmux / Neovim 間を移動します。
- `vim-fugitive`
  Git 操作を Neovim 内から行います。
- `yazi.nvim`
  Yazi を Neovim から起動します。
- `vim-oscyank`
  OSC52 経由のコピーを `<leader>oy` に割り当てています。
- `vim-godot` / `gdscript-extended-lsp.nvim`
  Godot プロジェクト向けの補助設定です。

## カスタムキーマップ

LazyVim のデフォルトキーマップはここに複製していません。標準キーマップは `which-key` か `:map` で確認してください。ここではこのリポジトリ独自の追加分だけを載せます。

### 基本編集

- `jj`
  インサートモードからノーマルモードへ戻る
- `x`
  レジスタを汚さずに 1 文字削除
- `dw`
  単語を後ろ向きに削除
- `<C-a>`
  バッファ全体を選択
- `+`
  `dial.nvim` によるインクリメント
- `-`
  `dial.nvim` によるデクリメント
- `<leader>o`
  下に新しい行を作って継続コメントを消す
- `<leader>O`
  上に新しい行を作って継続コメントを消す
- `<C-m>`
  ジャンプリストの次へ移動

### ウィンドウ操作

- `te`
  新しいタブを開く
- `ss`
  水平分割
- `sv`
  垂直分割
- `sh`, `sj`, `sk`, `sl`
  ウィンドウ移動
- `<C-w><left>`, `<C-w><right>`, `<C-w><up>`, `<C-w><down>`
  ウィンドウサイズ変更

### 診断と文章系バッファ

- `<leader>ct`
  現在バッファの診断を ON / OFF
- `<leader>cta`
  現在バッファが Markdown のときだけ診断を無効化
- `:DisableMarkdownLint`
  開いている Markdown バッファの診断をまとめて無効化

### クリップボード

- `<leader>y`
  システムクリップボードへ yank
- `<leader>p`
  システムクリップボードから paste
- ビジュアルモードで `Esc`
  選択範囲をクリップボードへコピーしてから抜ける
- `<leader>oy`
  OSC52 経由で yank

### 設定と補完

- `<leader>ux`
  `blink.cmp` の補完をトグル
- `<leader>cR`
  現在の設定ファイルに応じて部分リロード
- `:ConfigReload [plugin]`
  プラグイン名を指定してリロード

### Git

- `<leader>gs`
  `:Git`
- `<leader>ga`
  `:Git add `
- `<leader>gA`
  `:Git add .`
- `<leader>gF`
  `:Git fetch -p`
- `<leader>gp`
  `:Git push --quiet`
- `<leader>gc`
  `:Git commit -qam "`

### ナビゲーション / UI

- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`
  tmux / Neovim 間をシームレス移動
- `<C-\\>`
  直前の pane へ戻る
- `<leader>~`
  現在ファイル位置で Yazi を開く
- `<leader>cw`
  作業ディレクトリで Yazi を開く
- `<C-Up>`
  直前の Yazi セッションを再開
- `<leader>co`
  Outline を開く
- `<leader>z`
  Zen Mode

### Godot プロジェクト内のみ

- `<leader>gb`
  `breakpoint` 行を追加して保存
- `<leader>gB`
  すべての `breakpoint` 行を削除
- `<leader>gf`
  `breakpoint` を grep して quickfix を開く

## カスタマイズの入口

- `lua/config/options.lua`
  基本オプション
- `lua/config/keymaps.lua`
  カスタムキーマップ
- `lua/config/autocmds.lua`
  自動コマンド
- `lua/plugins/`
  プラグイン単位の追加設定

## 検証

リポジトリ全体の構文チェックはトップレベルから実行します。

```bash
bash scripts/validate-configs.sh
```

Neovim 内の状態確認には次が便利です。

- `:Lazy`
- `:Mason`
- `:LspInfo`
- `:checkhealth`
