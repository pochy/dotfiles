" Sections:
"    -> Colors and Fonts
"    -> General
"    -> Statusline
"    -> Editing mappings
"    -> FileType
"    -> Template
"    -> Plugin Config
"
"
" Plugins_Included:
"     > EnhCommentify.vim - https://github.com/vim-scripts/EnhCommentify.vim
"       comment lines in a program
"
"     > git-vim - https://github.com/motemen/git-vim
"       My vim files for Git
"
"     > undotree - https://github.com/mbbill/undotree
"       The ultimate undo history visualizer for VIM.
"
"     > neocomplete - https://github.com/Shougo/neocomplete.vim
"       Next generation completion framework after neocomplcache.
"
"     > nerdtree - https://github.com/scrooloose/nerdtree
"       hax0r vim script to give you a tree explorer
"
"     > perldoc-vim - https://github.com/hotchpotch/perldoc-vim.git
"       Perldoc plugin for vim
"
"     > quickrun - https://github.com/thinca/vim-quickrun.git
"       Run commands quickly.
"
"     > snipmate - https://github.com/msanders/snipmate.vim
"       nipMate.vim aims to be a concise vim script that implements some of
"       TextMate's snippets features in Vim.
"
"     > tagexplorer - https://github.com/vim-scripts/tagexplorer.vim.git
"       Tag explorer for various programming language files
"
"     > unite - https://github.com/Shougo/unite.vim
"       unite all sources
"
"     > vim-pathogen - https://github.com/tpope/vim-pathogen
"       pathogen.vim: manage your runtimepath
"
"     > vim-perl - https://github.com/petdance/vim-perl
"       Support for Perl 5 and Perl 6 in Vim
"
"     > vim-ref - https://github.com/thinca/vim-ref.git
"       Integrated reference viewer.
"
"     > vim-surround - https://github.com/tpope/vim-surround
"       surround.vim: quoting/parenthesizing made simple
"
"     > vim-textmanip - https://github.com/t9md/vim-textmanip.git
"       easy text manupilation for vim
"
"     > vimproc - https://github.com/Shougo/vimproc.git
"       Interactive command execution in Vim.
"       ## Install WSL from kaoriya VIM
"       cp /mnt/c/bin/vim/plugins/vimproc/lib/vimproc_win64.dll ~/dotfiles/.vim/bundle/.cache/.vimrc/.dein/lib/
"
"     > vimshell - https://github.com/Shougo/vimshell
"       Powerful shell implemented by vim.
"
"     > xoria256 - https://github.com/vim-scripts/xoria256.vim
"       Finely tuned soft gamma, 256 colors, dark background, gvim == vim
"
"     > emmet-vim - https://github.com/mattn/emmet-vim
"       emmet-coding for vim
"
"     > perlomni.vim - https://github.com/c9s/perlomni.vim
"       perl omnicompletion for vim (including base class function compleltions .. etc)
"
"
" Setup:
"     $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
"     $ sh ./installer.sh ~/.cache/dein
"     $ export XDG_CONFIG_HOME=$HOME/.config
"     $ export XDG_CACHE_HOME=$HOME/.cache
"
" ============================================

" ============================================
" Key Mapping
" ============================================

" <silent>
" コマンドラインへの出力を抑制します。キーマッピングからコマンドを実行する場合などに指定します。
" <unique>
" すでにマッピングが存在する場合、エラーにします。通常は上書きされます。
" <buffer>
" バッファローカルなキーマッピングを定義します。
" <expr>
" マップ先の文字列を Vim の式とみなして、評価した結果の文字列をマップ先とします。


" ============================================
" PLUGIN
" ============================================


":set runtimepath+=$HOME/.vim

if &compatible
  set nocompatible
endif

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
let s:dein_cache_dir = s:cache_home . '/dein'

"dein.vimディレクトリをruntimepathに追加する
set runtimepath+=$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim

"以下定型文
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)
    call dein#load_toml(s:dein_config_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:dein_config_dir . '/dein_lazy.toml', {'lazy': 1})

    call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
set omnifunc=syntaxcomplete#Complete

if dein#check_install()
  call dein#install()
endif


" ============================================
" enable pathogen
" ============================================
"setup
"ln -s ~/.vim/bundles/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
"execute pathogen#infect()
"call pathogen#helptags()


" ============================================
" color
" ============================================
"vimの256色化
set t_Co=256
"colo wombat
"colorscheme xoria256
let g:gruvbox_italic=1
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_termcolors = 256
"color summerfruit256
"color desert256


" ============================================
" fonts
" ============================================
if has('gui_macvim')
    set guifont=Menlo:h14
    "set guifontwide=M+2VM+IPAG_circle
endif

if has('gui_gtk2')
    set guifont=Menlo\ 10
    set guifontwide=M+2VM+IPAG\ circle\ 12
endif


" ============================================
" option
" ============================================
syntax on
filetype on
filetype indent on
filetype plugin on

if has("gui_running")
"  set transparency=20
else
endif

if has("clipboard")
    set clipboard=unnamedplus
endif

"helptags ~/.vim/doc
:helptags $HOME/dotfiles/.vim/doc

" Sets how many lines of history VIM has to remember
set history=700

" バックスペースでいろいろ消せる
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"検索時に大文字小文字を無理
set ignorecase
"大文字は区別しない
set smartcase
"インクリメンタルサーチを行う
set incsearch
"検索時にハイライト
set hlsearch

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"ステータスラインを常に表示
set laststatus=2
"listで表示される文字のフォーマットを指定する
"set list
set listchars=eol:$,tab:>\ ,extends:<
"Vi互換をオフ
set nocompatible
"行番号を表示する
set number
set relativenumber
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"モード表示
set showmode
" 入力中のコマンドをステータスに表示
set showcmd
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
set cindent
" 改行コードの自動認識
set fileformats=unix,mac,dos
set fileencoding=utf-8
set fileencodings=utf-8,ms932,cp932,iso-2022-jp,euc-jp,sjis

"タブの代わりに空白文字を挿入する
set expandtab
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"シフト移動幅
set shiftwidth=4
" 編集中でのタブの幅
set softtabstop=4
" インデントを shiftwidth に丸める
set shiftround

" Some servers have issues with backup files, see #649
" coc.nvim
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

:autocmd Filetype typescript set softtabstop=4
:autocmd Filetype typescript set sw=4
:autocmd Filetype typescript set ts=4

set nrformats=

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 強化されたコマンドライン補完を使用
set wildmode=list,full
"" システムのクリップボードを使う
set clipboard=unnamed
" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
"編集中のファイル名を表示
set title
"ルーラーの表示
set ruler
"カーソルのある行をハイライトさせる
autocmd WinEnter *  setlocal cursorline
autocmd WinLeave *  setlocal nocursorline
set cursorline
"クリップボードを他のアプリと共有
set clipboard=unnamed
"現在ディレクトリを、バッファで開いているファイルが存在しているディレクトリに自動的に置き換え
"set autochdir
"上下最低２行を残してウィンドウをスクロールさせる
set scrolloff=2
"左右最低３文字を残してウィンドウをスクロールさせる
set sidescrolloff=3
"初期ディレクトリをバッファの開いたディレクトリにする
set browsedir=buffer
"バックアップファイルの作成場所指定
set backupdir=~/dotfiles/.vim/backup
"スワップファイルの作成場所指定
set directory=~/dotfiles/.vim/backup

" :make を実行したらファイルの内容を自動的に保存
set autowrite

" 全角スペースの表示
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/
" 行末のスペースを赤く表示する
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd BufRead,BufNew,WinEnter * match WhitespaceEOL /\s\+$/

" ============================================
" statusline
" ============================================

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
"autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
"ステータス行に文字コードの表示
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %(%{GitBranch()}\ %)\ %F%=[%{GitBranch()}]\ %l,%c%V%8P


" ============================================
" mapping
" ============================================
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = ","
"let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

noremap <Space> :bnext<CR>
noremap <S-Space> :bprevious<CR>
" 端末
" <C-Space> を押すと <NUL> が送られてくるようなので、逆に <NUL> が来たら
" <C-Space> になるようにしておく。
map <NUL> <S-Space>
map! <NUL> <S-Space>

"Visual mode で選択したテキストを検索する
"Visual mode の * に機能を割り当てる
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" set list のトグル
nnoremap <Leader>i :set list!<CR>

" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" ============================================
" filetype
" ============================================

au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.tt set filetype=html
au BufNewFile,BufRead *.mt set filetype=html
au BufNewFile,BufRead *.vimperatorrc set filetype=vim
au BufReadPost,BufNewFile *.t :setl filetype=perl
au BufReadPost,BufNewFile *.psgi :setl filetype=perl
au BufReadPost,BufNewFile *.vimperatorrc :setl filetype=vim
au BufReadPost,BufNewFile *.html.ep :setl filetype=html

" ============================================
" template
" ============================================
autocmd BufNewFile *.pl 0r $HOME/dotfiles/.vim/template/perl-script.txt
autocmd BufNewFile *.pm 0r $HOME/dotfiles/.vim/template/perl-module.txt
autocmd BufNewFile *.t  0r $HOME/dotfiles/.vim/template/perl-test.txt
autocmd BufNewFile,BufRead *.psgi   set filetype=perl


" ============================================
" plugin config
" ============================================


autocmd FileType json syntax match Comment +\/\/.\+$+
set conceallevel=0
let g:vim_json_syntax_conceal = 0



"set completeopt+=preview

" =====> neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" =====> neosnippet.vim
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#disable_runtime_snippets = {'_' : 1}
" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory = []
"let g:neosnippet#snippets_directory += ['~/dotfiles/.vim/bundle/neosnippet-snippets/neosnippets']
let g:neosnippet#snippets_directory += ['~/dotfiles/.vim/bundle/vim-snippets/snippets']

" =====> vimshell
let g:vimshell_split_command = 'split'
let g:vimshell_smart_case = 1
let g:vimshell_prompt = $USER."% "
let g:vimshell_user_prompt = 'printf("%s", ":~")'


" =====> emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,typescript EmmetInstall
"let g:user_emmet_mode='a'
"let g:user_emmet_leader_key = '<C-E>'
let g:user_emmet_settings = {
\  'variables' : {
\    'lang' : "ja"
\  },
\  'indentation' : '  ',
\  'html' : {
\    'snippets' : {
\      'html:5': "<!DOCTYPE html>\n"
\        ."<html lang=\"${lang}\">\n"
\        ."<head>\n"
\        ."\t<meta charset=\"${charset}\">\n"
\        ."\t<meta name=\"description\" content=\"\">\n"
\        ."\t<title></title>\n"
\        ."</head>\n"
\        ."<body>\n\t${child}|\n</body>\n"
\        ."</html>",
\    }
\  }
\}


" =====> unite
let g:unite_source_history_yank_enable =1
" 入力モードで開始する
"let g:unite_enable_start_insert=1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,ug  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,ur  :<C-u>UniteResume search-buffer<CR>
" バッファ一覧
nnoremap <silent> ,U :<C-u>Unite buffer<CR>
" ブックマーク
nnoremap <silent> ,uk :<C-u>Unite bookmark<CR>
" タブを表示
nnoremap <silent> ,ut :<C-u>Unite tab<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 最近開いたディレクトリを表示
nnoremap <silent> ,ud :<C-u>Unite<Space>directory_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--vimgrep'
  let g:unite_source_grep_recursive_opt = ''
endif
" unite grep に ag(The Silver Searcher) を使う
" if executable('ag')
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"   let g:unite_source_grep_recursive_opt = ''
" endif

" =====> git-vim
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap <Leader>gd :<C-u>GitDiff<Enter>
nnoremap <Leader>gD :<C-u>GitDiff --cached<Enter>
nnoremap <Leader>gs :<C-u>GitStatus<Enter>
nnoremap <Leader>gl :<C-u>GitLog<Enter>
nnoremap <Leader>gL :<C-u>GitLog -u \| head -10000<Enter>
nnoremap <Leader>ga :<C-u>GitAdd<Enter>
nnoremap <Leader>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Leader>gc :<C-u>GitCommit -v<Enter>
nnoremap <Leader>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Leader>gp :<C-u>Git push


" =====> surround
"
"
" #--- コマンド／囲みの中を操作
" di" 	""の中を削除
" yi" 	""の中をヤンク
" dit 	XMLタグの中を削除
" yit 	XMLタグの中をヤンク
"
" #--- コマンド／囲み自体を操作
" ds" 	囲みの""を削除
" cs"’ 	囲みの"を’に変更
" dst 	XMLタグの囲みを削除
" cst<piyo> 	XMLタグを<piyo>に変更
" ysst<piyo> 	行を<piyo>で囲む
"
" #---  コマンド／ヴィジュアルモードで選択した範囲を囲む
" S" 	""で囲む
" St<piyo> 	<piyo></piyo>で囲む
"
" #--- 独自タグ
" 例えばこれを <h1>大見出し</h1> こうしたいとする <h1><a href="#">大見出し</a></h1>
" ysit<a href="#"<Enter>
"
"
"
"
" [key map]
" 1 : <h1>|</h1>
" 2 : <h2>|</h2>
" 3 : <h3>|</h3>
" 4 : <h4>|</h4>
" 5 : <h5>|</h5>
" 6 : <h6>|</h6>
"
" p : <p>|</p>
" u : <ul>|</ul>
" o : <ol>|</ol>
" l : <li>|</li>
" a : <a href="">|</a>
" A : <a href="|"></a>
" i : <img src="|" alt="" />
" I : <img src="" alt"|" />
" d : <div>|</div>
" D : <div class="section">|</div>
" s : <strong></strong>
" e : <em></em>
" b : <b></b>
autocmd FileType html let b:surround_49  = "<h1>\r</h1>"
autocmd FileType html let b:surround_50  = "<h2>\r</h2>"
autocmd FileType html let b:surround_51  = "<h3>\r</h3>"
autocmd FileType html let b:surround_52  = "<h4>\r</h4>"
autocmd FileType html let b:surround_53  = "<h5>\r</h5>"
autocmd FileType html let b:surround_54  = "<h6>\r</h6>"
autocmd FileType html let b:surround_112 = "<p>\r</p>"
autocmd FileType html let b:surround_117 = "<ul>\r</ul>"
autocmd FileType html let b:surround_111 = "<ol>\r</ol>"
autocmd FileType html let b:surround_108 = "<li>\r</li>"
autocmd FileType html let b:surround_97  = "<a href=\"\">\r</a>"
autocmd FileType html let b:surround_65  = "<a href=\"\r\"></a>"
autocmd FileType html let b:surround_105 = "<img src=\"\r\" alt=\"\" />"
autocmd FileType html let b:surround_73  = "<img src=\"\" alt=\"\r\" />"
autocmd FileType html let b:surround_100 = "<div>\r</div>"
autocmd FileType html let b:surround_68  = "<div class=\"section\">\r</div>"
autocmd FileType html let b:surround_115  = "<strong>\r</strong>"
autocmd FileType html let b:surround_101  = "<em>\r</em>"
autocmd FileType html let b:surround_98  = "<b>\r</b>"

" NERD Tree
nmap <silent> <F3> :<C-u>NERDTreeToggle<CR>

" undotree
nmap U :<C-u>UndotreeToggle<CR>

" =====> textmanip
" 選択したテキストの移動
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)
" 行の複製
vmap <M-d> <Plug>(textmanip-duplicate-down)
nmap <M-d> <Plug>(textmanip-duplicate-down)

" =====> quickrun
" Prove を quickrun する - Heavens hell
" http://d.hatena.ne.jp/heavenshell/20110228/1298899167
augroup QuickRunUnitTest
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
  autocmd BufWinEnter,BufNewFile test_*.py set filetype=python.unit
  autocmd BufWinEnter,BufNewFile *.t set filetype=perl.unit
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  autocmd BufRead,BufNewFile *.mkd  setfiletype mkd
  autocmd BufRead,BufNewFile *.md  setfiletype mkd
  autocmd BufRead,BufNewFile *.html.ep  setfiletype html
augroup END
let g:quickrun_config = {
    \ "*": {"runner": "remote/vimproc"},
    \ 'python': {
        \ 'command': 'python3'
    \ }
\ }
" デフォルト
"    \ "outputter/buffer/split" : ":rightbelow vsplit"
let g:quickrun_config["_"] = {
    \ "runner" : "vimproc",
    \ "runner/vimproc/updatetime" : 60,
    \ 'outputter' : 'error',
    \ 'outputter/error/success' : 'buffer',
    \ 'outputter/error/error'   : 'quickfix',
    \ 'outputter/buffer/split'  : ':rightbelow 8sp',
    \ 'outputter/buffer/close_on_empty' : 1,
    \ 'outputter/popup': '',
\ }
" 実行
let g:quickrun_config["run/vimproc"] = {
    \ "exec": "%s:p:r %a",
    \ "output_encode" : "utf-8",
    \ "runner" : "job",
    \ "outputter" : "buffer"
\ }
let g:quickrun_config['php.unit'] = {'command': 'phpunitrunner'}
let g:quickrun_config['python.unit'] = {'command': 'nosetests', 'cmdopt': '-s -vv'}
let g:quickrun_config['perl.unit'] = {'command': 'prove', 'cmdopt': '-lv'}
let g:quickrun_config['perl'] = {'command': 'perl', 'cmdopt': '-l'}
let g:quickrun_config['ruby.rspec'] = {'command': 'spec'}
let g:quickrun_config['markdown'] = {
    \ 'type': 'markdown/pandoc',
    \ 'outputter': 'browser',
    \ 'cmdopt': '-s'
\ }

" q でquickfixを閉じれるようにする。
au FileType qf nnoremap <silent><buffer>q :quit<CR>

" \r でquickfixを閉じて、保存してからquickrunを実行する。
let g:quickrun_no_default_key_mappings = 1
nnoremap \r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
nnoremap \q :<C-u>bw! \[quickrun\ output\]<CR>

" <C-c> でquickrunを停止
"nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" =====> tagexplorer
:set tags=tags
nmap <silent> <F2> :<C-u>TagExplorer<CR>

" ======> ale
let g:ale_linters = {
    \'javascript': ['eslint', 'flow', 'flow-language-server', 'jscs', 'tsserver', 'standard', 'xo']
\}

" ======> vim-go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_metalinter_autosave = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" run :GoBuild or :GoTestCompile based on the go file
" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" :GoBuild and :GoTestCompile
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" :GoTest
autocmd FileType go nmap <leader>t <Plug>(go-test)

" :GoRun
autocmd FileType go nmap <leader>h <Plug>(go-run)

" :GoDoc
autocmd FileType go nmap <Leader>d <Plug>(go-doc)

" :GoCoverageToggle
"autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" :GoInfo
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" :GoMetaLinter
autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

" :GoDef but opens in a vertical split
autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
" :GoDef but opens in a horizontal split
autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

" :GoAlternate  commands :A, :AV, :AS and :AT
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:sonictemplate_vim_template_dir = [
\ '$HOME/.vim/template',
\]

" ======> coc
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype ==# 'vim'
    execute 'h '.expand('<cword>')
  else
    if coc#util#has_float()
      pc
    else
      call CocActionAsync('doHover')
    endif
  endif
endfunction


" ======> typescript-vim
let g:typescript_indent_disable = 1

" ======> airline

" ○や□の文字が崩れる問題を回避
set ambiwidth=double
let g:airline#extensions#tabline#enabled = 1

" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'gruvbox'
"let g:airline_theme = 'papercolor'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
