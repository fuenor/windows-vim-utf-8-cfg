"========================================
"   Description : .gvimrc
"   Version     : 8.1
"========================================
scriptencoding utf-8
set nocompatible
"----------------------------------------
" エンコーディング指定
"----------------------------------------
" エンコーディング指定を動的に設定したい場合は次行をコメントアウト
" runtime _encodings.vim
if !exists('loaded_encodings')
  set encoding=utf-8
  if has('iconv')
    set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default,latin1
  else
    set fileencodings=ucs-bom,utf-8,sjis,utf-16le,utf-16,default,latin1
  endif
  set fileformats=unix,dos,mac
endif

" scriptencodingは本来ファイル先頭で指定するべきだが、
" 内部エンコーディングを変更した場合は再設定の必要がある
scriptencoding utf-8

"----------------------------------------
" システム設定
"----------------------------------------
" ファイルの上書きの前に(安全のため)一時的にバックアップする/しない
set nowritebackup
" テンポラリファイル/バックアップファイル保存場所
if has('win32') || has('win64') || has('win16')
  set directory=$TEMP,$TMP
  set backupdir=$TEMP,$TMP
elseif has("unix")
  let dir = (exists('$TMPDIR')) ? $TMPDIR : $HOME.'/.tmp'
  if !isdirectory(dir)
    call mkdir(dir, 'p', 0775)
  endif
  if isdirectory(dir)
    let &directory=dir
    let &backupdir=dir
  endif
endif
" 再読込/終了後も継続するUndo
if version >= 703
  set undofile
  " Undo保存場所
  let &undodir=&backupdir
endif
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" カーソル移動で行末／行頭をまたぐ移動を可能にする
set whichwrap=b,s,[,],<,>
" ビジュアルモードのフリーカーソルを有効にする+(行端<EOL>への移動)
set virtualedit=block
" set virtualedit+=onemore
" 自動的にインデントする
set autoindent
" Tabをスペースに展開する
" set expandtab
" Tab設定
" set tabstop=4 shiftwidth=4 softtabstop=4
" 日本語行の連結時には空白を入力しない
set formatoptions+=mM
if version >= 704
  set formatoptions+=j
endif
" 英文連結時に追加する空白を１個にする
set nojoinspaces
" 8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
" 未保存バッファからの移動時に警告を出さない
set hidden
" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100
" コマンドライン補完するときに強化されたものを使う
set wildmenu
" 暗号化アルゴリズム
if has('nvim')
  " neovimはcryptmethodをサポートしていない
elseif version >= 800 || (version == 704 && has('patch401'))
  set cryptmethod=blowfish2
elseif version >= 703
  set cryptmethod=blowfish
endif
" クリップボードをOSと共有
if !has('nvim') " neovimはclipboardをサポートしていない
  set clipboard+=unnamed
endif
" Windowsでもディレクトリパスの区切り文字に / を使う
" set shellslash

"----------------------------------------
" 検索
"----------------------------------------
" 検索時に大文字小文字を区別しない
" (大文字小文字の両方が含まれている場合は大文字小文字を区別)
set ignorecase
set smartcase
" インクリメンタルサーチ
if has('reltime')
  set incsearch
endif
" 検索文字列の強調表示(強調表示は :noh で解除)
" nnoremap <silent> <C-l> <ESC>:noh<CR><C-l>
" のように定義しておくと <C-l>で簡単に解除可能
set hlsearch
" 挿入モードの<C-x><C-o>で起動するomni補完を
" syntaxファイルのキーワードから自動設定
set omnifunc=syntaxcomplete#Complete

"----------------------------------------
" 表示設定
"----------------------------------------
" 音を鳴らさない＆画面更新の抑制(GVimは.gvimrcで指定)
set noerrorbells
set novisualbell
set visualbell t_vb=
" スプラッシュ(起動時のコピーライト)を表示しない
" set shortmess+=I
" ステータス行を常に表示
set laststatus=2
" 行番号表示
set number
" カーソル位置表示
set ruler
" 左端に折りたたみ用余白を表示
if has('folding')
  set foldcolumn=1
endif
" カーソル行より下に行を表示
" set scrolloff=1
" ウィンドウにタイトルを表示
set title
" 画面最後の行をできる限り表示
set display+=lastline
" 折り返された行を同じインデントで表示
if version >= 800 || (version == 704 && has('patch338'))
  " set breakindent
endif
" 括弧の対応表示
set showmatch
set matchtime=1
" Tabと行末の半角スペースを明示的に表示
set list
set listchars=tab:^\ ,trail:~
" □や○等East Asian Ambiguousな文字でカーソル位置がずれないようにする
set ambiwidth=double
" silent! set ambiwidth=auto
" 一部の再描画を行わないで高速化
" set lazyredraw

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

"--------
" vim.tinyよけ(以降はvim.tinyだと実行されない)
if 0 | endif
"--------

" vimの色テーマ(GVimは.gvimrcで指定)
" colorscheme mycolor

"----------------------------------------
" diff/grep/tags
"----------------------------------------
if has('user_commands')
  " 現バッファの変更差分表示
  command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
  " ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
  command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit | else | execute 'vertical diffsplit '.escape('<args>', ' ') | endif
endif

" grep, tagsのためカレントディレクトリを自動移動
if exists('+autochdir')
  set autochdir
else
  au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
endif

"----------------------------------------
" filetype
"----------------------------------------
if has("autocmd")
  filetype plugin indent on
endif

"----------------------------------------
" key mappings
"----------------------------------------
runtime _keymaps.vim

"----------------------------------------
" vim scripts
"----------------------------------------
runtime _scripts.vim

"----------------------------------------
" plugins
"----------------------------------------

"----------------------------------------
" Device dependent codes
"----------------------------------------
""""""""""""""""""""""""""""""
" Windowsで内部エンコーディングがcp932以外の場合
" makeの日本語メッセージ文字化けを回避
""""""""""""""""""""""""""""""
" if &enc != 'cp932' && (has('win32') + has('win64'))
"   au QuickfixCmdPost make call QFixCnv('cp932')
"   au QuickfixCmdPost * call QFixCnv('cp932')
"
"   function! QFixCnv(enc)
"     if a:enc == &enc
"       return
"     endif
"     let qflist = getqflist()
"     for i in qflist
"       let i.text = iconv(i.text, a:enc, &enc)
"     endfor
"     call setqflist(qflist)
"   endfunction
" endif

"----------------------------------------
" Other settings
" ----------------------------------------

