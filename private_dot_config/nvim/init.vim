call plug#begin()
" file manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" execute commands from nvim to tmux
Plug 'jgdavey/tslime.vim'
" Language Client support
Plug 'autozimu/LanguageClient-neovim', { 
            \ 'branch': 'next',
            \'do': 'bash install.sh' }
" stausline/tabline
Plug 'itchyny/lightline.vim'
" git integration
Plug 'tpope/vim-fugitive'
" vim clipboard management
Plug 'svermeulen/vim-easyclip'
"Plug 'ctrlpvim/ctrlp.vim'
" ansible support
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
" buffer-tab line
Plug 'ap/vim-buftabline'
" terraform support
Plug 'hashivim/vim-terraform'
call plug#end()
" Don't show mode in statusline
set noshowmode
" Always show statusline
set laststatus=2
" lightline config
let g:lightline = {
    \ 'colorscheme': 'ayu_dark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'modified', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }
" spaces instead of tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
" show vertical cursorline
set cursorline
" show/hide horizontal column
nnoremap <leader>cc :set colorcolumn=85<CR>
nnoremap <leader>cco :set colorcolumn=0<CR>
set hidden
set autoindent
set backupdir=~/.config/nvim/backups
set undodir=~/.config/nvim/backups
set directory=~/.config/nvim/swap
set undolevels=1000
set undoreload=10000
" sets line number of file
set number
" sets line number relitive to cursor
set relativenumber
set undofile
" remap leader to ,
let mapleader = ","
" adds proper escaping for search sequences
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" quickly no highlight search teams
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1
" unset arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" make pressing jj go to visual mode
inoremap jj <ESC>
" in visual mode use ; rather than : to enter edit mode
noremap ; :
" vertical split screen
nnoremap <leader>w <C-w>v<C-w>l
" remap keys to move around split screens simpler
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" And set some nice chars to do it with
"set list
set listchars=tab:»\ ,eol:¬
" automatically change window's cwd to file's dir
set autochdir
" highlight characters past column 120
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END
" Support virtualenv
let g:pymode_virtualenv = 1
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0
let g:pymode_rope_complete_on_dot = 0
" shamelessly taken from http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set wildmenu
set wildmode=list:longest
" auto save files when focus lost
au FocusLost * :wa
" ,W to remove trailing whitespace from current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" ,p - quickly set paste option
nnoremap <leader>p :set paste<CR>
" ,po - quickly set paste option off
nnoremap <leader>po :set nopaste<CR>
" edit vimrc quickly
"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" move between tabs simpler
nnoremap <leader>tt :bp<cr>
" nerdtree plugin
" map <C-n> :NERDTreeToggle<CR>
map <C-t> :NERDTreeToggle<CR>
" toggle spelling
nnoremap <leader>s :set invspell<CR>

syntax enable
" diff settings
if $diff
    " 1st theme
    "highlight Normal term=none cterm=none ctermfg=White ctermbg=Black gui=none guifg=White guibg=Black
    " 2nd theme
    highlight DiffAdd cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
    highlight DiffDelete cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
    highlight DiffChange cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
    highlight DiffText cterm=none ctermfg=bg ctermbg=White gui=none guifg=bg guibg=White
    " 3rd theme
    "highlight! link DiffText MatchParen
    "highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    "highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    "highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    "highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif
" TSlime
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
:cabbrev <expr> sf "setfiletype"
:cabbrev sf <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'setfiletype' : 'sf')<cr>

" terraform support
let g:terraform_align=1
let g:terraform_fmt_on_save=1
" true colour mode
set termguicolors

let g:LanguageClient_serverCommands = {
    \ 'python': ['/home/cantu/.local/bin/pyls'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" edit init.vim quickly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" source init.vim
nnoremap <leader>sv :source $MYVIMRC<cr>
" buftabline support
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
