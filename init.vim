syntax enable
let mapleader=" "
let g:polyglot_disabled = ['markdown']
nnoremap <Esc> :<C-u>nohlsearch<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

imap jj <Esc>
" set relativenumber
set syntax=sh
set showcmd "show command type out
set showmatch "show the pairs of brakets
set title
set nocompatible
set ignorecase
set smartcase
" --- list chars ---
"  " list spaces and tabs to avoid trailing spaces and mixed indentation
"  " see key mapping at the end of file to toggle `list`
set listchars=tab:▹\ ,trail:·,nbsp:⚋
set fillchars=fold:-
set list
" set termguicolors
set autoindent

set syntax=sh
set showcmd "show command type out
set showmatch "show the pairs of brakets

set clipboard=unnamedplus "acces to clipboard
set noshowmode
set ignorecase
set colorcolumn=80
set softtabstop=2
set tabstop=2 shiftwidth=2 expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
" set expandtab  " Expand tabs to spaces
" set tabstop=2
" set shiftwidth=2
set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
set smartindent
set smarttab
" set pastetoggle=<F2>
set number
set lazyredraw
set nobackup
set nowritebackup
set noswapfile
" when there is a wrong with delete,space keywords
" set backspace=indent,eol,start
set cursorline

" turn off highlighted
nnoremap <F4> :set hlsearch!<CR>
" change color Search
hi Search cterm=NONE ctermfg=grey ctermbg=8

filetype plugin on

set omnifunc=syntaxcomplete#Complete

let g:polyglot_disabled = ['autoindent']

call plug#begin('~/.config/nvim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-test/vim-test'
  Plug 'szw/vim-maximizer'
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mhinz/vim-grepper'
  Plug 'ap/vim-css-color'
  Plug 'mbbill/undotree'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-surround'
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'edkolev/tmuxline.vim'
  Plug 'mg979/vim-visual-multi'
  Plug 'jiangmiao/auto-pairs'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-commentary'
  Plug 'Yggdroot/indentLine'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim', { 'name': 'dracula' }
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-dispatch'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
call plug#end()
colorscheme gruvbox

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
let test#strategy = "dispatch"

nnoremap <leader>m :MaximizerToggle!<CR>

let g:ale_linters = {
\  'ruby': ['rubocop'],
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['eslint']
\}

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'ruby': ['rubocop'],
\  'javascript': ['prettier', 'eslint'],
\  'typescript': ['eslint'],
\  'javascriptreact': ['prettier', 'eslint'],
\  'typescriptreact': ['eslint'],
\  'css': ['prettier']
\}

let g:ale_linters_explicit = 1

nmap <C-p> :FZF --preview cat\ {}<CR>
nnoremap <C-g> :Rg<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

"set wildmode=longest,list,full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*
nnoremap <leader>ag  :Grepper -tool ag -highlight<cr>
nnoremap <leader>gg  :Grepper -tool git -highlight<cr>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gi :G<CR>

nnoremap <leader>u :UndotreeToggle<CR>

let g:undotree_WindowLayout = 2
let g:undotree_ShortIndicators = 0
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 24
let g:undotree_DiffpanelHeight = 7
let g:undotree_RelativeTimestamp = 1
let g:undotree_HighlightChangedText = 1
let g:undotree_HelpLine = 1

if has("persistent_undo")
  set undodir=$HOME/.undodir
  set undofile
endif

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

let NERDTreeWinSize = 40

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeGitStatusConcealBrackets = 1

let g:startify_change_to_dir = 0

autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            " \ |   NERDTree
            \ |   wincmd w
            \ | endif

let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_section_b = '%-0.10{getcwd()}'

set encoding=UTF-8
let g:tmuxline_preset = {
\  'a'   : '[#S]',
\  'win' : '#I-#W#F',
\  'cwin': '#I-#W#F',
\  'options': {
\    'status-justify': 'left'
\  }
\}

map <silent> <leader>h :wincmd h<CR>
map <silent> <leader>j :wincmd j<CR>
map <silent> <leader>k :wincmd k<CR>
map <silent> <leader>l :wincmd l<CR>

let g:startify_bookmarks = [
\  { 'n': '~/.config/nvim/init.vim' },
\  { 'z': '~/.zshrc' },
\  { 't': '~/.tmux.conf' },
\  { 'i': '~/.gitignore' },
\]
set updatetime=100

nmap <Leader>ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

nnoremap <leader>b <cmd>:Buffers<cr>


nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

filetype indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" coc
" coc-html-css-support coc-htmlhint coc-solargraph coc-prettier coc-eslint
" coc-html
" :h ins-completion-menu
"
" inoremap <expr><C-J> pumvisible() ? "\<C-n>" : "\<C-J>"
" inoremap <expr><C-K> pumvisible() ? "\<C-p>" : "\<C-K>"

" let g:UltiSnipsEditSplit="vertical"
