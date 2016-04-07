"Turn on matchit for html.
runtime macros/matchit.vim

"NerdTree mappings and settings
"Make it easier to bring up Nerd Tree.
nmap <leader>nt :NERDTree<CR>

"Airline mapping and settings.
"Plugin Airline requires these settings.
set encoding=utf-8
nmap <leader>a :AirlineToggle<CR>
"To view value of let, do :let <variable>
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%F[b%n]%y %h%m%r%w'
let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%#__accent_bold#  %l%#__restore__#%#__restore__#.%v of %L Line(s)'
let g:airline_theme='luna'

"Powerline
"set rtp+=$HOME/.local/lib/python3.4/site-packages/powerline/bindings/vim/
"Always show statusline
"set laststatus=2
"Use 256 colours (Use this setting only if your terminal supports 256 colours)
"set t_Co=256

"pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
"let g:pydiction_menu_height = 3

"let g:flake8_cmd='~/.local/lib/python3.4/site-packages/flake8/'

"Disables pathogen plugins.
let g:pathogen_disabled = ['']
if has('win32unix') || has('win32')
    let g:pathogen_disabled = ['vim-airline']
endif
execute pathogen#infect()
