" Make the future brighter
set nocompatible

" https://github.com/tpope/vim-pathogen
call pathogen#infect()

" Some default stuff
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2

" Highlight all search matches
set hlsearch

" Some more default stuff
filetype plugin on
filetype plugin indent on

set autoindent

" Set the working directory to the current file's
" http://superuser.com/questions/195022
autocmd BufEnter * lcd %:p:h

" Search recursively for the `tags` file
" http://stackoverflow.com/questions/5017500
set tags=tags;/

" Disable the bell in MacVim
set vb

" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=light
colorscheme solarized

" File extension specific stuff
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.jsx set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.css set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.scss set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au FileType gitcommit set colorcolumn=50,72

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Show what you are typing as a command. I love this!
set showcmd

" The default red doesn't play well with certain syntax highlighters
highlight ColorColumn ctermbg=LightRed guibg=LightRed

" Allow for case insensitive searches
" http://stackoverflow.com/questions/2287440
set smartcase

" Be syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
