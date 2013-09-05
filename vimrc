" General settings -----------------------------------------------------------------------------------------------------

" call pathogen#infect()

" No vi compatibility
"set nocompatible

" Share clipboard with the system
set clipboard+=unnamedplus

" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/vimbuffer<CR>
" " paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

map <C-w> :NERDTreeToggle %:p<CR>
vmap <C-w> :NERDTreeToggle %:p<CR>
nmap <C-w> :NERDTreeToggle %:p<CR>
" Fancy menus
"set wildmenu
"set wildmode=longest,list

set showcmd

" Show the status bar at the bottom
"set laststatus=1

" Show the line and column number of the cursor position
"set ruler
"set rulerformat=%40(%=%l:%03c\ %t%H%R%M\ %w%y%)

" Do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set mouse=a
set encoding=UTF-8

" Wraps around words and not letters
set linebreak
set nowrap

" File formats priority:
set fileformats=unix,dos,mac

" Edition
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set smarttab

set autoindent
"set cindent
" et cinkeys=0{,0},:,0#,!,!^F
"set cinoptions=
"imap <Tab> <C-F>
" imap <S-Tab> <C-I>
set wildignore=*.swp,*.bak,*.pyc,*.pyo,*.class,*.beam,*.hi,*.o

" add color column divier
set colorcolumn=120

"set visualbell
"set noerrorbells
" set title

" set the backup dir to declutter working directory.
" two ending slashes means, full path to the actual filename
" -- thanks to indygemma
silent! !mkdir -p ~/.vim/backup
silent! !mkdir -p ~/.vim/swap
silent! !mkdir -p ~/.vim/undo

set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undofile
set undodir=~/.vim/undo/

" Folding
"set foldmethod=manual
"set nofoldenable

" GUI only options -----------------------------------------------------------------------------------------------------
if has('gui_running')
    set guioptions=meAcr
    set cursorline
    set cursorcolumn
    if has('gui_gtk')
        set guifont=Menlo\ 10
    elseif has('gui_macvim')
        " set guifont=Menlo:h12
        set guifont=Akkurat-Mono:h14
        set fuoptions=maxhorz,maxvert
        nmap <SwipeLeft> gT
        nmap <SwipeRight> gt
    endif
else
"    set t_Co=256
endif

syntax on
"set background=light
" let g:solarized_degrade = 0
" let g:solarized_italic = 1
"let g:solarized_bold = 1
"let g:solarized_termtrans = 1
"let g:solarized_underline = 1
"let g:solarized_termcolors = 256
" either normal, high or low
"let g:solarized_contrast = "high"
"let g:solarized_visibility="low"
" colorscheme solarized
" hi link WildMenu PMenu

" Diff -----------------------------------------------------------------------------------------------------------------
"if &diff
"    set nofoldenable
"    set scrollbind
"    set scrollopt=hor,ver
"    set number
"end

" Printing -------------------------------------------------------------------------------------------------------------
"set printencoding=UTF-8
"set printfont=:h8
"set printoptions=number:y;syntax:n

" Colors and Schemes ---------------------------------------------------------------------------------------------------
filetype plugin indent on
"nmap <SILENT> <F5> :syn sync fromstart<CR>
"set listchars=tab:»·,extends:+,precedes:<,nbsp:~,trail:·,eol:¬
"map <F4> :set list!<CR>

" Search ---------------------------------------------------------------------------------------------------------------
"set nohlsearch
"set ignorecase
"map <F3> :set hlsearch!<CR>

" Plugins configuration ------------------------------------------------------------------------------------------------

" enhanced commentify
"vmap <SILENT> <LocalLeader>c <Plug>VisualTraditional
"nmap <SILENT> <LocalLeader>c <Plug>Traditional
"let g:EnhCommentifyBindInInsert = 'Yes'
"let g:EnhCommentifyMultiPartBlocks = 'Yes'
"let g:EnhCommentifyPretty = 'Yes'
"let g:EnhCommentifyRespectIndent = 'Yes'
"let g:EnhCommentifyUseBlockIndent = 'Yes'
"function EnhCommentifyCallback(ft)
"  if a:ft == 'erlang'
"		let b:ECcommentOpen = '%'
"		let b:ECcommentClose = ''
"  endif
"endfunction
"let g:EnhCommentifyCallbackExists = 'Yes'

" a
"let g:alternateExtensions_m = "h"
"let g:alternateExtensions_h = "c"

" rails
"let g:rails_menu = 0
"let g:mappings = 0

" erlang
"let g:erlangHighlightBif = 1

" vim2hs
"let g:haskell_conceal_wide = 0
"let g:haskell_hsp = 0
" let g:haskell_tabular = 0
"
" neo completion
"let g:neocomplcache_enable_at_startup = 1

" Syntax Highlight -----------------------------------------------------------------------------------------------------
"nmap <S-F5> :call DumpSyntaxItem()<CR>

" Spelling -------------------------------------------------------------------------------------------------------------
"set spell spelllang=en_us
"set nospell
"map <S-F2> :set spell!<CR>

"map <F12> :vsplit<CR>
"map <F11> :split<CR>

set pastetoggle=<F2>

" Wrapping on/off ------------------------------------------------------------------------------------------------------
"map <F6> :set wrap!<CR>

" Default to ack instead of grep ---------------------------------------------------------------------------------------
"set grepprg=ack-grep
"set grepformat=%f:%l:%m

"set colorcolumn=120
"set textwidth=120

" Local settings
"let HOST_SETTINGS = $HOME . '/.settings/vim.config/hosts/' . split(hostname(), '\.')[0] . '.vim'
"if filereadable(HOST_SETTINGS)
"    execute 'source '.HOST_SETTINGS
"endif

if exists("b:trim_white_spaces_loaded")
  finish
endif
let b:trim_white_spaces_loaded = 1

function! <SID>TrimWhiteSpace()
    let row = line('.')
    let col = col('.')
    silent! %s/\s*$//  " remove trailing whitespace
    silent! %s/\n\{3,}/\r\r/e  " condense consecutive blank lines
    call cursor(row, col)
endfunction

autocmd BufWritePre <buffer> :call <SID>TrimWhiteSpace()
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

set t_Co=256
" Default colorscheme
"colorscheme jellybeans

highlight NonText ctermfg=DarkMagenta
highlight SpecialKey ctermfg=DarkMagenta
highlight ColorColumn ctermbg=53 guibg=#662244
set nu

"Pathogen
"execute pathogen#infect()
"call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on
