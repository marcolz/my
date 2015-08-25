" The set nocompatible setting makes vim behave in a more useful way (the default) than the vi-compatible manner.
" http://www.linuxfromscratch.org/lfs/view/development/chapter06/vim.html
" set nocompatible

" https://github.com/tpope/vim-pathogen
call pathogen#infect()

set cursorline
set expandtab
set tabstop=2
set shiftwidth=2

" To highlight all search matches
set hlsearch

" Not needed in MacVim but needed in simple vim
set paste

filetype plugin on

" configure Vim so that it sets the working directory to the current file's directory
" http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
autocmd BufEnter * lcd %:p:h

" This will check the current folder for tags file and keep going one directory up all the way to the root folder.
" SO you can be in any sub-folder in your project and it'll be able to find the tags files.
" http://stackoverflow.com/questions/5017500/vim-difficulty-setting-up-ctags-source-in-subdirectories-dont-see-tags-file-in
set tags=tags;/

" Disable the bell in MacVim
set vb

" https://github.com/vim-scripts/VimClojure
syntax on
filetype plugin indent on

au BufNewFile,BufRead *.css set tabstop=2 shiftwidth=2 autoindent
au BufNewFile,BufRead *.scss set tabstop=2 shiftwidth=2 autoindent

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" This shows what you are typing as a command.  I love this!
set showcmd

" colorcolumn only for actual code please (no HTML or CSS files)
au BufNewFile,BufRead *.rb set colorcolumn=80
au BufNewFile,BufRead *.js set colorcolumn=80
au FileType gitcommit set colorcolumn=50,72

" the default red doesnt play well with certain syntax highlighters
highlight ColorColumn ctermbg=LightRed guibg=LightRed

" http://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
set smartcase

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
