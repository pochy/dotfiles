# 💤 LazyVim Neovim 設定

このリポジトリは、[LazyVim](https://github.com/LazyVim/LazyVim)をベースとしたモダンな Neovim 設定です。最小限の設定で、効率的な開発環境を提供します。

## 📋 目次

- [🚀 クイックスタート](#-クイックスタート)
- [📦 使用プラグイン一覧](#-使用プラグイン一覧)
- [⌨️ キーマップ一覧](#️-キーマップ一覧)
- [⚙️ 設定のカスタマイズ](#️-設定のカスタマイズ)
- [🔧 トラブルシューティング](#-トラブルシューティング)
- [📚 参考資料](#-参考資料)

## 🚀 クイックスタート

### 前提条件

- **Neovim 0.11.2 以上**が必要です（LuaJIT でビルドされたもの）
- **Git 2.19.0 以上**が必要です（部分クローンサポートのため）
- **Nerd Font v3.0 以上**（推奨）をインストールすると、アイコンが正しく表示されます
- **lazygit**（推奨）Git 操作のための TUI ツール
- **tree-sitter-cli**と**C コンパイラ**（nvim-treesitter 用）
- **curl**（blink.cmp 補完エンジン用）
- **fzf v0.25.1 以上**（fzf-lua 用、オプション）
- **ripgrep**（live grep 用、オプション）
- **fd**（find files 用、オプション）
- **True color**と**undercurl**をサポートするターミナル：
  - kitty（Linux & macOS）
  - wezterm（Linux, macOS & Windows）
  - alacritty（Linux, macOS & Windows）
  - iterm2（macOS）
  - ghostty（Linux, macOS & Windows）

### インストール方法

1. **既存の Neovim 設定をバックアップ**

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **この設定をクローン**

   ```bash
   git clone <このリポジトリのURL> ~/.config/nvim
   ```

3. **Neovim を起動**

   ```bash
   nvim
   ```

4. **プラグインの自動インストール**
   - 初回起動時に Lazy.nvim が自動的にプラグインをインストールします
   - インストール完了まで数分かかる場合があります

### 初回セットアップ

1. **LSP サーバーのインストール**

   - `:Mason`コマンドで Mason ウィンドウを開く
   - 必要な言語サーバーをインストール（例：pyright、vtsls、lua_ls）
   - `:checkhealth nvim-treesitter`で Treesitter の状態を確認

2. **カラースキームの選択**

   - `:colorscheme tokyonight` - Tokyo Night（デフォルト）
   - `:colorscheme catppuccin` - Catppuccin
   - `:colorscheme gruvbox-material` - Gruvbox Material

3. **基本操作の確認**
   - `<Space>`キーを押して which-key で利用可能なコマンドを確認
   - `<Space>ff`でファイル検索を試す（fzf-lua）
   - `<Space>ss`で文字列検索を試す（fzf-lua）
   - `<Space>gg`で LazyGit を開く

## 📦 使用プラグイン一覧

この Neovim 設定で使用されている主要なプラグインとその機能を以下にまとめます。

### 🎨 カラースキーム・テーマ

- **tokyonight.nvim** - 東京の夜景をイメージした美しいダークテーマ。暗い背景と鮮やかな色彩が特徴で、長時間のコーディングでも目に優しい配色を提供します。moon、night、storm、day の 4 つのバリエーションがあります。

- **catppuccin** - パステルカラーを基調としたモダンなカラースキーム。latte、frappe、macchiato、mocha の 4 つのフレーバーがあり、各プラグインとの統合も充実しています。視認性と美観を兼ね備えた配色が人気です。

- **gruvbox-material** - マテリアルデザイン風の Gruvbox テーマ。元の gruvbox をベースに、マテリアルデザインの要素を取り入れた配色で、ソフトな背景と透明効果をサポートしています。

### 🔍 検索・ナビゲーション

- **fzf-lua** - 高速なファジーファインダー。Telescope の代替として採用され、ファイル検索、grep 検索、バッファ検索など、あらゆる検索機能を提供します。fzf、ripgrep、fd などの外部ツールと連携して高速な検索を実現します。

- **flash.nvim** - 高速なジャンプ機能を提供するプラグイン。指定した文字や単語に瞬時にジャンプでき、効率的なナビゲーションを実現します。nvim-treesitter の incremental selection の代替として採用されています。

- **yazi.nvim** - モダンなファイルマネージャー。Rust で書かれた高性能なファイルマネージャー「yazi」を Neovim 内で使用できるようにします。ファイルのプレビュー、検索、操作などが高速で実行できます。

- **outline.nvim** - コードのアウトライン表示機能。現在のファイルの関数、クラス、変数などの構造をサイドバーに表示し、コードの全体像を把握しやすくします。LSP や Treesitter と連携して動作します。

### 📝 エディタ機能

- **nvim-treesitter** - 高度なシンタックスハイライトとコード解析を提供するプラグイン。従来の正規表現ベースのハイライトを超えて、実際のコードの構文解析を行い、より正確で美しいハイライトを実現します。コード折りたたみ、テキストオブジェクト、リファクタリング支援なども提供します。

- **nvim-treesitter-textobjects** - Treesitter ベースのテキストオブジェクトを提供。関数、クラス、条件文などのコード構造を理解したテキストオブジェクトで、効率的なコード操作が可能になります。`af`（around function）、`if`（inside function）などの操作が利用できます。

- **nvim-ts-autotag** - HTML/JSX タグの自動補完機能。開始タグを入力すると自動的に終了タグが挿入され、タグの整合性を保ちます。React、Vue、Angular などのフロントエンド開発で特に有用です。

- **mini.pairs** - 括弧やクォートの自動ペアリング機能。`(`, `[`, `{`, `"`, `'`などの文字を入力すると自動的に閉じ括弧が挿入され、入力効率を向上させます。バックスペースでペアごと削除する機能も提供します。

- **mini.surround** - テキストの囲み文字操作を簡単に行えるプラグイン。選択したテキストを括弧やクォートで囲む、囲み文字を変更する、囲み文字を削除するなどの操作を直感的に行えます。`ys`（you surround）、`cs`（change surround）、`ds`（delete surround）などの操作が可能です。

- **mini.ai** - テキストオブジェクトの拡張機能。より多くのテキストオブジェクトを提供し、コード操作の柔軟性を高めます。括弧、クォート、タグ、関数、クラスなど、様々な構造に対するテキストオブジェクトが利用できます。

- **dial.nvim** - 数値のインクリメント・デクリメント機能。数字、日付、ブール値、セマンティックバージョンなどを自動認識し、`<C-a>`でインクリメント、`<C-x>`でデクリメントできます。複数の数値形式に対応しています。

### 🧠 LSP・補完

- **nvim-lspconfig** - Language Server Protocol の設定を簡素化するプラグイン。多くのプログラミング言語の LSP サーバーとの統合を簡単に行えます。Neovim 0.11.2 以降では、ネイティブの`vim.lsp.config`を使用して LSP を設定します。

- **mason.nvim v2.x** - LSP サーバー、リンター、フォーマッターの管理を行うプラグイン。必要なツールを自動的にインストール・更新し、開発環境の構築を自動化します。200 以上のツールに対応し、設定も自動化されています。

- **mason-lspconfig.nvim v2.x** - Mason と LSPConfig の連携を提供するプラグイン。Mason でインストールした LSP サーバーを自動的に LSPConfig に登録し、設定の手間を大幅に削減します。

- **blink.cmp** - 高速で軽量なコード補完エンジン。nvim-cmp の代替として採用され、LSP、スニペット、バッファ、パスなど、様々なソースからの補完候補を統合し、スムーズな補完体験を提供します。cmdline 補完も有効化されています。

- **friendly-snippets** - 便利なコードスニペット集。多くのプログラミング言語に対応したスニペットを提供し、開発効率を向上させます。関数定義、クラス定義、条件文、ループなど、よく使用されるコードパターンが含まれています。

### 🔧 開発支援

- **neogen** - 関数やクラスの注釈自動生成機能。LSP や Treesitter と連携して、関数、クラス、変数などのドキュメントコメントを自動生成します。JSDoc、Python docstring、Lua docstring など、言語に応じた適切な形式で生成されます。

- **refactoring.nvim** - コードリファクタリング支援プラグイン。変数の抽出、関数の抽出、変数名の変更、インポートの整理など、安全で効率的なリファクタリング操作を提供します。LSP と連携して動作し、多くのプログラミング言語に対応しています。

- **conform.nvim** - コードフォーマッターの統合プラグイン。Prettier、Black、Stylus、ESLint など、様々なフォーマッターを統合し、保存時や手動でコードを自動整形できます。非同期処理により、フォーマット中もエディタがブロックされません。

- **nvim-lint** - コードリンターの統合プラグイン。ESLint、Pylint、RuboCop など、様々なリンターを統合し、リアルタイムでコードの問題を検出・表示します。診断情報を Trouble.nvim や QuickFix リストに表示できます。

- **todo-comments.nvim** - TODO コメントのハイライトと管理機能。TODO、FIXME、HACK、NOTE、WARNING などのコメントを色分けして表示し、プロジェクト内のタスクを視覚的に管理できます。検索機能やフィルタリング機能も提供します。

### 🎯 Git・バージョン管理

- **vim-fugitive** - Git 操作を統合した強力なプラグイン。Neovim 内で Git のすべての操作を実行できます。コミット、プッシュ、プル、ブランチ管理、マージ、リベースなど、Git の全機能にアクセス可能です。`:Git`コマンドで Git の状態を確認し、`:Git commit`でコミットメッセージを編集できます。

- **gitsigns.nvim** - Git 変更の可視化機能。行番号の横に Git の変更情報（追加、削除、変更）を表示し、現在のファイルの変更状況を一目で把握できます。Git blame 情報の表示、変更行へのジャンプ、ステージング操作なども可能です。

### 🗄️ データベース

- **vim-dadbod** - データベースクライアント機能。Neovim 内で MySQL、PostgreSQL、SQLite、MongoDB などのデータベースに接続し、SQL クエリを実行できます。データベースの構造確認、データの閲覧・編集、クエリの実行結果表示などが可能です。

- **vim-dadbod-ui** - Dadbod の UI 拡張機能。データベースの接続管理、テーブル一覧の表示、クエリの実行、結果の表示などを視覚的に行えるインターフェースを提供します。データベースブラウザとしての機能を充実させています。

- **vim-dadbod-completion** - Dadbod の補完機能。データベースのテーブル名、カラム名、SQL キーワードなどの補完を提供し、SQL クエリの作成を効率化します。LSP や cmp と連携して動作します。

### 🖥️ UI・表示

- **lualine.nvim** - 美しいステータスライン。現在のモード、ファイル名、Git 情報、LSP 情報、エラー数などを表示するカスタマイズ可能なステータスラインです。軽量で高速、多くのプラグインとの統合も充実しています。

- **bufferline.nvim** - タブバーの表示機能。開いているバッファをタブ形式で表示し、視覚的にファイルを管理できます。タブの切り替え、閉じる、移動などの操作が可能で、Git 情報や LSP 情報も表示されます。

- **which-key.nvim** - キーバインドの表示機能。キーを押すと利用可能なキーバインドの候補をポップアップで表示し、コマンドの学習と記憶を支援します。階層的なキーマップにも対応しています。

- **noice.nvim** - コマンドライン UI の改善。コマンドライン、メッセージ、ポップアップメニューなどの UI を美しく改善し、より良いユーザー体験を提供します。アニメーション効果やカスタマイズ性も充実しています。

- **trouble.nvim** - 診断情報の表示機能。LSP の診断情報、QuickFix リスト、ロケーションリストなどを美しい UI で表示します。エラーや警告の一覧表示、フィルタリング、ジャンプ機能などを提供します。

- **zen-mode.nvim** - 集中モード機能。不要な UI 要素を非表示にして、コードに集中できる環境を提供します。ステータスライン、タブバー、番号行などを一時的に隠し、ミニマルな編集環境を作り出します。

### 🔄 セッション管理

- **persistence.nvim** - セッションの自動保存・復元機能。プロジェクトごとにセッションを自動保存し、次回起動時に同じ状態を復元できます。ウィンドウの配置、バッファの状態、カーソル位置などを記憶し、作業の継続性を保ちます。

### 📊 その他のユーティリティ

- **mini.icons** - アイコン表示機能。ファイルタイプ、LSP、Git、診断情報などに適切なアイコンを表示し、視覚的な識別を容易にします。Nerd Font との統合もサポートしています。

- **snacks.nvim** - 便利なユーティリティ関数集。Neovim の開発でよく使用される機能をまとめたライブラリで、他のプラグインの開発を支援します。文字列操作、テーブル操作、非同期処理などの機能を提供します。LazyVim 15.x では、多くのコア機能が snacks.nvim に統合されています。

- **venv-selector.nvim** - Python 仮想環境の選択機能。プロジェクト内の仮想環境を検出し、簡単に切り替えることができます。conda、pipenv、poetry、virtualenv など、様々な仮想環境ツールに対応しています。

- **markdown-preview.nvim** - Markdown プレビュー機能。Markdown ファイルをブラウザでリアルタイムプレビューできます。数式、コードハイライト、テーブルなども正しく表示されます。

- **render-markdown.nvim** - Markdown レンダリング機能。Neovim 内で Markdown をレンダリングし、美しい表示を提供します。リアルタイムでのプレビューや、エクスポート機能も利用できます。

- **ts-comments.nvim** - TypeScript コメント機能。TypeScript ファイルでのコメント操作を改善し、JSDoc コメントの生成や管理を支援します。

- **grug-far.nvim** - 検索・置換機能。プロジェクト全体での検索と置換を効率的に行えるプラグインです。正規表現対応、プレビュー機能、バッチ処理などが利用できます。nvim-spectre の代替として採用されています。

- **SchemaStore.nvim** - JSON スキーマの管理機能。JSON ファイルの編集時に適切なスキーマを自動適用し、バリデーションや補完を提供します。多くの JSON スキーマに対応しています。

- **lazydev.nvim** - 開発用プラグイン。LazyVim の開発を支援するツールで、プラグインの設定やデバッグを効率化します。neodev.nvim の高速な代替として採用されています。

- **plenary.nvim** - Lua ユーティリティライブラリ。多くの Neovim プラグインで使用される共通機能を提供するライブラリです。非同期処理、ファイル操作、文字列操作などの機能が含まれています。

- **nui.nvim** - UI コンポーネントライブラリ。Neovim 内で美しい UI コンポーネントを作成するためのライブラリです。ポップアップ、モーダル、メニューなどの UI 要素を簡単に作成できます。

### 🏗️ 基盤

- **LazyVim** - Neovim の設定フレームワーク。最小限の設定でモダンな Neovim 環境を構築できるオールインワンの設定フレームワークです。プラグインの自動設定、キーマップの最適化、LSP の統合など、開発に必要な機能を一括で提供します。

- **lazy.nvim** - プラグインマネージャー。高速で軽量なプラグインマネージャーで、遅延読み込み、依存関係の管理、プラグインの更新などを効率的に行います。設定がシンプルで、多くのプラグインとの互換性も高いです。

## ⌨️ キーマップ一覧

この Neovim 設定で使用されているキーマップをカテゴリ別にまとめます。

### 🎯 基本操作・カスタムキーマップ

#### モード切り替え

- `jj` (挿入モード) - ノーマルモードに戻る（Esc の代替）

#### 編集操作

- `x` (ノーマルモード) - 文字を削除（レジスタに保存しない）
- `dw` (ノーマルモード) - 単語を後ろ向きに削除
- `<C-a>` (ノーマルモード) - 全選択
- `<Leader>o` (ノーマルモード) - 下に新しい行を作成（継続行を無効化）
- `<Leader>O` (ノーマルモード) - 上に新しい行を作成（継続行を無効化）

#### 数値操作

- `+` (ノーマルモード) - 数値をインクリメント（`<C-a>`の代替）
- `-` (ノーマルモード) - 数値をデクリメント（`<C-x>`の代替）
- `<C-a>` (ノーマルモード) - dial.nvim による数値インクリメント
- `<C-x>` (ノーマルモード) - dial.nvim による数値デクリメント

#### ジャンプ・ナビゲーション

- `<C-m>` (ノーマルモード) - ジャンプリストの次へ移動（`<C-i>`の代替）
- `<C-j>` (ノーマルモード) - 次の診断エラーへ移動

### 🗂️ ウィンドウ・タブ操作

#### タブ操作

- `te` (ノーマルモード) - 新しいタブを開く
- `<Tab>` (ノーマルモード) - 次のタブへ移動（BufferLine）
- `<S-Tab>` (ノーマルモード) - 前のタブへ移動（BufferLine）

#### ウィンドウ分割・移動

- `ss` (ノーマルモード) - ウィンドウを水平分割
- `sv` (ノーマルモード) - ウィンドウを垂直分割
- `sh` (ノーマルモード) - 左のウィンドウへ移動
- `sk` (ノーマルモード) - 上のウィンドウへ移動
- `sj` (ノーマルモード) - 下のウィンドウへ移動
- `sl` (ノーマルモード) - 右のウィンドウへ移動

#### ウィンドウリサイズ

- `<C-w><left>` (ノーマルモード) - ウィンドウ幅を縮小
- `<C-w><right>` (ノーマルモード) - ウィンドウ幅を拡大
- `<C-w><up>` (ノーマルモード) - ウィンドウ高さを拡大
- `<C-w><down>` (ノーマルモード) - ウィンドウ高さを縮小

### 🔧 プラグイン固有キーマップ

#### Git 操作（vim-fugitive）

- `<Leader>gs` (ノーマルモード) - Git status 表示
- `<Leader>ga` (ノーマルモード) - Git add（ファイル指定）
- `<Leader>gA` (ノーマルモード) - Git add .（全ファイル）
- `<Leader>gF` (ノーマルモード) - Git fetch -p
- `<Leader>gp` (ノーマルモード) - Git push
- `<Leader>gc` (ノーマルモード) - Git commit -am

#### ファイルマネージャー（yazi.nvim）

- `<Leader>~` (ノーマル・ビジュアルモード) - 現在のファイルで yazi を開く
- `<Leader>cw` (ノーマルモード) - 作業ディレクトリで yazi を開く
- `<C-up>` (ノーマルモード) - 最後の yazi セッションを再開

#### 開発支援

- `<Leader>cn` (ノーマルモード) - 注釈を自動生成（neogen）
- `<Leader>r` (ビジュアルモード) - リファクタリングメニューを表示（refactoring.nvim）
- `<Leader>co` (ノーマルモード) - アウトラインを表示（outline.nvim）

#### UI・表示

- `<Leader>z` (ノーマルモード) - 集中モードの切り替え（zen-mode.nvim）

### 📋 LazyVim デフォルトキーマップ

LazyVim が提供する主要なデフォルトキーマップ（リーダーキーはスペース）：

#### ファイル操作

- `<Leader>ff` - ファイル検索（fzf-lua）
- `<Leader>fr` - 最近使用したファイル（fzf-lua）
- `<Leader>fs` - ファイル保存

#### バッファ操作

- `<Leader>bd` - バッファを削除
- `<Leader>bn` - 次のバッファへ移動
- `<Leader>bp` - 前のバッファへ移動

#### 検索・置換

- `<Leader>ss` - 文字列検索（fzf-lua）
- `<Leader>sr` - 文字列置換（grug-far.nvim）

#### LSP・補完

- `<Leader>ux` - コード補完のオン/オフ切り替え（blink.cmp）
- `<Leader>ca` - コードアクション
- `<Leader>cr` - シンボルのリネーム
- `<Leader>cf` - コードフォーマット
- `<Leader>cd` - 診断情報表示

#### Git 操作

- `<Leader>gg` - Git status（LazyGit）
- `<Leader>gf` - Git files（fzf-lua）

#### 診断・エラー

- `<Leader>xx` - Trouble.nvim で診断情報表示
- `<Leader>xq` - QuickFix リスト表示

#### UI・表示

- `<Leader>uz` - Zen mode 切り替え（snacks.zen）
- `<Leader>uZ` / `<Leader>wm` - Zoom mode 切り替え
- `<Leader>uD` - Dimming 切り替え（snacks.dim）
- `<Leader>ua` - アニメーション切り替え
- `<Leader>uS` - Scroll 切り替え（snacks.scroll）
- `<Leader>ug` - インデントガイド切り替え（snacks.indent）

#### 設定・LiveReload

- `<Leader>cR` - 設定の再読み込み（Neovim 再起動なし）。開いているファイルに応じてプラグインまたは config をリロード
- `:ConfigReload [プラグイン名]` - 指定したプラグインをリロード（例: `ConfigReload blink.cmp` または `ConfigReload saghen/blink.cmp`）。引数なしで実行すると、開いているファイル（`lua/plugins/*.lua` または `lua/config/*.lua`）から対象を自動判定

#### その他

- `<Leader>qq` - Neovim 終了
- `<Leader>ut` - ツリービューの表示切り替え
- `<Leader>uw` - 行番号の表示切り替え

## 🆕 LazyVim 15.x の新機能・変更点

### 主要な変更

- **Neovim 0.11.2 以上必須**: 古いバージョンのサポートを終了
- **ネイティブ LSP 設定**: `vim.lsp.config`を使用した LSP 設定
- **Mason v2.x**: mason.nvim と mason-lspconfig.nvim を v2.x に移行
- **nvim-treesitter main**: tree-sitter CLI が必要（`:checkhealth nvim-treesitter`で確認）
- **flash.nvim**: nvim-treesitter の incremental selection の代替
- **blink.cmp cmdline**: コマンドライン補完が有効化
- **LSP folding**: 利用可能な場合は LSP ベースの折りたたみを使用

### プラグインの変更

#### 追加されたプラグイン

- **fzf-lua**: telescope.nvim の代替（より高速）
- **blink.cmp**: nvim-cmp の代替（より軽量）
- **snacks.nvim**: 多くのコア機能を統合

#### 削除されたプラグイン

- telescope.nvim（fzf-lua に置換）
- nvim-cmp（blink.cmp に置換）
- dressing.nvim（fzf-lua と snacks.input に置換）
- indent-blankline.nvim（snacks.indent に置換）

### 新しいキーマップ

- `<Leader>uz` - Zen mode 切り替え
- `<Leader>uZ` / `<Leader>wm` - Zoom mode 切り替え
- `<Leader>uD` - Dimming 切り替え
- `<Leader>ua` - アニメーション切り替え
- `<Leader>uS` - Scroll 切り替え
- `<Leader>ug` - インデントガイド切り替え
- `<Leader>dp` - snacks.profiler キーマップ

### アニメーション無効化

すべてのアニメーションを無効化する場合：

```lua
-- options.luaに追加
vim.g.snacks_animate = false
```

## ⚙️ 設定のカスタマイズ

### カラースキームの変更

デフォルトのカラースキームを変更するには、`lua/plugins/colorschema.lua`を編集します：

```lua
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "catppuccin", -- または "gruvbox-material"
  },
}
```

### プラグインの追加

新しいプラグインを追加するには、`lua/plugins/`ディレクトリに新しいファイルを作成します：

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    -- プラグインの設定
  end,
}
```

### キーマップの追加

カスタムキーマップを追加するには、`lua/config/keymaps.lua`を編集します：

```lua
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- 新しいキーマップを追加
keymap.set("n", "<leader>mykey", ":MyCommand<CR>", opts)
```

### LSP サーバーの追加

特定の言語サーバーを追加するには、`lua/plugins/lsp.lua`を作成します：

```lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 新しい言語サーバーを追加
        mylang = {},
      },
    },
  },
}
```

## 🔧 トラブルシューティング

### よくある問題と解決方法

#### 1. プラグインがインストールされない

**問題**: 初回起動時にプラグインがインストールされない

**解決方法**:

```bash
# Neovimを起動してLazy.nvimを手動で更新
nvim
:Lazy sync
```

#### 2. LSP が動作しない

**問題**: コード補完や診断が表示されない

**解決方法**:

1. `:Mason`で言語サーバーがインストールされているか確認
2. `:LspInfo`で LSP サーバーが起動しているか確認
3. ファイルタイプが正しく認識されているか確認（`:set filetype?`）
4. `:checkhealth nvim-treesitter`で Treesitter の状態を確認
5. tree-sitter CLI がインストールされているか確認

#### 3. カラースキームが適用されない

**問題**: カラースキームが正しく表示されない

**解決方法**:

1. `:colorscheme`で現在のスキームを確認
2. `:colorscheme tokyonight`で手動で適用
3. ターミナルの色設定を確認

#### 4. キーマップが動作しない

**問題**: 設定したキーマップが反応しない

**解決方法**:

1. `:map <leader>`でキーマップが登録されているか確認
2. モードが正しいか確認（ノーマル、挿入、ビジュアル）
3. 他のプラグインとの競合を確認

#### 5. パフォーマンスが遅い

**問題**: Neovim の動作が重い

**解決方法**:

1. `:Lazy profile`でプラグインの読み込み時間を確認
2. 不要なプラグインを無効化
3. `lazy = true`でプラグインの遅延読み込みを有効化

### ログの確認方法

```bash
# Neovimのログを確認
nvim --headless -c "lua print(vim.inspect(vim.log.levels))" -c "qa"

# Lazy.nvimのログを確認
:Lazy log
```

### 設定のリセット

設定を完全にリセットしたい場合：

```bash
# Neovimの設定ディレクトリを削除
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# 再インストール
git clone <このリポジトリのURL> ~/.config/nvim
```

## 📚 参考資料

### 公式ドキュメント

- [LazyVim 公式ドキュメント](https://lazyvim.github.io/)
- [Neovim 公式ドキュメント](https://neovim.io/doc/)
- [Lazy.nvim 公式ドキュメント](https://github.com/folke/lazy.nvim)

### 学習リソース

- [Neovim 公式チュートリアル](https://neovim.io/doc/user/quickref.html)
- [Vim Adventures](https://vim-adventures.com/) - ゲーム形式で Vim を学習
- [Vim Golf](https://www.vimgolf.com/) - Vim の操作を競うゲーム

### コミュニティ

- [r/neovim](https://www.reddit.com/r/neovim/) - Reddit コミュニティ
- [Neovim Discord](https://discord.gg/neovim) - Discord サーバー
- [LazyVim Discord](https://discord.gg/lazyvim) - LazyVim 専用 Discord

### 推奨フォント

- [Nerd Fonts](https://www.nerdfonts.com/) - アイコン対応フォント
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) - 開発者向けフォント
- [Fira Code](https://github.com/tonsky/FiraCode) - リガチャ対応フォント

### その他の設定例

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - 最小限の Neovim 設定
- [AstroNvim](https://astronvim.com/) - 別の Neovim ディストリビューション
- [NvChad](https://nvchad.com/) - モダンな Neovim 設定

---

## 📄 ライセンス

この設定は MIT ライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルを参照してください。

## 🤝 貢献

バグ報告や機能要望は、GitHub の Issues でお知らせください。プルリクエストも歓迎します。

---

**Happy Coding! 🚀**
