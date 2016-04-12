"Not really need because Vim will do this if you have a .vimrc file.
set nocompatible

set path=.,**

"Can't we all just get along?
set fileformats=unix,dos,mac

"Enable filetype-specific indenting
filetype indent on

"Backup information
set backup
set writebackup
set backupcopy=auto
set backupext=.bk
set backupdir=~/.vim/vim_backup
set dir=~/.vim/vim_swp

"Put line numbers in.
:set number
:set relativenumber

"Shut off spell checking.
"Later we turn it on for certain
"filetype.
set spl=en_us spell
set nospell

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

"I like 4 spaces for indenting
set shiftwidth=4

"I like 4 stops
set tabstop=4

"tabs are spaces
set expandtab

"Copy indent from previous line.
set copyindent

"Round indent to multiple of 'shiftwidth'
set shiftround

"Do smart indenting when starting a new line
set smartindent

"Copy indent from current line, over to the new line
set autoindent

"Show last command bottm  right corner of vim
set showcmd

"Highlight current line.
"set cursorline
":highlight CursorLine ctermbg=LightBlue

"Show matching stuff like ()
set showmatch

"How many lines to the top my cursor is
set scrolloff=10

"Keep 5 lines left/right
set sidescrolloff=5

"Show line number on bar.
"set ruler
"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

"Fold things.
set foldmethod=indent

"max level fold. Default is 20 but setting it anyhow.
set foldnestmax=20

"Make sure we don't fold by default.
set nofoldenable

"Not sure if this matters with foldmethod=ident
set foldlevel=1

"Allow backspacing
"In help, must look under :h 'backspace'
set backspace=2

"Ignores cases on searches.
set ignorecase

"Overrides 'ignorecase' search word has
"upper case characters
set smartcase

"Highlights words that mart search.
set hlsearch

"Show results as typing
set incsearch

"Change to directory of file when opening file.
set autochdir

"Hide buffer.
set hidden

"Remember lots of history.
set history=5000

"Remember lots of undo.
set undolevels=5000

"Put a title.
set title

"Only set this when I want to see whitespaces, tabs etc.
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.,eof:$

"Turn paste mode on and off when pasting code
"from outside VIM.
set pastetoggle=<F2>

"The hight of command prompt.
set cmdheight=2

"Use bash as the shell.
set shell=bash

set laststatus=2

"Tell vim using dark background
set background=dark

"Custom status line.
set statusline=%<%F[b%n]%y\ %h%m%r%w\%=%-20.(%P\ 0x%B\ %l\.%c\ \of\ %L\ Line(s)\ \ \ %)


