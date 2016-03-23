let mapleader = "\<Space>"
"Arrow keys
noremap <down> ddp
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> ddkP
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>
noremap <ScrollWheelUp> <nop>
noremap <S-ScrollWheelUp> <nop>
noremap <ScrollWheelDown> <nop>
noremap <S-ScrollWheelDown> <nop>

"Tabs
nnoremap <leader>t :tabnew<Space>
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>
noremap <C-S-Tab> :tabprevious<CR>
noremap <C-Tab> :tabnext<CR>
inoremap <C-S-Tab> <ESC>:tabprevious<CR>
inoremap <C-Tab> <ESC>:tabnext<CR>

"Upper or lowercase the current word
nnoremap <leader>u gUiW
nnoremap <leader>l guiW

"I hate using ~ key, so hard to press!
nnoremap <leader>s ~s

"Insert lines without being in INSERT mode.
nnoremap <leader>o o<ESC>k
nnoremap <leader>O O<ESC>j

"Paste from yank registers
noremap yp "0p
noremap yP "0P

"Clear last search.
nnoremap <CR> :nohlsearch<CR>/<BS>

"Esc is so far away without this mapping.
inoremap jj <Esc>

"Buffers
nnoremap <leader>ls :ls<CR>
nnoremap <leader>ls! :ls!<CR>

"Move between Buffers
noremap <left> :bp<CR>
noremap <right> :bn<CR>

"File finding.
nnoremap <leader>f :find
nnoremap <leader>sf :sfind
nnoremap <leader>vf :vert sfind
nnoremap <leader>tf :tabfind

"mapping for split screen
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

"Quick vim mappings
nnoremap <leader>vv :vsplit $MYVIMRC<CR>
nnoremap <leader>vvs :vsplit ~/.vim/configs/settings.vim<CR>
nnoremap <leader>vvm :vsplit ~/.vim/configs/mappings.vim<CR>
nnoremap <leader>vvp :vsplit ~/.vim/configs/plugins.vim<CR>
nnoremap <leader>vvf :vsplit ~/.vim/configs/functions.vim<CR>
nnoremap <leader>vva :vsplit ~/.vim/configs/abbrev.vim<CR>
nnoremap <leader>vvl :vsplit ~/.vim/configs/local.vim<CR>

":nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

"Automatically reload vimrc and it's supporting files when they save.
augroup auto_load_vimrc
    autocmd!
    autocmd BufWritePost .vimrc so ~/.vimrc
    autocmd BufWritePost settings.vim so ~/.vimrc
    autocmd BufWritePost mappings.vim so ~/.vimrc
    autocmd BufWritePost plugins.vim so ~/.vimrc
    autocmd BufWritePost functions.vim so ~/.vimrc
    autocmd BufWritePost abbrev.vim so ~/.vimrc
    autocmd BufWritePost local.vim so ~/.vimrc
    autocmd BufWritePost local.vim so ~/.vimrc
augroup END

"Remove all trailing whitespaces in the file.
augroup strip_trailing_whitespaces
    autocmd!
    autocmd BufWritePre * call Preserve("%s/\\s\\+$//e")
    "autocmd BufWritePre * call Preserve(":g/^$/d")
augroup END

"Turn on spell checking for text files.
"autocmd BufRead,BufNewFile * if *.txt | *.blah setlocal spl=en_us spell endif






