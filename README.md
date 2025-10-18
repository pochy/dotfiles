# Dotfiles

このリポジトリには、macOS 環境での開発効率を最大化するための個人用 dotfiles 設定が含まれています。

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
├── sheldon/                 # Sheldon設定（Zshプラグインマネージャー）
│   ├── cplugins.toml       # プラグイン設定（vi-mode有効）
│   └── plugins.toml        # プラグイン設定（vi-mode無効）
├── starship.toml           # Starshipプロンプト設定
├── wezterm/               # WezTerm設定
│   └── wezterm.lua
├── gruvbox_256palette.sh   # Gruvboxカラーパレット
└── README.md
```

## 🛠️ 含まれるツールと設定

### Neovim

- **ベース**: LazyVim（Lazy.nvim ベースの Neovim ディストリビューション）
- **カラースキーム**:
  - Tokyo Night（メイン）
  - Catppuccin
  - Gruvbox Material
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
- **言語サポート**: Go, JSON, Markdown, Python, SQL, Tailwind, TypeScript, YAML

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
- **透明度**: 90%（macOS 背景ブラー 30）
- **キーバインド**:
  - `Super+Enter`: 垂直分割
  - `Super+Shift+Enter`: 水平分割
  - `Super+h/j/k/l`: ペイン間移動
  - `Super+u/d`: スクロール
- **その他機能**:
  - 日本語 IME 対応
  - リンククリック（Ctrl+クリック）
  - 単一タブ時はタブバー非表示

### Gruvbox カラーパレット

- 256 色対応の Gruvbox カラーパレットスクリプト
- tmux、screen、fbterm 対応
- ターミナル環境に応じた自動切り替え

## 🚀 セットアップ手順

### 前提条件

- macOS
- Zsh
- Neovim
- Sheldon
- Starship
- WezTerm

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

   # Sheldon設定
   ln -sf ~/.dotfiles/sheldon ~/.config/sheldon

   # Starship設定
   ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml

   # WezTerm設定
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

### WezTerm

- `wezterm/wezterm.lua` を編集してターミナルの設定を変更

## 🔧 主要なキーバインド

### Neovim

- `<leader>gs`: Git status
- `<leader>ga`: Git add
- `<leader>gA`: Git add .
- `<leader>gp`: Git push
- `<leader>gc`: Git commit
- `<leader>cn`: アノテーション生成
- `<leader>r`: リファクタリング
- `<leader>co`: アウトライン表示
- `<leader>~`: Yazi ファイルマネージャー
- `<leader>z`: Zen Mode

### WezTerm

- `Super+Enter`: 垂直分割
- `Super+Shift+Enter`: 水平分割
- `Super+h/j/k/l`: ペイン間移動
- `Super+u/d`: スクロール
