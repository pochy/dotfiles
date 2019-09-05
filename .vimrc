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
"     $ git pull
"     $ git submodule init
"     $ git submodule update
"     $ git submodule foreach 'git checkout master'
"     $ cd .vim/autoload
"     $ ln -s ../bundle/vim-pathogen/autoload/pathogen.vim .
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

"dein.vimディレクトリをruntimepathに追加する
set runtimepath+=~/dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim

"以下定型文
if dein#load_state("~/dotfiles/.vim/bundle")
  call dein#begin("~/dotfiles/.vim/bundle")
    call dein#add("~/dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim")
    
      "好きなプラグインを dein#add() 追加していく
      "call dein#add('好きなプラグイン')
      call dein#add('vim-airline/vim-airline')
      call dein#add('motemen/git-vim')
      call dein#add('mbbill/undotree')
      call dein#add('scrooloose/nerdtree')
      call dein#add('hotchpotch/perldoc-vim.git')
      call dein#add('thinca/vim-quickrun.git')
      call dein#add('thinca/vim-ref.git')
"      call dein#add('msanders/snipmate.vim')
      call dein#add('Shougo/vimproc.git', {'build': 'make'})
      call dein#add('Shougo/neocomplete.vim')
      call dein#add('Shougo/unite.vim')
      call dein#add('Shougo/unite-outline')
      call dein#add('Shougo/neomru.vim')
      call dein#add('Shougo/vimshell.vim')
      call dein#add('petdance/vim-perl')
      call dein#add('tpope/vim-surround')
      call dein#add('t9md/vim-textmanip.git')
      call dein#add('vim-scripts/tagexplorer.vim.git')
      call dein#add('vim-scripts/EnhCommentify.vim')
      call dein#add('vim-scripts/xoria256.vim')
      call dein#add('mattn/emmet-vim')
      call dein#add('c9s/perlomni.vim')
      call dein#add('Quramy/tsuquyomi')
      call dein#add('leafgarland/typescript-vim')
      call dein#add('othree/yajs.vim')
      call dein#add('othree/es.next.syntax.vim')
      call dein#add('Yggdroot/indentLine')
      call dein#add('osyo-manga/vim-anzu')
      call dein#add('rhysd/clever-f.vim')
      call dein#add('kana/vim-filetype-haskell')
      call dein#add('eagletmt/ghcmod-vim')
      call dein#add('ujihisa/neco-ghc')
      call dein#add('osyo-manga/vim-watchdogs')
      call dein#add('ujihisa/ref-hoogle')
      call dein#add('ujihisa/unite-haskellimport')
      call dein#add('fatih/vim-go')
      call dein#add('AndrewRadev/splitjoin.vim')
      call dein#add('SirVer/ultisnips')
      call dein#add('ctrlpvim/ctrlp.vim')
      call dein#add('chr4/nginx.vim')
      call dein#add('mattn/sonictemplate-vim')
      call dein#add('elmcast/elm-vim')
      call dein#add('dense-analysis/ale')
      call dein#add('mxw/vim-jsx')
      call dein#add('ternjs/tern_for_vim')

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
"ln -s ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/
"execute pathogen#infect()
"call pathogen#helptags()


" ============================================
" color
" ============================================
"vimの256色化
set t_Co=256
"colo wombat
colorscheme xoria256
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
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
"ステータス行に文字コードの表示
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


" =====> neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
"
let g:neocomplcache_ctags_arguments_list = {
      \ 'perl' : '-R -h ".pm"'
      \ }

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'actionscript' : $HOME . '/dotfiles/.vim/dict/actionscript3.dict',
    \ 'javascript' : $HOME . '/dotfiles/.vim/dict/javascript.dict',
    \ 'mxml'       : $HOME . '/dotfiles/.vim/dict/mxml.dict',
    \ 'perl'       : $HOME . '/dotfiles/.vim/dict/perl.dict',
    \ 'int-perlsh' : $HOME . '/dotfiles/.vim/dict/perl.dict'
    \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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
let g:quickrun_config = {}
" デフォルト
"    \ "outputter/buffer/split" : ":rightbelow vsplit"
let g:quickrun_config["_"] = {
    \ "runner" : "job",
    \ "runner/vimproc/updatetime" : 10,
    \ 'outputter' : 'error',
    \ 'outputter/error/success' : 'buffer',
    \ 'outputter/error/error'   : 'quickfix',
    \ 'outputter/buffer/split'  : ':rightbelow 8sp',
    \ 'outputter/buffer/close_on_empty' : 1,
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
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" =====> tagexplorer
:set tags=tags
nmap <silent> <F2> :<C-u>TagExplorer<CR>

" ======> ale
let g:ale_linters = {
    \'javascript': ['eslint', 'flow', 'flow-language-server', 'jscs', 'tsserver', 'standard', 'xo']
\}

" ======> vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

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

" :GoTest
autocmd FileType go nmap <leader>t  <Plug>(go-test)

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
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" :GoRun
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" :GoDoc
autocmd FileType go nmap <Leader>d <Plug>(go-doc)

" :GoCoverageToggle
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

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
