" https://github.com/tpope/vim-pathogen
call pathogen#infect()

" The set nocompatible setting makes vim behave in a more useful way (the default) than the vi-compatible manner.
" http://www.linuxfromscratch.org/lfs/view/development/chapter06/vim.html
set nocompatible

set cursorline
set expandtab
set tabstop=2
set shiftwidth=2

syntax enable

" To highlight all search matches
set hlsearch

filetype plugin on
filetype plugin indent on

set autoindent

" configure Vim so that it sets the working directory to the current file's directory
" http://superuser.com/questions/195022
autocmd BufEnter * lcd %:p:h

" This will check the current folder for tags file and keep going one directory up all the way to the root folder.
" SO you can be in any sub-folder in your project and it'll be able to find the tags files.
" http://stackoverflow.com/questions/5017500
set tags=tags;/

" Disable the bell in MacVim
set vb

au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.css set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.scss set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.jsx set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
au BufNewFile,BufRead *.py set tabstop=2 shiftwidth=2 colorcolumn=80,100 expandtab
" au FileType gitcommit set colorcolumn=50,72
au FileType gitcommit set colorcolumn=72 " Yerdle

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" This shows what you are typing as a command.  I love this!
set showcmd

" the default red doesnt play well with certain syntax highlighters
highlight ColorColumn ctermbg=LightRed guibg=LightRed

" http://stackoverflow.com/questions/2287440
set smartcase

map <C-n> :NERDTreeToggle<CR>
