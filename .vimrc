" The set nocompatible setting makes vim behave in a more useful way (the default) than the vi-compatible manner.
" http://www.linuxfromscratch.org/lfs/view/development/chapter06/vim.html
" set nocompatible

" https://github.com/tpope/vim-pathogen
call pathogen#infect()

set cursorline
" Adjuect cursorline colors - not nice in plain 'vim'
" hi CursorLine term=none cterm=none ctermbg=3

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

" To highlight all search matches
set hlsearch

" Not needed in MacVim but needed in simple vim
set paste

" Looks like this is required to enable pluging (http://0xfe.blogspot.com/2011/03/editing-xml-and-html-in-vim.html)
filetype plugin on

" configure Vim so that it sets the working directory to the current file's directory
" http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
autocmd BufEnter * lcd %:p:h

" This will check the current folder for tags file and keep going one directory up all the way to the root folder.
" SO you can be in any sub-folder in your project and it'll be able to find the tags files.
" http://stackoverflow.com/questions/5017500/vim-difficulty-setting-up-ctags-source-in-subdirectories-dont-see-tags-file-in
set tags=tags;/

" Attempt to disable the bell http://en.wikibooks.org/wiki/DisablingBells/MacVim
set vb

" https://github.com/vim-scripts/VimClojure
syntax on
filetype plugin indent on

" Set PHP syntax for .phtml files (http://beerpla.net/2008/04/02/how-to-add-a-vim-file-extension-to-syntax-highlighting/)
au BufNewFile,BufRead *.phtml set filetype=php tabstop=4 shiftwidth=4
" Set just a different indentation style for PHP script files
au BufNewFile,BufRead *.php set tabstop=4 shiftwidth=4

au BufNewFile,BufRead *.css set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.scss set tabstop=2 shiftwidth=2

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" This shows what you are typing as a command.  I love this!
set showcmd

" colorcolumn only for actual code please (no HTML or CSS files)
au BufNewFile,BufRead *.rb set colorcolumn=80
au BufNewFile,BufRead *.php set colorcolumn=80
au BufNewFile,BufRead *.js set colorcolumn=80
au BufNewFile,BufRead *.clj set colorcolumn=80

" http://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
set smartcase

" https://github.com/vexxor/phpdoc.vim/blob/master/plugin/php-doc.vim
" imap <C-o> :exe PhpDoc()<CR>i

" https://github.com/jpalardy/vim-slime
" let g:slime_target = "tmux"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" http://kuriqoo.blogspot.it/2011/02/using-clojure-in-vim.html
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1
