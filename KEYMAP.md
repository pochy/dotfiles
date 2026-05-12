# KEYMAP

更新日: 2026-04-19

このファイルは、この dotfiles で実際に意味を持つキーボードショートカットをまとめたものです。  
upstream の全ショートカット一覧ではなく、以下を優先して整理しています。

- この repo が直接定義しているキー
- この repo が有効化している upstream 既定キー
- 実際に衝突していて注意が必要なキー

前提:

- Neovim の `<leader>` は LazyVim 既定どおり `<Space>`
- Neovim の `<localleader>` は LazyVim 既定どおり `\`
- tmux の Prefix は未変更なので既定の `Ctrl-b`
- Alacritty は `option_as_alt = "Both"` のため、macOS の Option を Alt/Meta として使う前提

## 1. 先に要点

| 文脈 | 重要キー | 役割 |
| --- | --- | --- |
| Zsh | `Ctrl-R` | 履歴検索。ただし `atuin` と `fzf` が競合 |
| Zsh | `Tab` | `fzf-tab` による補完 UI |
| Zsh | `↑` / `↓` | `history-substring-search` |
| tmux | `Prefix-f` | `sesh` でプロジェクト/セッション切替 |
| tmux | `Prefix-g` | `lazygit` ポップアップ |
| tmux | `Ctrl-h/j/k/l` | Vim/tmux 横断ペイン移動。ただし Neovim の `Ctrl-j` は別用途 |
| Neovim | `jj` | Insert から `Esc` |
| Neovim | `ss` / `sv` | 水平 / 垂直 split |
| Neovim | `<leader>gs` | Fugitive の Git status |
| Neovim | `<leader>~` | Yazi |
| WezTerm | `Super-Enter` | 上下 split |
| Alacritty | `Cmd-=` / `Cmd--` / `Cmd-0` | フォントサイズ変更 / リセット |

## 2. 要注意の競合

### Zsh: `Ctrl-R`

- `.zshrc` は `atuin init zsh` を有効化しており、`Ctrl-R` を Atuin に割り当てたい構成です。
- その後で `fzf --zsh` も読み込んでいるため、`Ctrl-R` は `fzf-history-widget` と競合します。
- 実際に PTY で対話確認した結果:
  - `main` / `viins` の `Ctrl-R` は `atuin-search`
  - `vicmd` の `Ctrl-R` は `fzf-history-widget`
  - `vicmd` の `/` は `atuin-search`

結論:

- insert 中に履歴検索したいなら `Ctrl-R` は Atuin と考えてよい
- zsh-vi-mode の normal では `/` の方が安定して Atuin 検索になる
- normal で `Ctrl-R` を押すと fzf 側に落ちるため、完全統一にはなっていない

### Zsh: `↑` / `↓`

- Atuin も Up-arrow を取りにいく設計ですが、`.zshrc` の後半で `history-substring-search-up/down` に再バインドしています。
- 実効キーは `history-substring-search` 側です。

### Neovim: `<C-a>` / `+`

- [`nvim/lua/config/keymaps.lua`](nvim/lua/config/keymaps.lua) では `<C-a>` を「全選択」に再定義しています。
- 一方で [`nvim/lua/plugins/coding.lua`](nvim/lua/plugins/coding.lua) の `dial.nvim` は `<C-a>` / `<C-x>` を増減に使いたい構成です。
- `nvim --headless` で `:verbose map` を確認すると、実効マップは:
  - `<C-a>` = 全選択
  - `+` = `<C-a>` を呼ぶので、結果としてこれも全選択
  - `<C-x>` = `dial.nvim` の decrement が残る
  - `-` = `<C-x>` を呼ぶので decrement

結論:

- README 的な意味での「`+` で increment」は現在の実挙動と一致しません
- 実際は `+` は全選択、`-` は decrement です

### Neovim: `Ctrl-j`

- [`nvim/lua/plugins/editor.lua`](nvim/lua/plugins/editor.lua) の `vim-tmux-navigator` は `Ctrl-h/j/k/l` を tmux 移動に使う構成です。
- ただし [`nvim/lua/config/keymaps.lua`](nvim/lua/config/keymaps.lua) の `Ctrl-j` が「次の diagnostic へ移動」で上書きしています。

結論:

- Neovim では `Ctrl-h/k/l` は navigator 系
- `Ctrl-j` だけは tmux 移動ではなく diagnostic next

## 3. Zsh / Shell

対象設定:

- [`.zshrc`](.zshrc)
- [`sheldon/plugins.toml`](sheldon/plugins.toml)
- [`atuin/config.toml`](atuin/config.toml)

### 3.1 ローカルで明示しているキー

| キー | 動作 | 出典 |
| --- | --- | --- |
| `Home` | 行頭へ | [`.zshrc`](.zshrc) |
| `End` | 行末へ | [`.zshrc`](.zshrc) |
| `Delete` | カーソル位置を削除 | [`.zshrc`](.zshrc) |
| `Shift-Tab` | `reverse-menu-complete` | [`.zshrc`](.zshrc) |
| `↑` / `↓` | `history-substring-search-up/down` | [`.zshrc`](.zshrc) |
| `AppCursor ↑` / `↓` (`^[OA` / `^[OB`) | 同上。WezTerm/Alacritty 差異対策 | [`.zshrc`](.zshrc) |
| `vicmd k` / `j` | 履歴の部分一致検索 up/down | [`.zshrc`](.zshrc) |

### 3.2 Atuin

この repo での入口キー:

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Ctrl-R` | Atuin 検索 | insert/main では実効 |
| `vicmd /` | Atuin 検索 | normal mode ではこちらが安定 |

Atuin UI 内の重要キー:

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Enter` | 選択確定 | この repo は `enter_accept = false` なので「即実行」しない |
| `Tab` | 選択して編集に戻る | docs 上の edit 動作 |
| `Ctrl-R` | filter mode 切替 | Atuin UI 内 |
| `Ctrl-S` | search mode 切替 | Atuin UI 内 |
| `Alt-1..9` | 候補の番号選択 | macOS は Alt/Option の取り回しに依存 |
| `Ctrl-Y` | 候補を clipboard にコピー | Atuin UI 内 |
| `Esc` / `Ctrl-C` / `Ctrl-D` / `Ctrl-G` | キャンセル | Atuin UI 内 |

補足:

- [`atuin/config.toml`](atuin/config.toml) で `search_mode = "fulltext"`
- `Enter` の挙動は upstream 既定から変更済み

### 3.3 fzf shell integration (`fzf --zsh`)

この repo は `eval "$(fzf --zsh)"` を有効化しています。

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Ctrl-T` | ファイル/ディレクトリ選択を挿入 | 有効 |
| `Alt-C` | ディレクトリへ `cd` | 有効 |
| `Ctrl-R` | 履歴検索 | Atuin と競合するため、そのまま覚えない方がよい |

### 3.4 fzf-tab

`Tab` を通常の補完メニューではなく fzf ベース選択 UI に置き換えます。

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Tab` | `fzf-tab-complete` | 実対話でも確認済み |
| `Ctrl-Space` | 複数選択 | upstream 既定 |
| `,` / `.` | グループ切替 | この repo で `switch-group` を上書き |
| `/` | 継続的な completion | upstream 既定 |
| `Shift-Tab` | reverse-menu-complete | これは zsh 側のバインド |

### 3.5 zsh-vi-mode

この repo は plugin 自体を有効化していますが、独自の大量上書きはしていません。  
そのため「zsh で Vim 的に使う」前提の標準操作を覚えるのが本筋です。

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Esc` / `Ctrl-[` | Normal mode へ | upstream |
| `i` / `a` / `A` / `I` | insert/append 系 | upstream |
| `0` / `^` / `$` | 行頭/非空白先頭/行末 | upstream |
| `w` / `b` / `e` | 単語移動 | upstream |
| `f{char}` / `t{char}` / `;` / `,` | 文字移動/繰り返し | upstream |
| `vv` | 外部 editor でコマンドライン編集 | upstream |
| `ys` / `cs` / `ds` | surround 操作 | classic mode |
| `S` | visual selection に surround 追加 | classic mode |
| `vi"` / `va(` など | surround text object 選択 | upstream |

### 3.6 zsh-autosuggestions

この repo は色だけを上書きしており、accept 系のキーは upstream 既定です。

| キー | 動作 | 備考 |
| --- | --- | --- |
| `→` | suggestion を受け入れる | cursor が行末にある時 |
| `End` | suggestion を受け入れる | 同上 |
| `forward-word` | suggestion を部分受け入れ | upstream |

### 3.7 キーバインドを持たない/薄いもの

この repo では、次のツールは「専用ショートカット」より設定/表示/コマンド実行が主です。

- `sheldon`
- `zsh-defer`
- `zsh-completions`
- `zsh-syntax-highlighting`
- `blackbox`
- `starship`
- `eza`, `bat`, `fd`, `ripgrep`, `delta`, `direnv`, `zoxide`

## 4. tmux

対象設定: [`.tmux.conf`](.tmux.conf)

Prefix は既定の `Ctrl-b` のままです。

### 4.1 よく使う Prefix キー

| キー | 動作 |
| --- | --- |
| `Prefix-r` | 設定リロード |
| `Prefix-s` | `tmux list-sessions | fzf` でセッション切替 |
| `Prefix-f` | `sesh` popup でプロジェクト/セッション切替 |
| `Prefix-g` | `lazygit` popup |
| `Prefix-t` | `btop` popup |
| `Prefix-p` | `python3` popup |
| `Prefix-c` | 現在ディレクトリで新しい window |
| `Prefix-|` | 現在ディレクトリで左右 split |
| `Prefix--` | 現在ディレクトリで上下 split |

### 4.2 ペイン移動 / リサイズ

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Ctrl-h/j/k/l` | Vim なら Vim split、そうでなければ tmux pane 移動 | smart-pane-navigation |
| `Ctrl-\` | 直前 pane へ | tmux version 分岐あり |
| `Prefix-h/j/k/l` | pane 移動 | Vim ライク |
| `Prefix-H/J/K/L` | pane resize | 5 セルずつ |

### 4.3 Alt/Option 系

| キー | 動作 |
| --- | --- |
| `Alt-n` / `Alt-p` | 次 / 前 window |
| `Alt-h/j/k/l` | pane 移動 |
| `Alt-1..9` / `Alt-0` | window へ直接ジャンプ |
| `Alt-Down` | `flwin` popup を開く/attach |

### 4.4 Copy mode

`mode-keys vi` が有効です。

| キー | 動作 |
| --- | --- |
| `v` | 選択開始 |
| `V` | 行選択 |
| `Ctrl-v` | 矩形選択 |
| `y` | 選択コピー |
| `Y` | 行コピー |
| `Enter` | copy-pipe-and-cancel |

補足:

- macOS では `pbcopy` に送る
- Linux では `xsel -bi` に送る
- `MouseDragEnd1Pane` でも macOS clipboard に送る
- `Ctrl-Shift-p` で `paste-buffer`

## 5. WezTerm

対象設定: [`wezterm/wezterm.lua`](wezterm/wezterm.lua)

補足: `Super` は macOS では通常 `Command` キーです。

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Shift-Enter` | `Esc + CR` を送信 | `SendString = "\x1b\r"` |
| `Super-Enter` | 上下 split | `SplitVertical` = 新 pane が下 |
| `Super-Shift-Enter` | 左右 split | `SplitHorizontal` = 新 pane が右 |
| `Super-h/j/k/l` | 左/下/上/右 pane へ移動 | `ActivatePaneDirection` |
| `Super-u` / `Super-d` | 1/4 ページ上/下へ scroll | `ScrollByPage ±0.25` |
| `Ctrl-Click` | リンクを開く | mouse binding |

## 6. Alacritty

対象設定:

- [`alacritty/alacritty.toml`](alacritty/alacritty.toml)
- [`alacritty/alacritty.base.toml`](alacritty/alacritty.base.toml)

### 6.1 この repo で明示しているキー

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Cmd-=` | フォントサイズ拡大 | macOS |
| `Cmd--` | フォントサイズ縮小 | macOS |
| `Cmd-0` | フォントサイズリセット | macOS |
| `Cmd-Ctrl-F` | `ToggleSimpleFullscreen` | 標準 fullscreen ではなく SimpleFullscreen |
| `Cmd-Ctrl-M` | 最大化 toggle | local override |
| `Shift-Enter` | `Esc + CR` を送信 | WezTerm と同じ意図 |

### 6.2 実用上の補足

- `option_as_alt = "Both"` なので `Alt-C` や tmux の `Alt-h/j/k/l` を通しやすい
- `selection.save_to_clipboard = true` なので選択しただけで clipboard に入る

## 7. Neovim

対象設定:

- [`nvim/lua/config/keymaps.lua`](nvim/lua/config/keymaps.lua)
- [`nvim/lua/plugins/editor.lua`](nvim/lua/plugins/editor.lua)
- [`nvim/lua/plugins/ui.lua`](nvim/lua/plugins/ui.lua)
- [`nvim/lua/plugins/coding.lua`](nvim/lua/plugins/coding.lua)
- [`nvim/lua/plugins/blink-cmp.lua`](nvim/lua/plugins/blink-cmp.lua)

前提:

- `<leader>` = `<Space>`
- which-key が入っているので、`Space` を押すと候補を思い出しやすい

### 7.1 基本編集

| キー | 動作 | 備考 |
| --- | --- | --- |
| `jj` | Insert -> `Esc` | 独自 |
| `x` | 文字削除しても yank しない | black-hole register |
| `dw` | 前方ではなく「後ろ向きに 1 語削除」 | 標準 `dw` と別物 |
| `<leader>o` | comment continuation なしで下に行追加 | 独自 |
| `<leader>O` | comment continuation なしで上に行追加 | 独自 |
| `<C-a>` | 全選択 (`ggVG`) | 実効マップ |
| `+` | 実質 `<C-a>` | つまり全選択になる |
| `-` | 実質 `<C-x>` | decrement |
| `<leader>y` | system clipboard へ yank | 実効マップ |
| `<leader>p` | system clipboard から paste | 実効マップ |
| Visual で `Esc` | 選択を clipboard に yank して visual 終了 | マウス選択との相性を狙った独自動作 |

### 7.2 タブ / split / window

| キー | 動作 |
| --- | --- |
| `te` | 新 tab |
| `ss` | 水平 split |
| `sv` | 垂直 split |
| `sh/sj/sk/sl` | window 移動 |
| `<C-w><Left/Right/Up/Down>` | split resize |
| `<Tab>` | 次 buffer |
| `<S-Tab>` | 前 buffer |

### 7.3 Diagnostics / config

| キー | 動作 |
| --- | --- |
| `Ctrl-j` | 次の diagnostic へ |
| `<leader>ct` | 現在 buffer の diagnostics on/off |
| `<leader>cta` | Markdown buffer の diagnostics を無効化 |
| `<leader>cR` | `ConfigReload` |

### 7.4 tmux / terminal 連携

| キー | 動作 | 備考 |
| --- | --- | --- |
| `Ctrl-h` | tmux/vim 左移動 | `vim-tmux-navigator` |
| `Ctrl-k` | tmux/vim 上移動 | `vim-tmux-navigator` |
| `Ctrl-l` | tmux/vim 右移動 | `vim-tmux-navigator` |
| `Ctrl-j` | tmux 下移動ではなく diagnostic next | 上書き済み |
| `Ctrl-\` | 前の tmux/vim pane | plugin 側 |

### 7.5 Git / tools

| キー | 動作 |
| --- | --- |
| `<leader>gs` | `:Git` |
| `<leader>ga` | `:Git add ` |
| `<leader>gA` | `:Git add .` |
| `<leader>gF` | `:Git fetch -p` |
| `<leader>gp` | `:Git push --quiet` |
| `<leader>gc` | `:Git commit -qam "` |
| `<leader>~` | Yazi を現在ファイル位置で開く |
| `<leader>cw` | Yazi を cwd で開く |
| `<C-Up>` | 直前の Yazi セッション再開 |
| `<leader>z` | Zen Mode |
| `<leader>ux` | blink.cmp の補完 on/off |
| `<leader>cn` | Neogen |
| Visual `<leader>r` | Refactoring |
| `<leader>co` | Outline toggle |

### 7.6 Godot プロジェクト内限定

| キー | 動作 |
| --- | --- |
| `<leader>gb` | breakpoint 追加 |
| `<leader>gB` | breakpoint 全削除 |
| `<leader>gf` | breakpoint 全検索 |

## 8. upstream 全体を見たい時の参照先

このファイルは「この repo で重要なもの」に絞っています。upstream の全キーマップを見るなら以下。

- LazyVim keymaps: <https://www.lazyvim.org/keymaps>
- fzf shell integration: <https://github.com/junegunn/fzf>
- fzf-tab README: <https://github.com/Aloxaf/fzf-tab>
- zsh-vi-mode README: <https://github.com/jeffreytse/zsh-vi-mode>
- zsh-history-substring-search README: <https://github.com/zsh-users/zsh-history-substring-search>
- zsh-autosuggestions README: <https://github.com/zsh-users/zsh-autosuggestions>
- Atuin key binding docs: <https://docs.atuin.sh/cli/configuration/key-binding/>
- Alacritty bindings/docs: <https://alacritty.org/config-alacritty-bindings.html> / <https://alacritty.org/config-alacritty.html>
- WezTerm key assignments: <https://wezterm.org/config/lua/keyassignment/SplitVertical.html> / <https://wezterm.org/config/lua/keyassignment/ActivatePaneDirection.html>

## 9. 参照元

ローカル設定:

- [`.zshrc`](.zshrc)
- [`.tmux.conf`](.tmux.conf)
- [`sheldon/plugins.toml`](sheldon/plugins.toml)
- [`atuin/config.toml`](atuin/config.toml)
- [`wezterm/wezterm.lua`](wezterm/wezterm.lua)
- [`alacritty/alacritty.base.toml`](alacritty/alacritty.base.toml)
- [`nvim/lua/config/keymaps.lua`](nvim/lua/config/keymaps.lua)
- [`nvim/lua/plugins/editor.lua`](nvim/lua/plugins/editor.lua)
- [`nvim/lua/plugins/ui.lua`](nvim/lua/plugins/ui.lua)
- [`nvim/lua/plugins/coding.lua`](nvim/lua/plugins/coding.lua)
- [`nvim/lua/plugins/blink-cmp.lua`](nvim/lua/plugins/blink-cmp.lua)

外部確認:

- Atuin 公式 docs
- LazyVim 公式 docs
- fzf / fzf-tab / zsh-vi-mode / zsh-history-substring-search / zsh-autosuggestions の公式 README
- Alacritty / WezTerm の公式 docs
