# Dotfiles - Unified Cockpit Edition

このリポジトリには、macOS/Linux 環境での開発効率を最大化するための個人用 dotfiles 設定が含まれています。

## 📁 プロジェクト構成

```shell
dotfiles/
├── nvim/                    # Neovim設定
│   ├── init.lua            # メイン設定ファイル
│   ├── lazy-lock.json      # プラグインロックファイル
│   ├── lazyvim.json        # LazyVim設定
│   └── lua/
│       ├── config/         # 基本設定
│       │   ├── autocmds.lua
│       │   ├── keymaps.lua
│       │   ├── lazy.lua
│       │   └── options.lua
│       └── plugins/        # プラグイン設定
│           ├── coding.lua
│           ├── colorschema.lua
│           ├── editor.lua
│           ├── example.lua
│           └── ui.lua
├── tmux/                    # tmux設定（Catppuccin Frappe Seamless）
├── alacritty/               # Alacritty設定（Transparent & Maximized）
├── sheldon/                 # Sheldon設定（Zshプラグインマネージャー）
│   ├── cplugins.toml       # プラグイン設定（vi-mode有効）
│   └── plugins.toml        # プラグイン設定（vi-mode無効）
├── starship.toml           # Starshipプロンプト設定
├── wezterm/               # WezTerm設定
│   └── wezterm.lua
├── gruvbox_256palette.sh   # Gruvboxカラーパレット
└── README.md
```

## 🛠️ 究極のシームレス統合 (The Unified Cockpit)

この dotfiles は、単なる設定の集合ではなく、ツール間の境界を破壊して集中力を維持するための「システム」として設計されています。

### 1. 視覚的調和 (Catppuccin Frappe Theme)

* **デザイントークンの統一**: 全ツールに `Catppuccin Frappe` を適用し、パステル調の目に優しい配色で統一しています。
* **ステータスバーの融合**: tmux と Neovim (Lualine) の背景色を `#414559` (Surface0) で同期させ、画面下部を一体化した計器盤のように機能させます。
* **透過フルスクリーンの実現**: macOS の制限を `SimpleFullscreen` 設定で回避し、壁紙の透明度 (0.9) を維持したままフルスクリーン作業が可能です。

### 2. 境界なき操作 (Smart Navigation & Popups)

* **Seamless Move**: `Ctrl + h/j/k/l` を使用し、Neovim の分割画面と tmux ペインの間を区別なく自由に行き来できます。
* **Popup Workflow**: `lazygit`、`btop`、`Python REPL` を `Prefix` ひとつで画面中央にポップアップ表示。文脈を維持したまま補助ツールを爆速で利用可能です。
* **sesh × fzf**: `zoxide` の履歴や既存セッションを曖昧検索し、プロジェクトを瞬時にワープします。

## 🛠️ 含まれるツールと設定

### Neovim

- **ベース**: LazyVim（Lazy.nvim ベースの Neovim ディストリビューション）
- **カラースキーム**:
  - Gruvbox Material（デフォルト）
  - Tokyo Night
  - Catppuccin
- **主要プラグイン**:
  - **コーディング支援**:
    - `neogen`: アノテーション生成
    - `refactoring.nvim`: リファクタリングツール
    - `dial.nvim`: 数値インクリメント/デクリメント
    - `outline.nvim`: コードアウトライン表示
  - **Git 統合**:
    - `vim-fugitive`: Git 操作
  - **UI/UX**:
    - `yazi.nvim`: ファイルマネージャー
    - `bufferline.nvim`: バッファライン
    - `zen-mode.nvim`: 集中モード
  - **Godot 開発**:
    - `vim-godot`: Godot エディタ統合
    - `gdscript-extended-lsp.nvim`: GDScript LSP サポート
    - `snacks.nvim`: ファイルエクスプローラー
    - `asyncrun.vim`: 非同期実行
- **言語サポート**: Go, JSON, Markdown, Python, SQL, Tailwind, TypeScript, YAML, GDScript
- **特殊機能**:
  - Godot プロジェクト自動検出
  - Godot サーバー自動起動（`server.pipe`）

### Sheldon（Zsh プラグインマネージャー）

- **シェル**: Zsh
- **プラグイン**:
  - `oh-my-zsh`: Zsh フレームワーク
  - `zsh-completions`: 補完機能
  - `zsh-autosuggestions`: 自動提案
  - `zsh-syntax-highlighting`: シンタックスハイライト
  - `dracula-zsh-syntax-highlighting`: Dracula テーマ
  - `blackbox`: 暗号化ツール
  - `enhancd`: ディレクトリナビゲーション
  - `zsh-vi-mode`: Vi モード（cplugins.toml のみ）

### .zshrc で使うツール

`.zshrc` では以下の外部コマンドを利用しています。未導入の場合は Homebrew でまとめてインストールできます。

| ツール | 用途 |
|--------|------|
| **starship** | プロンプト表示 |
| **fzf** | 曖昧検索・フィルタ UI |
| **zoxide** | 使用頻度に基づく賢い `cd` |
| **direnv** | ディレクトリごとの環境変数 (.envrc) |
| **fd** | `find` の代替（高速・使いやすい） |
| **eza** | `ls` の代替（アイコン・Git 状態表示） |
| **bat** | `cat` の代替（シンタックスハイライト） |
| **ripgrep** | `grep` の代替（高速検索、`fzf` のファイル一覧にも使用） |
| **atuin** | シェル履歴の検索・同期（`Ctrl+R` でヒストリ検索） |

**インストール（macOS / Linux で Homebrew 利用時）:**

```bash
brew install starship fzf zoxide direnv fd eza bat ripgrep atuin
```

**atuin の初回セットアップ（既存シェル履歴の取り込み）:**

```bash
atuin import auto
```

※ 各ツールは `command -v` で存在チェックされているため、未導入のものがあっても `.zshrc` は動作します（該当機能が無効になるだけです）。

### Starship（プロンプト）

- **テーマ**: Gruvbox Dark
- **表示項目**:
  - OS 情報
  - ユーザー名
  - ディレクトリパス
  - Git ブランチ・ステータス
  - Docker コンテキスト
  - Conda 環境
  - 時間
- **言語サポート**: Node.js, C, Rust, Go, PHP, Java, Kotlin, Haskell, Python

### WezTerm（ターミナル）

- **カラースキーム**: GruvboxDark
- **フォント**: HackGen Console NF（16pt）
- **透明度**: 100%（不透明）
- **キーバインド**:
  - `Super+Enter`: 垂直分割
  - `Super+Shift+Enter`: 水平分割
  - `Super+h/j/k/l`: ペイン間移動
  - `Super+u/d`: スクロール（ページ単位）
- **その他機能**:
  - 日本語 IME 対応
  - リンククリック（Ctrl+クリック）
  - 単一タブ時はタブバー非表示
  - tmux/kitty グラフィックス互換性
  - ウィンドウパディング（5px）

### tmux（Seamless Edition）

- **カラースキーム**: Catppuccin Frappe
- **統合機能**:
  - Neovim とのシームレスな移動（`Ctrl + h/j/k/l`）
  - ステータスバー背景色を Neovim Lualine と同期（`#414559`）
  - セッション管理（sesh 統合）
- **ポップアップ機能**:
  - `Prefix + g`: lazygit（Git UI）をポップアップ
  - `Prefix + t`: btop（システムモニター）をポップアップ
  - `Prefix + p`: Python REPL をポップアップ
  - `Prefix + f`: sesh によるプロジェクト検索
  - `Prefix + r`: 設定のリロード（反映時に **PREFIX** ラベルが点灯）

### Alacritty（ターミナル）

- **カラースキーム**: Catppuccin Frappe
- **透過設定**: 透明度 0.9
- **フルスクリーン**: SimpleFullscreen モードで透過を維持したままフルスクリーン作業が可能
- **フォント**: HackGen Console NF（16pt）

### Gruvbox カラーパレット

- 256 色対応の Gruvbox カラーパレットスクリプト
- tmux、screen、fbterm 対応
- ターミナル環境に応じた自動切り替え

## 🚀 セットアップ手順

### 前提条件

- macOS/Linux
- Zsh
- Neovim
- tmux
- Alacritty
- Sheldon
- Starship
- WezTerm（オプション）

### インストール

1. **リポジトリのクローン**

   ```bash
   git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **シンボリックリンクの作成**

   ```bash
   # Neovim設定
   ln -sf ~/.dotfiles/nvim ~/.config/nvim

   # tmux設定
   ln -sf ~/.dotfiles/tmux ~/.config/tmux

   # Alacritty設定
   ln -sf ~/.dotfiles/alacritty ~/.config/alacritty

   # Sheldon設定
   ln -sf ~/.dotfiles/sheldon ~/.config/sheldon

   # Starship設定
   ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml

   # WezTerm設定（オプション）
   ln -sf ~/.dotfiles/wezterm ~/.config/wezterm
   ```

3. **Gruvbox カラーパレットの適用**

   ```bash
   # .zshrcに追加
   echo 'source ~/.dotfiles/gruvbox_256palette.sh' >> ~/.zshrc
   ```

4. **Sheldon の初期化**

   ```bash
   # .zshrcに追加
   echo 'eval "$(sheldon source)"' >> ~/.zshrc
   ```

5. **Starship の初期化**

   ```bash
   # .zshrcに追加
   echo 'eval "$(starship init zsh)"' >> ~/.zshrc
   ```

6. **Neovim プラグインのインストール**

   ```bash
   nvim
   # Lazy.nvimが自動的にプラグインをインストール
   ```

## 🎨 カスタマイズ

### Neovim

- `nvim/lua/plugins/` ディレクトリ内のファイルを編集してプラグインを追加・設定
- `nvim/lua/config/` ディレクトリ内で基本設定を変更

### Sheldon

- `sheldon/plugins.toml` または `sheldon/cplugins.toml` を編集
- vi-mode を使用する場合は `cplugins.toml` を使用

### Starship

- `starship.toml` を編集してプロンプトの外観を変更

### tmux

- `tmux/` ディレクトリ内の設定ファイルを編集して tmux の動作を変更

### Alacritty

- `alacritty/alacritty.toml` を編集してターミナルの設定を変更

### WezTerm

- `wezterm/wezterm.lua` を編集してターミナルの設定を変更

## 🔧 主要なキーバインド

### 🛰️ 統合・ナビゲーション

* `Ctrl + h/j/k/l`: Neovim / tmux 間のシームレスな移動
* `Option + Down`: フローティング・ターミナルの表示
* `Prefix + f`: **sesh** によるプロジェクト検索

### 🐚 tmux (Seamless Edition)

* `Prefix + g`: **lazygit** (Git UI) をポップアップ
* `Prefix + t`: **btop** (システムモニター) をポップアップ
* `Prefix + p`: **Python REPL** をポップアップ
* `Prefix + r`: 設定のリロード（反映時に **PREFIX** ラベルが点灯）

### 📝 Neovim

- **Git 操作**:
  - `<leader>gs`: Git status
  - `<leader>ga`: Git add
  - `<leader>gA`: Git add .
  - `<leader>gF`: Git fetch -p
  - `<leader>gp`: Git push
  - `<leader>gc`: Git commit
- **Lualine 統合**:
  - 左側に現在の tmux セッション名を常時表示
- **コーディング**:
  - `<leader>cn`: アノテーション生成（Neogen）
  - `<leader>r`: リファクタリング（ビジュアルモード）
  - `<leader>co`: アウトライン表示
  - `<C-a>`: インクリメント
  - `<C-x>`: デクリメント
- **ファイル操作**:
  - `<leader>~`: Yazi ファイルマネージャー（現在のファイル）
  - `<leader>cw`: Yazi ファイルマネージャー（作業ディレクトリ）
  - `<C-Up>`: Yazi セッション再開
- **ウィンドウ操作**:
  - `ss`: 水平分割
  - `sv`: 垂直分割
  - `sh/sj/sk/sl`: ウィンドウ間移動
  - `<Tab>`: 次のバッファ
  - `<S-Tab>`: 前のバッファ
- **その他**:
  - `<leader>z`: Zen Mode
  - `jj`: インサートモードで Esc
  - `<C-j>`: 次の診断エラー
- **Godot 専用**（Godot プロジェクト内で有効）:
  - `<leader>gb`: ブレークポイント追加
  - `<leader>gB`: すべてのブレークポイント削除
  - `<leader>gf`: すべてのブレークポイント検索

### WezTerm

- `Super+Enter`: 垂直分割
- `Super+Shift+Enter`: 水平分割
- `Super+h/j/k/l`: ペイン間移動
- `Super+u/d`: スクロール（ページ単位）

### Zsh

- **基本設定**:
  - viモードが有効（`bindkey -v`）
- **履歴検索**:
  - `Ctrl+P`: 前方に履歴検索（行頭から一致）
  - `Ctrl+N`: 後方に履歴検索（行頭から一致）
  - `Alt+P`: 前方に履歴検索（行頭から一致）
  - `Alt+N`: 後方に履歴検索（行頭から一致）
  - `Ctrl+R`: インクリメンタル履歴検索（後方）
  - `Ctrl+S`: インクリメンタル履歴検索（前方）
- **カーソル移動**:
  - `Home`: 行頭へ移動
  - `End`: 行末へ移動
  - `Del`: カーソル位置の文字を削除
- **補完**:
  - `Tab`: 補完メニューを表示
  - `Shift+Tab`: 補完メニューを逆順に移動
- **viモード（surroundプラグイン）**:
  - `cs`: 囲み文字を変更（viコマンドモード）
  - `ds`: 囲み文字を削除（viコマンドモード）
  - `ys`: 囲み文字を追加（viコマンドモード）
  - `S`: ビジュアルモードで囲み文字を追加
- **括弧選択**（ビジュアルモード）:
  - `va(` / `vi(`: 括弧の外側/内側を選択
  - `va[` / `vi[`: 角括弧の外側/内側を選択
  - `va{` / `vi{`: 波括弧の外側/内側を選択
  - 同様に `<>bB` にも対応

**補足**:
- viモードが有効なため、`Esc`でコマンドモード、`i`で挿入モードに切り替え
- コマンドモードではviの標準キーバインド（`h`/`j`/`k`/`l`、`w`/`b`、`0`/`$`など）が使用可能
- `Tab`で補完メニューを表示（`menu select`が有効で、矢印キーで選択可能）
- `zsh-vi-mode`プラグインが有効な場合（`cplugins.toml`使用時）、追加のviモード機能が利用可能
