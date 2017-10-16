" USER ~/.vimrc

execute pathogen#infect()

set nocompatible
set nomodeline " FreeBSD reports possible vulnerability issue
set encoding=utf-8
set ffs=unix,dos,mac
" set number
set background=dark
" set wrap
set showmode
set softtabstop=2
set shiftwidth=2
set smarttab
set ruler
set incsearch
set hlsearch
set foldmethod=syntax
set showbreak="+ "
set laststatus=2
set scrolloff=4
set backspace=indent,eol,start
set statusline=[%02.2n]\ %F\ %y\ %m%r%h%=Line\:\ %0004.4l/%0004.4L\ (%003.3p%%)\ \ Col\:\ %0003.3c
set wildchar=<Tab> wildmenu wildmode=full

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:sysntastic_always_polulate_loc_list = 1
let g:sysntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:systastic_check_on_wq = 0

syntax on
set t_Co=256
colo playtime

filetype indent on
filetype plugin indent on

" inoremap <BS> <c-r>=Backspace()<CR>

highlight Cursor guifg=#22201d guibg=#bab8b4
set guicursor+=a:blinkon0

" General Colours : The colour theme is designed to work with 
" my 'Playtime' colour scheme I may at some point evovle the
" colours into an actual vim syntax theme.

hi Normal	    ctermfg=7
hi CursorColumn	    ctermbg=6
hi Cursor	    ctermbg=6
hi CursorLine	    ctermbg=6
hi FoldColumn	    ctermfg=7 ctermbg=8
hi Folded	    ctermfg=7 ctermbg=8
hi NonText	    ctermfg=6
hi Pmenu	    ctermfg=14 ctermbg=8
hi PmenuSel	    ctermfg=14
hi PmenuSBar	    ctermfg=8
hi PmenuThumb	    ctermfg=8
hi Search	    ctermfg=0 ctermbg=7
hi IncSearch	    ctermfg=0 ctermbg=7
hi SignColumn	    ctermbg=8
hi SpecialKey	    ctermbg=8
hi StatusLineNC	    ctermfg=8 ctermbg=7
hi StatusLine	    ctermfg=8 ctermbg=7
hi TabLine	    ctermfg=fg ctermbg=8
hi TabLineFill	    ctermfg=fg ctermbg=8
hi VertSplit	    ctermfg=8 ctermbg=7
hi Visual	    ctermfg=15 ctermbg=1
hi VisualNOS	    ctermfg=1 ctermbg=7
hi WildMenu	    ctermfg=3 ctermbg=6

" Syntax Highlighting

hi Comment	    ctermfg=8
hi Constant	    ctermfg=3
hi Error	    ctermfg=7 ctermbg=1
hi ErrorMsg	    ctermfg=7 ctermbg=1
hi Identifier	    ctermfg=8
hi Ignore	    ctermfg=6
hi LineNr	    ctermfg=8
hi MatchParen	    ctermfg=15 ctermbg=1
hi Number	    ctermfg=3
hi Statement	    ctermfg=6
hi Preproc	    ctermfg=9
hi Type		    ctermfg=2
hi Special	    ctermfg=5
hi Todo		    ctermfg=1
hi Underlined	    ctermfg=11
hi Label	    ctermfg=2
hi Operator	    ctermfg=12
hi ErrorMsg	    ctermfg=15 ctermbg=1
hi WarningMsg	    ctermfg=9
hi ModeMsg	    ctermfg=15
hi MoreMsg	    ctermfg=1
hi title	    ctermfg=12 ctermbg=0
hi DiffChange	    ctermfg=15
hi DiffText	    ctermfg=15
hi DiffAdd	    ctermfg=15
hi DiffDelete	    ctermfg=15
hi cIf0		    ctermfg=9
hi SpellBad	    ctermfg=14 ctermbg=1
hi SpellCap	    ctermfg=6
