" File:       mod-hybrid colorscheme
" Maintainer: shiftrot@gmail.com
" License:    MIT

" Original:   hybrid.vim
" Maintainer: Andrew Wong (w0ng)
" URL:        https://github.com/w0ng/vim-hybrid
" Modified:   27 Jan 2013 07:33 AM AEST
" License:    MIT

" Description:"{{{
" ----------------------------------------------------------------------------
" The default RGB colour palette is taken from Tomorrow-Night.vim:
" https://github.com/chriskempson/vim-tomorrow-theme
"
" The reduced RGB colour palette is taken from Codecademy's online editor:
" https://www.codecademy.com/learn
"
" The syntax highlighting scheme is taken from jellybeans.vim:
" https://github.com/nanotech/jellybeans.vim
"
" The is code taken from solarized.vim:
" https://github.com/altercation/vim-colors-solarized

"}}}
" Requirements And Recommendations:"{{{
" ----------------------------------------------------------------------------
" Requirements
"   - gVim 7.3+ on Linux, Mac and Windows.
"   - Vim 7.3+ on Linux and Mac, using a terminal that supports 256 colours.
"
" Due to the limited 256 palette, colours in Vim and gVim will still be slightly
" different.
"
" In order to have Vim use the same colours as gVim (the way this colour scheme
" is intended), it is recommended that you define the basic 16 colours in your
" terminal.
"
" For Linux users (rxvt-unicode, xterm):
"
" 1.  Add the default palette to ~/.Xresources:
"
"         https://gist.github.com/3278077
"
"     or alternatively, add the reduced contrast palette to ~/.Xresources:
"
"         https://gist.github.com/w0ng/16e33902508b4a0350ae
"
" 2.  Add to ~/.vimrc:
"
"         let g:hybrid_custom_term_colors = 1
"         let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
"         colorscheme hybrid
"
" For OSX users (iTerm):
"
" 1.  Import the default colour preset into iTerm:
"
"         https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors
"
"     or alternatively, import the reduced contrast color preset into iTerm:
"
"         https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid-reduced-contrast.itermcolors
"
" 2.  Add to ~/.vimrc:
"
"         let g:hybrid_custom_term_colors = 1
"         let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
"         colorscheme hybrid

"}}}
" Initialisation:"{{{
" ----------------------------------------------------------------------------

hi clear

if exists("syntax_on")
  syntax reset
endif

let s:style = &background

let g:colors_name = "hybrid"

"}}}
" GUI And Cterm Palettes:"{{{
" ----------------------------------------------------------------------------

let s:palette = {'gui' : {} , 'cterm' : {}}

if exists("g:hybrid_reduced_contrast") && g:hybrid_reduced_contrast == 1
  let s:gui_background = "#232c31"
  let s:gui_selection  = "#425059"
  let s:gui_line       = "#2d3c46"
  let s:gui_system     = "#6c7a80"
else
  let s:gui_background = "#1d1f21"
  let s:gui_selection  = "#373b41"
  let s:gui_line       = "#282a2e"
  let s:gui_system     = "#707880"
endif

let s:palette.gui.background = { 'dark' : s:gui_background , 'light' : "#e4e4e4" }
let s:palette.gui.foreground = { 'dark' : "#c5c8c6"        , 'light' : "#000000" }
let s:palette.gui.selection  = { 'dark' : s:gui_selection  , 'light' : "#bcbcbc" }
let s:palette.gui.line       = { 'dark' : s:gui_line       , 'light' : "#d0d0d0" }
let s:palette.gui.system     = { 'dark' : s:gui_system     , 'light' : "#5f5f5f" }
let s:palette.gui.red        = { 'dark' : "#cc6666"        , 'light' : "#5f0000" }
let s:palette.gui.orange     = { 'dark' : "#de935f"        , 'light' : "#875f00" }
let s:palette.gui.yellow     = { 'dark' : "#f0c674"        , 'light' : "#5f5f00" }
let s:palette.gui.green      = { 'dark' : "#b5bd68"        , 'light' : "#005f00" }
let s:palette.gui.aqua       = { 'dark' : "#8abeb7"        , 'light' : "#005f5f" }
let s:palette.gui.blue       = { 'dark' : "#81a2be"        , 'light' : "#00005f" }
let s:palette.gui.purple     = { 'dark' : "#b294bb"        , 'light' : "#5f005f" }
let s:palette.gui.window     = { 'dark' : "#303030"        , 'light' : "#9e9e9e" }
let s:palette.gui.darkcolumn = { 'dark' : "#1c1c1c"        , 'light' : "#808080" }
let s:palette.gui.addbg      = { 'dark' : "#5F875F"        , 'light' : "#d7ffd7" }
let s:palette.gui.addfg      = { 'dark' : "#d7ffaf"        , 'light' : "#005f00" }
let s:palette.gui.changebg   = { 'dark' : "#5F5F87"        , 'light' : "#d7d7ff" }
let s:palette.gui.changefg   = { 'dark' : "#d7d7ff"        , 'light' : "#5f005f" }
let s:palette.gui.delbg      = { 'dark' : "#cc6666"        , 'light' : "#ffd7d7" }
let s:palette.gui.darkblue   = { 'dark' : "#00005f"        , 'light' : "#d7ffd7" }
let s:palette.gui.darkcyan   = { 'dark' : "#005f5f"        , 'light' : "#005f00" }
let s:palette.gui.darkred    = { 'dark' : "#5f0000"        , 'light' : "#d7d7ff" }
let s:palette.gui.darkpurple = { 'dark' : "#5f005f"        , 'light' : "#5f005f" }

if exists("g:hybrid_custom_term_colors") && g:hybrid_custom_term_colors == 1
  let s:cterm_foreground = "15"  " White
  let s:cterm_selection  = "8"   " DarkGrey
  let s:cterm_line       = "0"   " Black
  let s:cterm_system     = "7"   " LightGrey
  let s:cterm_red        = "9"   " LightRed
  let s:cterm_orange     = "3"   " DarkYellow
  let s:cterm_yellow     = "11"  " LightYellow
  let s:cterm_green      = "10"  " LightGreen
  let s:cterm_aqua       = "14"  " LightCyan
  let s:cterm_blue       = "12"  " LightBlue
  let s:cterm_purple     = "13"  " LightMagenta
  let s:cterm_delbg      = "9"   " LightRed
else
  let s:cterm_foreground = "250"
  let s:cterm_selection  = "237"
  let s:cterm_line       = "235"
  let s:cterm_system     = "243"
  let s:cterm_red        = "167"
  let s:cterm_orange     = "173"
  let s:cterm_yellow     = "221"
  let s:cterm_green      = "143"
  let s:cterm_aqua       = "109"
  let s:cterm_blue       = "110"
  let s:cterm_purple     = "139"
  let s:cterm_delbg      = "167"
endif

let s:palette.cterm.background = { 'dark' : "234"              , 'light' : "254" }
let s:palette.cterm.foreground = { 'dark' : s:cterm_foreground , 'light' : "16"  }
let s:palette.cterm.window     = { 'dark' : "236"              , 'light' : "247" }
let s:palette.cterm.selection  = { 'dark' : s:cterm_selection  , 'light' : "250" }
let s:palette.cterm.line       = { 'dark' : s:cterm_line       , 'light' : "252" }
let s:palette.cterm.system     = { 'dark' : s:cterm_system     , 'light' : "59"  }
let s:palette.cterm.red        = { 'dark' : s:cterm_red        , 'light' : "52"  }
let s:palette.cterm.orange     = { 'dark' : s:cterm_orange     , 'light' : "94"  }
let s:palette.cterm.yellow     = { 'dark' : s:cterm_yellow     , 'light' : "58"  }
let s:palette.cterm.green      = { 'dark' : s:cterm_green      , 'light' : "22"  }
let s:palette.cterm.aqua       = { 'dark' : s:cterm_aqua       , 'light' : "23"  }
let s:palette.cterm.blue       = { 'dark' : s:cterm_blue       , 'light' : "17"  }
let s:palette.cterm.purple     = { 'dark' : s:cterm_purple     , 'light' : "53"  }
let s:palette.cterm.darkcolumn = { 'dark' : "234"              , 'light' : "244" }
let s:palette.cterm.addbg      = { 'dark' : "65"               , 'light' : "194" }
let s:palette.cterm.addfg      = { 'dark' : "193"              , 'light' : "22"  }
let s:palette.cterm.changebg   = { 'dark' : "60"               , 'light' : "189" }
let s:palette.cterm.changefg   = { 'dark' : "189"              , 'light' : "53"  }
let s:palette.cterm.delbg      = { 'dark' : s:cterm_delbg      , 'light' : "224" }
let s:palette.cterm.darkblue   = { 'dark' : "17"               , 'light' : "194" }
let s:palette.cterm.darkcyan   = { 'dark' : "24"               , 'light' : "22"  }
let s:palette.cterm.darkred    = { 'dark' : "52"               , 'light' : "189" }
let s:palette.cterm.darkpurple = { 'dark' : "53"               , 'light' : "53"  }

"}}}
" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

"}}}
" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
function! s:build_prim(hi_elem, field)
  " Given a:hi_elem = bg, a:field = system
  let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_system
  let l:gui_assign = "gui".a:hi_elem."=".s:palette.gui[a:field][s:style] " guibg=...
  let l:cterm_assign = "cterm".a:hi_elem."=".s:palette.cterm[a:field][s:style] " ctermbg=...
  exe "let " . l:vname . " = ' " . l:gui_assign . " " . l:cterm_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
call s:build_prim('bg', 'foreground')
call s:build_prim('bg', 'background')
call s:build_prim('bg', 'selection')
call s:build_prim('bg', 'line')
call s:build_prim('bg', 'system')
call s:build_prim('bg', 'red')
call s:build_prim('bg', 'orange')
call s:build_prim('bg', 'yellow')
call s:build_prim('bg', 'green')
call s:build_prim('bg', 'aqua')
call s:build_prim('bg', 'blue')
call s:build_prim('bg', 'purple')
call s:build_prim('bg', 'window')
call s:build_prim('bg', 'darkcolumn')
call s:build_prim('bg', 'addbg')
call s:build_prim('bg', 'addfg')
call s:build_prim('bg', 'changebg')
call s:build_prim('bg', 'changefg')
call s:build_prim('bg', 'delbg')
call s:build_prim('bg', 'darkblue')
call s:build_prim('bg', 'darkcyan')
call s:build_prim('bg', 'darkred')
call s:build_prim('bg', 'darkpurple')

let s:fg_none = ' guifg=NONE ctermfg=NONE'
call s:build_prim('fg', 'foreground')
call s:build_prim('fg', 'background')
call s:build_prim('fg', 'selection')
call s:build_prim('fg', 'line')
call s:build_prim('fg', 'system')
call s:build_prim('fg', 'red')
call s:build_prim('fg', 'orange')
call s:build_prim('fg', 'yellow')
call s:build_prim('fg', 'green')
call s:build_prim('fg', 'aqua')
call s:build_prim('fg', 'blue')
call s:build_prim('fg', 'purple')
call s:build_prim('fg', 'window')
call s:build_prim('fg', 'darkcolumn')
call s:build_prim('fg', 'addbg')
call s:build_prim('fg', 'addfg')
call s:build_prim('fg', 'changebg')
call s:build_prim('fg', 'changefg')
call s:build_prim('fg', 'darkblue')
call s:build_prim('fg', 'darkcyan')
call s:build_prim('fg', 'darkred')
call s:build_prim('fg', 'darkpurple')

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

exe "let s:sp_none       = ' guisp=". s:none                            ."'"
exe "let s:sp_foreground = ' guisp=". s:palette.gui.foreground[s:style] ."'"
exe "let s:sp_background = ' guisp=". s:palette.gui.background[s:style] ."'"
exe "let s:sp_selection  = ' guisp=". s:palette.gui.selection[s:style]  ."'"
exe "let s:sp_line       = ' guisp=". s:palette.gui.line[s:style]       ."'"
exe "let s:sp_system     = ' guisp=". s:palette.gui.system[s:style]     ."'"
exe "let s:sp_red        = ' guisp=". s:palette.gui.red[s:style]        ."'"
exe "let s:sp_orange     = ' guisp=". s:palette.gui.orange[s:style]     ."'"
exe "let s:sp_yellow     = ' guisp=". s:palette.gui.yellow[s:style]     ."'"
exe "let s:sp_green      = ' guisp=". s:palette.gui.green[s:style]      ."'"
exe "let s:sp_aqua       = ' guisp=". s:palette.gui.aqua[s:style]       ."'"
exe "let s:sp_blue       = ' guisp=". s:palette.gui.blue[s:style]       ."'"
exe "let s:sp_purple     = ' guisp=". s:palette.gui.purple[s:style]     ."'"
exe "let s:sp_window     = ' guisp=". s:palette.gui.window[s:style]     ."'"
exe "let s:sp_addbg      = ' guisp=". s:palette.gui.addbg[s:style]      ."'"
exe "let s:sp_addfg      = ' guisp=". s:palette.gui.addfg[s:style]      ."'"
exe "let s:sp_changebg   = ' guisp=". s:palette.gui.changebg[s:style]   ."'"
exe "let s:sp_changefg   = ' guisp=". s:palette.gui.changefg[s:style]   ."'"
exe "let s:sp_darkblue   = ' guisp=". s:palette.gui.darkblue[s:style]   ."'"
exe "let s:sp_darkcyan   = ' guisp=". s:palette.gui.darkcyan[s:style]   ."'"
exe "let s:sp_darkred    = ' guisp=". s:palette.gui.darkred[s:style]    ."'"
exe "let s:sp_darkpurple = ' guisp=". s:palette.gui.darkpurple[s:style] ."'"

"}}}
" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
"   Conceal"
"   Cursor"
"   CursorIM"
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_foreground  .s:bg_delbg       .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
" exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_window      .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_system      .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
"   Incsearch"
exe "hi! LineNr"        .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! ModeMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
" exe "hi! MoreMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
"   PmenuSbar"
"   PmenuThumb"
exe "hi! Question"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_blue        .s:bg_darkblue    .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_darkcyan    .s:fmt_undr
exe "hi! SpellBad"      .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_darkpurple  .s:fmt_undr
exe "hi! StatusLine"    .s:fg_system      .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_system      .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
" FIXME LongLineWarning to use variables instead of hardcoding
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
"   WildMenu"

" Use defined custom background colour for terminal Vim.
if !has('gui_running') && exists("g:hybrid_custom_term_colors") && g:hybrid_custom_term_colors == 1
  let s:bg_normal = s:bg_none
else
  let s:bg_normal = s:bg_background
endif
exe "hi! Normal"        .s:fg_foreground  .s:bg_normal      .s:fmt_none

"}}}
" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_system      .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_green       .s:bg_none        .s:fmt_none
"   Character"
"   Number"
"   Boolean"
"   Float"

exe "hi! Identifier"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_yellow      .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_blue        .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"
"   Label"
exe "hi! Operator"        .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Keyword"
"   Exception"

exe "hi! PreProc"         .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"

exe "hi! Type"            .s:fg_orange      .s:bg_none        .s:fmt_none
"   StorageClass"
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Typedef"

exe "hi! Special"         .s:fg_green       .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
"
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_none

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_red         .s:bg_darkred     .s:fmt_undr

exe "hi! Todo"            .s:fg_addfg       .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"}}}
" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"   diffOldFile
"   diffNewFile
"   diffFile
"   diffOnly
"   diffIdentical
"   diffDiffer
"   diffBDiffer
"   diffIsA
"   diffNoEOL
"   diffCommon
hi! link diffRemoved Constant
"   diffChanged
hi! link diffAdded Special
"   diffLine
"   diffSubname
"   diffComment

"}}}
"
" This is needed for some reason: {{{

let &background = s:style

" }}}
" Legal:"{{{
" ----------------------------------------------------------------------------
" Copyright (c) 2011 Ethan Schoonover
" Copyright (c) 2009-2012 NanoTech
" Copyright (c) 2012 w0ng
" Copyright (c) 2018 shiftrot
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation files (the “Software”), to deal in the Soft‐
" ware without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software, and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice and this permission notice
" shall be included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

" }}}

" Modified: {{{
let s:palette.gui.black          = { 'dark' : "Black"       , 'light' : "Black" }
let s:palette.cterm.black        = { 'dark' : "0"           , 'light' : "0" }
let s:palette.gui.white          = { 'dark' : "White"       , 'light' : "White" }
let s:palette.cterm.white        = { 'dark' : "15"          , 'light' : "15" }
let s:palette.gui.difftext       = { 'dark' : "DarkGreen"   , 'light' : "#8080A0" }
let s:palette.cterm.difftext     = { 'dark' : "Brown"       , 'light' : "52"  }
let s:palette.gui.diffbg         = { 'dark' : "#5F875F"     , 'light' : "#d7ffd7" }
let s:palette.cterm.diffbg       = { 'dark' : "178"         , 'light' : "215" }
let s:palette.gui.Comment        = { 'dark' : s:gui_system  , 'light' : "Gray38" }
let s:palette.cterm.Comment      = { 'dark' : s:cterm_system, 'light' : "59" }
let s:palette.gui.Cursor         = { 'dark' : "Yellow"      , 'light' : "LimeGreen" }
let s:palette.cterm.Cursor       = { 'dark' : "Yellow"      , 'light' : "34" }
let s:palette.gui.CursorIM       = { 'dark' : "Red"         , 'light' : "IndianRed4" }
let s:palette.cterm.CursorIM     = { 'dark' : "Red"         , 'light' : "160" }
let s:palette.gui.Error          = { 'dark' : "Red3"        , 'light' : "Red3" }
let s:palette.cterm.Error        = { 'dark' : "160"         , 'light' : "124" }
let s:palette.gui.LineNr         = { 'dark' : "DarkGreen"   , 'light' : "LightSlateGray" }
let s:palette.cterm.LineNr       = { 'dark' : "58"          , 'light' : "246" }
let s:palette.gui.MatchParen     = { 'dark' : "DarkOrange3" , 'light' : "PaleGreen2" }
let s:palette.cterm.MatchParen   = { 'dark' : "143"         , 'light' : "221" }
let s:palette.gui.Number         = { 'dark' : "IndianRed3"  , 'light' : "OrangeRed4" }
let s:palette.cterm.Number       = { 'dark' : "160"         , 'light' : "124" }
let s:palette.gui.Search         = { 'dark' : "Khaki"       , 'light' : "Khaki" }
let s:palette.cterm.Search       = { 'dark' : "221"         , 'light' : "221" }
let s:palette.gui.IncSearch      = { 'dark' : "DarkOrange"  , 'light' : "Goldenrod2" }
let s:palette.cterm.IncSearch    = { 'dark' : "172"         , 'light' : "172" }
let s:palette.gui.Special        = { 'dark' : "OrangeRed3"  , 'light' : "Red3" }
let s:palette.cterm.Special      = { 'dark' : "160"         , 'light' : "124" }
let s:palette.gui.SpellLocal     = { 'dark' : "#8abeb7"     , 'light' : "#005f5f" }
let s:palette.cterm.SpellLocal   = { 'dark' : s:cterm_aqua  , 'light' : s:cterm_aqua }
let s:palette.gui.Title          = { 'dark' : "RoyalBlue"   , 'light' : "NavyBlue" }
let s:palette.cterm.Title        = { 'dark' : "38"          , 'light' : "17" }
let s:palette.gui.Underlined     = { 'dark' : "#80a0ff"     , 'light' : "SlateBlue3" }
let s:palette.cterm.Underlined   = { 'dark' : "31"          , 'light' : "61" }
let s:palette.gui.ZenkakuSpace   = { 'dark' : "#404040"     , 'light' : "Gray75" }
let s:palette.cterm.ZenkakuSpace = { 'dark' : "244"         , 'light' : "250" }

call s:build_prim('fg', 'black')
call s:build_prim('bg', 'black')
call s:build_prim('fg', 'white')
call s:build_prim('bg', 'white')
call s:build_prim('fg', 'difftext')
call s:build_prim('bg', 'diffbg')
call s:build_prim('fg', 'Comment')
call s:build_prim('bg', 'Cursor')
call s:build_prim('bg', 'CursorIM')
call s:build_prim('fg', 'Error')
call s:build_prim('bg', 'IncSearch')
call s:build_prim('fg', 'LineNr')
call s:build_prim('bg', 'MatchParen')
call s:build_prim('fg', 'Number')
call s:build_prim('bg', 'Search')
call s:build_prim('fg', 'Special')
call s:build_prim('fg', 'SpellLocal')
call s:build_prim('fg', 'Title')
call s:build_prim('fg', 'Underlined')
call s:build_prim('fg', 'ZenkakuSpace')

exe "hi! Comment"       .s:fg_Comment      .s:bg_none       .s:fmt_none
exe "hi! Constant"      .s:fg_red          .s:bg_none       .s:fmt_none
exe "hi! String"        .s:fg_green        .s:bg_none       .s:fmt_none
exe "hi! Number"        .s:fg_Number       .s:bg_none       .s:fmt_none
exe "hi! Identifier"    .s:fg_purple       .s:bg_none       .s:fmt_none
exe "hi! Function"      .s:fg_yellow       .s:bg_none       .s:fmt_none
exe "hi! Statement"     .s:fg_blue         .s:bg_none       .s:fmt_none
exe "hi! Operator"      .s:fg_aqua         .s:bg_none       .s:fmt_none
exe "hi! PreProc"       .s:fg_aqua         .s:bg_none       .s:fmt_none
exe "hi! Type"          .s:fg_orange       .s:bg_none       .s:fmt_none
exe "hi! Structure"     .s:fg_aqua         .s:bg_none       .s:fmt_none
exe "hi! Special"       .s:fg_Special      .s:bg_none       .s:fmt_none
exe "hi! Title"         .s:fg_Title        .s:bg_none       .s:fmt_none
exe "hi! Underlined"    .s:fg_Underlined   .s:bg_none       .s:fmt_undr

exe "hi! Cursor"        .s:fg_foreground   .s:bg_Cursor     .s:fmt_none
exe "hi! CursorIM"      .s:fg_foreground   .s:bg_CursorIM   .s:fmt_none
exe "hi! DiffText"      .s:fg_difftext     .s:bg_diffbg     .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_Error        .s:bg_white      .s:fmt_stnd
exe "hi! Error"         .s:fg_Error        .s:bg_none       .s:fmt_stnd
exe "hi! FoldColumn"                       .s:bg_none
exe "hi! IncSearch "    .s:fg_black        .s:bg_IncSearch  .s:fmt_undr
exe "hi! LineNr"        .s:fg_LineNr       .s:bg_none       .s:fmt_none
exe "hi! MatchParen"    .s:fg_black        .s:bg_MatchParen .s:fmt_none
exe "hi! ModeMsg"       .s:fg_green        .s:bg_none       .s:fmt_none
exe "hi! Search"        .s:fg_black        .s:bg_Search     .s:fmt_none
exe "hi! SpellLocal"    .s:fg_SpellLocal   .s:bg_darkcyan   .s:fmt_undr
exe "hi! SpellRare"     .s:fg_SpellLocal   .s:bg_darkpurple .s:fmt_undr
exe "hi! VertSplit"     .s:fg_window       .s:bg_system     .s:fmt_revr
exe "hi! WarningMsg"    .s:fg_Error        .s:bg_none       .s:fmt_none
exe "hi! ZenkakuSpace " .s:fg_ZenkakuSpace .s:bg_none       .s:fmt_undr
hi! link WildMenu Search

if exists("$APPBASE")
  exe "hi! Normal"                  .s:fg_foreground .s:bg_none .s:fmt_none
  let s:palette.cterm.italic = { 'dark' : "237", 'light' : "252"  }
  let s:cterm_italic = " ctermbg=".s:palette.cterm['italic'][s:style]
  exe "hi! htmlItalic"              .s:cterm_italic  .s:fmt_none
  exe "hi! htmlBoldItalic"          .s:cterm_italic  .s:fmt_bold
  exe "hi! htmlUnderlineItalic"     .s:cterm_italic  .s:fmt_undr
  exe "hi! htmlBoldUnderlineItalic" .s:cterm_italic  .s:fmt_undb
endif

" }}}

let g:colors_name = "mycolor"

if !has('gui_running') && &bg == 'dark' && exists('$APPBASE')
  exe "hi! Normal" .s:fg_foreground .s:bg_normal .s:fmt_none
endif

finish

" " green
" let s:palette.gui.base0   = { 'dark' : "#10af10"      , 'light' : "#005f00" }
" let s:palette.cterm.base0 = { 'dark' :  "28"          , 'light' : "22" }
" " red
" let s:palette.gui.base1   = { 'dark' : "OrangeRed3"   , 'light' : "Red3" }
" let s:palette.cterm.base1 = { 'dark' : "160"          , 'light' : "124" }
" " aqua
" let s:palette.gui.base2   = { 'dark' : "#8abeb7"      , 'light' : "#005f8f" }
" let s:palette.cterm.base2 = { 'dark' : s:cterm_aqua   , 'light' : "23"  }
" " brown
" let s:palette.gui.base3   = { 'dark' : "SaddleBrown"  , 'light' : "#6b2503" }
" let s:palette.cterm.base3 = { 'dark' : "Brown"        , 'light' : "52"  }
" " blue
" let s:palette.gui.base4   = { 'dark' : "RoyalBlue"    , 'light' : "#00005f" }
" let s:palette.cterm.base4 = { 'dark' : "27"           , 'light' : "17" }
" " magenta
" let s:palette.gui.base5   = { 'dark' : "Magenta3"     , 'light' : "DarkMagenta" }
" let s:palette.cterm.base5 = { 'dark' : "164"          , 'light' : "162"  }
" " gold
" let s:palette.gui.base6   = { 'dark' : "#8f8f00"      , 'light' : "#8f8f00" }
" let s:palette.cterm.base6 = { 'dark' :  "100"         , 'light' : "58" }
" " light brown
" let s:palette.gui.base7   = { 'dark' : "#be733f"      , 'light' : "#825b00" }
" let s:palette.cterm.base7 = { 'dark' : s:cterm_orange , 'light' : "94"  }
" " purple
" let s:palette.cterm.base8 = { 'dark' : s:cterm_purple , 'light' : "53" }
" let s:palette.gui.base8   = { 'dark' : "#b294bb"      , 'light' : "#5f005f" }
" " light green
" let s:palette.gui.base9   = { 'dark' : "YellowGreen"  , 'light' : "#579f00" }
" let s:palette.cterm.base9 = { 'dark' : "41"          , 'light' : "34" }
"
" call s:build_prim('fg', 'base0')
" call s:build_prim('fg', 'base1')
" call s:build_prim('fg', 'base2')
" call s:build_prim('fg', 'base3')
" call s:build_prim('fg', 'base4')
" call s:build_prim('fg', 'base5')
" call s:build_prim('fg', 'base6')
" call s:build_prim('fg', 'base7')
" call s:build_prim('fg', 'base8')
" call s:build_prim('fg', 'base9')
"
" " Test:"{{{
" exe "hi! base0" .s:fg_base0 .s:bg_none .s:fmt_none
" exe "hi! base1" .s:fg_base1 .s:bg_none .s:fmt_none
" exe "hi! base2" .s:fg_base2 .s:bg_none .s:fmt_none
" exe "hi! base3" .s:fg_base3 .s:bg_none .s:fmt_none
" exe "hi! base4" .s:fg_base4 .s:bg_none .s:fmt_none
" exe "hi! base5" .s:fg_base5 .s:bg_none .s:fmt_none
" exe "hi! base6" .s:fg_base6 .s:bg_none .s:fmt_none
" exe "hi! base7" .s:fg_base7 .s:bg_none .s:fmt_none
" exe "hi! base8" .s:fg_base8 .s:bg_none .s:fmt_none
" exe "hi! base9" .s:fg_base9 .s:bg_none .s:fmt_none
"
" " }}}
