" Declarations\
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:airline_powerline_fonts = 1 " Vim devicons for powerline
let g:deoplete#enable_at_startup= 1 " Start deoplete at startup
let g:jsx_ext_required = 0
let g:mkdp_path_to_chrome = "chromium" " Open Markdown preview in chromium
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_virtualenv = 1
let g:ropevim_vim_completion=0
let g:sneak#label = 1 " Show labels while using sneak
"  "let g:syntastic_disabled_filetypes=['python']
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['javascript'], 'passive_filetypes': [] }

syntax on
nmap <F8> :TagbarToggle<CR>
cabbr <expr> %% expand('%:p:h')

set tabstop=4
set shiftwidth=4
set expandtab

set colorcolumn=80
set encoding=utf8
set ignorecase smartcase
set number
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.git/*,*/node_modules/*,*/bower_components/*

autocmd BufWritePost *.py call Flake8()
autocmd BufNewFile,BufRead *.cap   set syntax=ruby
autocmd BufNewFile,BufRead Pipfile set filetype=toml
autocmd BufNewFile,BufRead *.json,Pipfile.lock set syntax=javascript
autocmd BufWritePre * :%s/\s\+$//e "Trim the line endings

au BufNewFile,BufReadPost *.coffee,*.rb,*.yml,*.yaml,*.js,*.jsx,*.jade,*.pug,*.scss.*.scm setl tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.emblem,*.haml,*.py,*.coffee,*.jade set foldmethod=indent
au BufNewFile,BufReadPost *.html,*.c setl tabstop=4 shiftwidth=4 expandtab


call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Quramy/vison'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/MatchTagAlways'
Plug 'airblade/vim-gitgutter'
Plug 'brooth/far.vim'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cstrahan/vim-capnp'
Plug 'dsawardekar/ember.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
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
Plug 'leafgarland/typescript-vim'
Plug 'leshill/vim-json'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nvie/vim-flake8'
Plug 'othree/html5.vim'
Plug 'othree/xml.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/asyncrun.vim'
Plug 'sukima/xmledit'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'wakatime/vim-wakatime'
Plug 'yalesov/vim-emblem'

" Trigger configuration (Optional)
" let g:UltiSnipsExpandTrigger="<C-l>"
"
" Initialize plugin system
call plug#end()


" Post Plugin stuff
colorscheme onedark
