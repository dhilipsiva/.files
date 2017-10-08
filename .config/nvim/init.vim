call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'brooth/far.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dsawardekar/ember.vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'garbas/vim-snipmate'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nvie/vim-flake8'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/asyncrun.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'yalesov/vim-emblem'

" Initialize plugin system
call plug#end()

" Declarations\
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:airline_powerline_fonts = 1 " Vim devicons for powerline
let g:deoplete#enable_at_startup= 1 " Start deoplete at startup
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_underscore_arrow_function = "🞅"
let g:mkdp_path_to_chrome = "chromium" " Open Markdown preview in chromium
let g:ropevim_vim_completion=1
let g:sneak#label = 1 " Show labels while using sneak

set conceallevel=1
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set number
set smartcase

colorscheme onedark
nmap <F8> :TagbarToggle<CR>
syntax on
autocmd BufWritePre * :%s/\s\+$//e "Trim the line endings
