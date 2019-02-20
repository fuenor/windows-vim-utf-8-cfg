scriptencoding utf-8

"----------------------------------------
" カーソル移動
"----------------------------------------
" カーソルを表示行で移動
" 物理行移動は<C-n>,<C-p> または gj gk
" キーボードマクロには物理行移動を推奨
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up>   gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" " 折りたたみ行ではカーソル移動で折りたたみを開く
" if !&cp
"   nnoremap <silent> h <Left>zv
"   nnoremap <silent> l <Right>zv
" endif

" ノーマルモードのBSキーで文字削除
nnoremap <silent> <BS> X
" ノーマルモードのBSキーで文字削除(改行削除対応)
" nnoremap <silent> <expr> <BS> col('.') != 1 ? "X" : "i\<BS>\<ESC>\<Right>"

"----------------------------------------
" <C-l>を<ESC>として利用する
" ノーマルモードでは検索のハイライト無効化+再描画
"----------------------------------------
" nnoremap <silent> <C-l> <ESC>:<C-u>noh<CR><C-l>
" vnoremap <C-l> <ESC>
" inoremap <C-l> <ESC>
" onoremap <C-l> <ESC>
" cnoremap <C-l> <ESC>

"----------------------------------------
" ノーマルモード
"----------------------------------------
" 強制全保存終了を無効化
nnoremap ZZ zz
" カーソル位置の単語ヘルプ
nnoremap <F1> K
" バッファ変更時のみ保存
nnoremap <silent> <C-s> :<C-u>update<CR>
" 検索後に検索行を画面の中心に
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

