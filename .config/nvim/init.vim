" Declarations\
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:airline_powerline_fonts = 1 " Vim devicons for powerline
let g:airline_theme='onedark'
let g:deoplete#auto_complete_delay = 100
let g:deoplete#enable_at_startup = 1 " Start deoplete at startup
let g:deoplete#sources#jedi#enable_typeinfo = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:jsx_ext_required = 0
let g:mkdp_path_to_chrome = "chromium" " Open Markdown preview in chromium
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_virtualenv = 1
let g:ropevim_vim_completion=0
let g:sneak#label = 1 " Show labels while using sneak
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['javascript'], 'passive_filetypes': [] }
"let g:syntastic_disabled_filetypes=['python']

syntax on
nmap <F8> :TagbarToggle<CR>
cabbr <expr> %% expand('%:p:h')

set tabstop=4
set shiftwidth=4
set expandtab
set nowrap

set background=dark
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

au BufNewFile,BufReadPost *.coffee,*.rb,*.yml,*.yaml,*.js,*.jsx,*.jade,*.pug,*.scss,*.scm,*.toml setl tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.emblem,*.haml,*.py,*.coffee,*.jade set foldmethod=indent
au BufNewFile,BufReadPost *.html,*.c setl tabstop=4 shiftwidth=4 expandtab


call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'deoplete-plugins/deoplete-dictionary'
Plug 'deoplete-plugins/deoplete-docker'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-tag'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Trigger configuration (Optional)
" let g:UltiSnipsExpandTrigger="<C-l>"
"
" Initialize plugin system
call plug#end()


" Post Plugin stuff
colorscheme dracula
