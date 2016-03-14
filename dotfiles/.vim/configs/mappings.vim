let mapleader = "\<Space>"

"Arrow keys
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

"Disable mouse wheel
"augroup scroll
"au!
"    au  VimEnter * :silent !synclient VertEdgeScroll=0
"    au  VimLeave * :silent !synclient VertEdgeScroll=1
"augroup END
map <ScrollWheelUp> <nop>
map <S-ScrollWheelUp> <nop>
map <ScrollWheelDown> <nop>
map <S-ScrollWheelDown> <nop>

"Tabs
nmap <leader>t :tabnew<Space>
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
imap <C-S-Tab> <ESC>:tabprevious<CR>
imap <C-Tab> <ESC>:tabnext<CR>

"Upper or lowercase the current word
nmap <leader>u gUiW
nmap <leader>l guiW
"I hate using ~ key, so hard to press!
nmap <leader>s ~

"Buffers
nmap <leader>ls :ls<CR>
nmap <leader>ls! :ls!<CR>

"Handy trick.
nnoremap ; :

"File finding.
nnoremap <leader>f :find 
nnoremap <leader>sf :sfind 
nnoremap <leader>vf :vert sfind 
nnoremap <leader>tf :tabfind 

"mapping for split screen
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"Quick vim mappings
:nnoremap <leader>ev :vsplit $MYVIMRC<CR>
:nnoremap <leader>es :vsplit ~/.vim/configs/settings.vim<CR>
:nnoremap <leader>em :vsplit ~/.vim/configs/mappings.vim<CR>
:nnoremap <leader>ep :vsplit ~/.vim/configs/plugins.vim<CR>
:nnoremap <leader>ea :vsplit ~/.vim/configs/abbrev.vim<CR>
:nnoremap <leader>sv :source $MYVIMRC<CR>

"Turn on spell checking for text files.
"autocmd BufRead,BufNewFile * if *.txt | *.blah setlocal spl=en_us spell endif

"Plugin mappings
nmap <leader>nt :NERDTree<CR>


