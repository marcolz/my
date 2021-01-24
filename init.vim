call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-syntastic/syntastic'
call plug#end()

set expandtab
set tabstop=2
set shiftwidth=2
set colorcolumn=80,100

" https://github.com/neoclide/coc.nvim
set hidden
set nobackup
set nowritebackup
" https://github.com/neoclide/coc.nvim/issues/549#issuecomment-473999207
set noswapfile
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
" set autochdir

nmap <silent> \|\| <Plug>(coc-diagnostic-prev)
nmap <silent> \\ <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remove any trailing whitespaces
autocmd BufWritePre * if ! &bin | silent! %s/\s\+$//ge | endif

map <C-n> :NERDTreeToggle<CR>
" https://superuser.com/a/567013
" map <C-n> :NERDTreeToggle %<CR>
" https://stackoverflow.com/questions/7239192
let NERDTreeQuitOnOpen=1

nnoremap <silent> <leader>f :GFiles<CR>

" https://github.com/altercation/vim-colors-solarized
" https://github.com/vim-airline/vim-airline-themes
set background=light
colorscheme solarized

au FileType gitcommit set colorcolumn=72
