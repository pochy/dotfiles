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
"     > vim-pathogen - https://github.com/tpope/vim-pathogen
"       pathogen.vim: manage your runtimepath
"
"     > neocomplcache - https://github.com/Shougo/neocomplcache
"       Ultimate auto-completion system for Vim.
"
"     > vimshell - https://github.com/Shougo/vimshell
"       Powerful shell implemented by vim.
"
"     > vimproc - https://github.com/Shougo/vimproc.git
"       Interactive command execution in Vim.
"
"     > unite - https://github.com/Shougo/unite.vim
"       unite all sources
"
"     > vim-ref - https://github.com/thinca/vim-ref.git
"       Integrated reference viewer.
"
"     > zencoding-vim - https://github.com/mattn/zencoding-vim
"       zen-coding for vim
"
"     > perlomni.vim - https://github.com/c9s/perlomni.vim
"       perl omnicompletion for vim
"
"     > vim-perl - https://github.com/petdance/vim-perl
"       Support for Perl 5 and Perl 6 in Vim
"
"     > git-vim - https://github.com/motemen/git-vim
"       My vim files for Git
"
"     > EnhCommentify.vim - https://github.com/vim-scripts/EnhCommentify.vim
"       comment lines in a program
"
"     > vim-surround - https://github.com/tpope/vim-surround
"       surround.vim: quoting/parenthesizing made simple
"
"     > snipmate - https://github.com/msanders/snipmate.vim
"       nipMate.vim aims to be a concise vim script that implements some of
"       TextMate's snippets features in Vim.
"
"     > vim-quickrun - https://github.com/ujihisa/quickrun
"       quick vim quick
"
"     > nerdtree - https://github.com/scrooloose/nerdtree
"       hax0r vim script to give you a tree explorer
"
"     > xoria256 - https://github.com/vim-scripts/xoria256.vim
"       Finely tuned soft gamma, 256 colors, dark background, gvim == vim
"
"     > gundo - https://github.com/sjl/gundo.vim
"       Graph your Vim undo tree in style.
"
"     > ActionScript-3-Omnicomplete - https://github.com/vim-scripts/ActionScript-3-Omnicomplete.git
"       Omnicompletion plug-in for ActionScript 3
"
"     > actionscript.vim--Leider - https://github.com/vim-scripts/actionscript.vim--Leider.git
"       ActionScript 3.0 syntax file
"
" ============================================



" ============================================
" enable pathogen
" ============================================
"setup
"ln -s ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" ============================================
" color
" ============================================
"vimの256色化
set t_Co=256
"colo wombat
colo xoria256
"color summerfruit256
"color desert256

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

"helptags ~/.vim/doc

" Sets how many lines of history VIM has to remember
set history=700

" Set backspace config
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
set fileformats=unix
set fileencoding=utf-8

"タブの代わりに空白文字を挿入する
set expandtab
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"シフト移動幅
set shiftwidth=2
" 編集中でのタブの幅
set softtabstop=2
" インデントを shiftwidth に丸める
set shiftround

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
set backupdir=~/.vim/backup
"スワップファイルの作成場所指定
set directory=~/.vim/backup

" 全角スペースの表示
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

" ============================================
" statusline
" ============================================

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
"ステータス行に文字コードの表示
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %(%{GitBranch()}\ %)\ %F%=[%{GitBranch()}]\ %l,%c%V%8P


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

" ============================================
" filetype
" ============================================

au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.tt set filetype=html
au BufNewFile,BufRead *.mt set filetype=html
au BufNewFile,BufRead *.vimperatorrc set filetype=vim
au BufReadPost,BufNewFile *.t :setl filetype=perl
au BufReadPost,BufNewFile *.psgi :setl filetype=perl
au BufReadPost,BufNewFile *.vimperatorrc :setl filetype=vim

" ============================================
" template
" ============================================
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.pm 0r $HOME/.vim/template/perl-module.txt
autocmd BufNewFile *.t  0r $HOME/.vim/template/perl-test.txt


" ============================================
" plugin config
" ============================================


" =====> neocomplcache
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_plugin_completion_length = {
  \ 'snipMate_complete' : 1,
  \ 'buffer_complete'   : 2,
  \ 'include_complete'  : 2,
  \ 'syntax_complete'   : 2,
  \ 'filename_complete' : 2,
  \ 'keyword_complete'  : 2,
  \ 'omni_complete'     : 1
  \ }
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'    : '',
  \ 'actionscript' : $HOME . '/.vim/dict/actionscript3.dict',
  \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
  \ 'mxml'       : $HOME . '/.vim/dict/mxml.dict',
  \ 'perl'       : $HOME . '/.vim/dict/perl.dict',
  \ 'int-perlsh' : $HOME . '/.vim/dict/perl.dict'
  \ }
let g:neocomplcache_same_filetype_lists = {
  \ 'c'          : 'ref-man,ref-erlang',
  \ 'perl'       : 'ref-perldoc',
  \ 'tt2html'    : 'html,perl',
  \ 'int-perlsh' : 'perl,ref-perldoc',
  \ }


" =====> vimshell
let g:vimshell_split_command = 'split'
let g:vimshell_smart_case = 1
let g:vimshell_prompt = $USER."% "
let g:vimshell_user_prompt = 'printf("%s %s", fnamemodify(getcwd(), ":~"), vimshell#vcs#info("(%s)-[%b]"))'


" =====> zencoding
" <C-y>,で使用する
let g:user_zen_settings = { 'indentation':'  ' }


" =====> unite
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplitegister register<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


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
nnoremap <Leader>gc :<C-u>GitCommit<Enter>
nnoremap <Leader>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Leader>gp :<C-u>Git push


" =====> surround
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

" NERD Tree
nmap <silent> <F3> :<C-u>NERDTreeToggle<CR>

" gundo
nmap U :<C-u>GundoToggle<CR>

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
augroup END
let g:quickrun_config = {}
let g:quickrun_config['php.unit'] = {'command': 'phpunitrunner'}
let g:quickrun_config['python.unit'] = {'command': 'nosetests', 'cmdopt': '-s -vv'}
let g:quickrun_config['perl.unit'] = {'command': 'prove'}
