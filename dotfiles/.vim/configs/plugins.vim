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

"Disables pathogen plugins.
let g:pathogen_disabled = ['']
"let g:pathogen_disabled = ['vim-airline']
execute pathogen#infect()
