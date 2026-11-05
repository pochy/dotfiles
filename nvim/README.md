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

## プラグイン一覧

インストール済みのプラグインは `lazy-lock.json`、各プラグインの設定は `lua/plugins/` にあります。

### 自分で追加したプラグイン

| プラグイン | リポジトリ | 定義ファイル | 用途 |
|---|---|---|---|
| neogen | danymat/neogen | coding.lua | 注釈を自動生成（`<leader>cn`） |
| refactoring.nvim | ThePrimeagen/refactoring.nvim | coding.lua | リファクタリングメニュー（ビジュアルモードで `<leader>r`） |
| dial.nvim | monaqa/dial.nvim | coding.lua | `+`/`-` で数値・日付・semver・bool を増減 |
| outline.nvim | hedyhli/outline.nvim | coding.lua | アウトライン表示（`<leader>co`） |
| gruvbox-material | sainnhe/gruvbox-material | colorschema.lua | 代替カラースキーム |
| vim-tmux-navigator | christoomey/vim-tmux-navigator | editor.lua | tmux と Neovim の間を移動 |
| blame.nvim | FabijanZulj/blame.nvim | editor.lua | Git blame の表示 |
| vim-fugitive | tpope/vim-fugitive | editor.lua | Git 操作 |
| vim-godot | habamax/vim-godot | editor.lua | Godot 対応 |
| gdscript-extended-lsp.nvim | teatek/gdscript-extended-lsp.nvim | editor.lua | GDScript 用の LSP 拡張 |
| vim-oscyank | ojroques/vim-oscyank | editor.lua | OSC52 経由で yank（`<leader>oy`） |
| neogit | NeogitOrg/neogit | neogit.lua | Magit 風の Git UI |
| diffview.nvim | sindrets/diffview.nvim | neogit.lua | 差分ビュー（neogit が依存） |
| asyncrun.vim | skywind3000/asyncrun.vim | runner.lua | コマンドを非同期で実行 |
| sidekick.nvim | folke/sidekick.nvim | sidekick.lua | AI 連携（一部の機能は `enabled = false`） |
| yazi.nvim | mikavilpas/yazi.nvim | ui.lua | Yazi ファイラーを起動 |
| zen-mode.nvim | folke/zen-mode.nvim | ui.lua | Zen Mode（`<leader>z`） |

### LazyVim 標準のプラグインで、設定を上書きしているもの

| プラグイン | 定義ファイル | 内容 |
|---|---|---|
| LazyVim | colorschema.lua | カラースキームを `catppuccin` に指定 |
| catppuccin | colorschema.lua | デフォルトのカラースキーム |
| tokyonight.nvim | colorschema.lua | 代替カラースキーム |
| blink.cmp | blink-cmp.lua | 補完。既定は OFF で、`<leader>ux` で切り替え |
| nvim-lspconfig | lsp.lua | LSP。既定は OFF で、`<leader>ul` で切り替え |
| nvim-treesitter | lsp.lua | パーサーなどの設定 |
| snacks.nvim | editor.lua | ユーティリティ類の設定 |
| lualine.nvim | lualine.lua | ステータスラインに tmux セッション名を表示 |
| noice.nvim | noice.lua | メッセージやコマンドラインの UI |
| bufferline.nvim | ui.lua | タブ・バッファ表示 |
| plenary.nvim | neogit.lua | Lua ユーティリティ（依存ライブラリ） |

### LazyVim 本体と Extras から入るもの（独自の設定なし）

| 分類 | プラグイン |
|---|---|
| 基盤 | lazy.nvim, nui.nvim, mini.icons, which-key.nvim, persistence.nvim |
| 編集 | flash.nvim, mini.ai, mini.pairs, mini.surround, ts-comments.nvim, nvim-ts-autotag, nvim-treesitter-textobjects, friendly-snippets, grug-far.nvim, todo-comments.nvim |
| ファイル | mini.files |
| Git | gitsigns.nvim |
| LSP・整形・Lint | mason.nvim, mason-lspconfig.nvim, conform.nvim, nvim-lint, lazydev.nvim, trouble.nvim |
| 言語の Extras | SchemaStore.nvim（json/yaml）, rustaceanvim, crates.nvim（rust）, venv-selector.nvim（python）, markdown-preview.nvim, render-markdown.nvim（markdown）, vim-dadbod, vim-dadbod-ui, vim-dadbod-completion（sql） |

有効にしている Extras（`lazyvim.json`）は `coding.mini-surround`、`editor.mini-files` と、`lang` の go / json / markdown / python / rust / sql / tailwind / typescript / vue / yaml です。

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
  現在バッファの `blink.cmp` 補完を ON / OFF（デフォルト OFF）
- `<leader>ul`
  現在バッファの LSP を ON / OFF（デフォルト OFF）
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
