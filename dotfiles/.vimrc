"Enable filetype plugins.
set statusline=%<%F[b%n]%y\ %h%m%r%w\%=%-20.(%P\ 0x%B\ %l\.%c\ \of\ %L\ Line(s)%)
:filetype plugin on
:filetype on

source ~/.vim/configs/functions.vim
source ~/.vim/configs/settings.vim
source ~/.vim/configs/mappings.vim
source ~/.vim/configs/plugins.vim
source ~/.vim/configs/abbrev.vim
if !empty(glob("~/.vim/configs/local.vim"))
    source ~/.vim/configs/local.vim
endif
