"################
"# Key bindings #
"################

"Map <leader> key to space
let mapleader = ' '

"Map <localleader> key to space
let maplocalleader = ' '

"Map F3 to toggle on and off the line numbers in Normal mode
nmap <F3> :set nu! <CR>

"Map <leader>F3 to toggle on and off the relative line numbers in Insert mode
nmap <leader><F3> :set rnu! <CR>

"Map F3 to toggle on and off the line numbers in Insert mode
imap <F3> <ESC> :set nu! <CR>i

"Map F4 to toggle on and off the relative line numbers in Insert mode
imap <F4> <ESC> :set rnu! <CR>i

"####################################################
"# Remap omnicomplete keys to make it easier to use #
"####################################################

"Use ctrl + space for omnicomplete
inoremap <C-@> <C-x><C-o>

"Press enter to accept suggestion from omnicomplete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

"#######################################
"# Reassign arrow keys to no operation #
"#######################################
nnoremap <Up>	<Nop>
nnoremap <Down>	<Nop>
nnoremap <Left>	<Nop>
nnoremap <Right> <Nop>
inoremap <Up>	<Nop>
inoremap <Down>	<Nop>
inoremap <Left>	<Nop>
inoremap <Right> <Nop>

"##########################
"# Autocorrect Dictionary #
"##########################
abbr ture true
abbr flase false

"####################
"# General settings #
"####################

"Turn on file specific indentation
filetype indent on

"Scroll when cursor reaches x lines from the bottom
set scrolloff=8

"Reload external file changes
set autoread

"Show options for tab completion
set wildmenu

"Get rid of annoying bell sounds on error
"and show visual feedback
set noerrorbells
set visualbell

"Tab settings
set expandtab
set autoindent smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set copyindent
set smarttab

"search settings
set incsearch
set hlsearch

"##################
"# Split settings #
"##################
set splitbelow
set splitright

"Navigate split windows easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"###########
"# Plugins #
"###########
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'joshdick/onedark.vim'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'skywind3000/asyncrun.vim' | Plug 'conornewton/vim-pandoc-markdown-preview'
Plug 'tpope/vim-surround'
call plug#end()

"########################
"# vim airline settings #
"########################
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
au CmdlineEnter * redraws "Show cmd mode in the statusline
let g:airline#extensions#ale#enabled = 1

"################
"# ALE settings #
"################
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['yapf']}
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_balloons = 1

"####################################
"# Format settings for python files #
"####################################
autocmd Filetype python setlocal colorcolumn=80
autocmd Filetype python setlocal expandtab tabstop=4 sw=4 sts=4
"####################################
"# Format settings for markdown files #
"####################################
autocmd Filetype markdown setlocal textwidth=79

"#################################
"# One Dark colorscheme settings #
"#################################
set termguicolors
syntax on
colorscheme onedark

"###################
"# Vimtex settings #
"###################
let g:vimtex_view_method = 'zathura'
let g:vimtex_format_enabled = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_indent_bib_enabled = 1
let g:vimtex_complete_ignore_case = 1
let g:vimtex_quickfix_mode = 0

autocmd Filetype tex setlocal encoding=utf-8 fileformat=unix
autocmd Filetype tex setlocal textwidth=79
autocmd Filetype tex setlocal tabstop=4 sw=4 sts=4
autocmd Filetype tex setlocal spell spelllang=en_us

"Start vim with server for forward search
if empty(v:servername) && exists('*remote_startserver')
call remote_startserver('VIM')
endif

"Compile with latexmk with shell escape
"to use the minted package
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let  g:vimtex_fold_types = {
           \ 'preamble' : {'enabled' : 0},
           \ 'envs' : {
           \   'blacklist' : ['figure', 'table'],
           \ },
	   \ 'sections' : {
	   \   'sections' : ['section'],
	   \ },
	   \}

"######################
"# Ultisnips settings #
"######################
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"#####################
"# Jedi Vim settings #
"#####################
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 0

"################################################################################
"# Markdown to pdf settings
"################################################################################
let g:md_pdf_viewer="zathura"
