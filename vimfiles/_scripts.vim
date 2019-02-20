scriptencoding utf-8
"----------------------------------------
" vim scripts
"----------------------------------------
""""""""""""""""""""""""""""""
" Vimコマンドの出力を取り込み(pで貼り付け)
" (例) :Redir set
" ダブルクオーテーションは`\`でエスケープ
""""""""""""""""""""""""""""""
command! -nargs=* Redir redir @*>|exe <q-args>|redir END
if has('unix')
command! -nargs=* Redir redir @">|exe <q-args>|redir END
endif

""""""""""""""""""""""""""""""
" 同じファイルを複数のVimで開かない
""""""""""""""""""""""""""""""
if version >= 800 || (version == 704 && has('patch1674'))
  packadd! editexisting
elseif !exists('g:editExisting')
  runtime! macros/editExisting.vim
  let g:editExisting = 1
endif

""""""""""""""""""""""""""""""
" ステータスラインに文字コード等表示
" カーソル上の文字コードをエンコードに応じた表示にする
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif

function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"----------------------------------------
if !has('autocmd')
  finish
endif

""""""""""""""""""""""""""""""
" ファイルを開いたら前回のカーソル位置へ移動
" $VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimStartup
  au!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g`\"zz" | endif
  au BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g`\"zz" | endif
augroup END

""""""""""""""""""""""""""""""
" 挿入モードの強調表示
""""""""""""""""""""""""""""""
if (!exists('hi_insert'))
  let g:hi_insert = 'hi! link StatusLine Search'
endif
if has('syntax')
  augroup InsertHook
    au!
    au InsertEnter * call s:InsertHook('Enter')
    au InsertLeave * call s:InsertHook('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:InsertHook(mode)
 if a:mode == 'Enter'
   set cursorline
   silent! let s:slhlcmd = 'hi ' . s:GetHighlight('StatusLine')
   silent exe g:hi_insert
 else
   set nocursorline
   highlight clear StatusLine
   silent! exe s:slhlcmd
 endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exe 'silent highlight '.a:hi
  redir END

  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""
" 全角スペースを表示
""""""""""""""""""""""""""""""
function! s:ZenkakuSpace()
  if !hlexists("ZenkakuSpace")
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  endif
  return
endfunction
if has('syntax')
  augroup ZenkakuSpace
    au!
    au ColorScheme       * call s:ZenkakuSpace()
    au VimEnter,WinEnter * match ZenkakuSpace '\%u3000'
  augroup END
  call s:ZenkakuSpace()
endif

""""""""""""""""""""""""""""""
" スクリプトの改行コードを強制
""""""""""""""""""""""""""""""
augroup fileFormat
  au!
  au BufWritePre *.sh set ff=unix | set nobomb
  au BufWritePre *.vim,.vimrc,.gvimrc set ff=unix | set nobomb
augroup END

"----------------------------------------
" Device dependent codes
"----------------------------------------
""""""""""""""""""""""""""""""
" 端末での表示色が戻らないことがあるので
" 終了時に表示色を明示的に再設定
""""""""""""""""""""""""""""""
if has('unix') && !has('gui_running')
  au VimLeave * let saved_t_Co=&t_Co|let &t_Co=1|let &t_Co=saved_t_Co
endif

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
" Additional scripts
"----------------------------------------
