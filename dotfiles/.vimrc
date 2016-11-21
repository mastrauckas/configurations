"Enable filetype plugins.
set statusline=%<%F[b%n]%y\ %h%m%r%w\%=%-20.(%P\ 0x%B\ %l\.%c\ \of\ %L\ Line(s)%)
:filetype plugin on
:filetype on

source ~/.vim/configs/.vim_functions.vim
source ~/.vim/configs/.vim_settings.vim
source ~/.vim/configs/.vim_mappings.vim
source ~/.vim/configs/.vim_plugins.vim
source ~/.vim/configs/.vim_abbrev.vim
if !empty(glob("~/.vim/configs/.vim_local.vim"))
    source ~/.vim/configs/.vim_local.vim
endif
