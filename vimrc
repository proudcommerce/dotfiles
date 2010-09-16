" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
"
"   James Cash's vimrc
"
" }


" ***** Setup pathogen for loading bundles ***** {
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
end
" }


" ***** Basic settings ***** {
set nocompatible
set encoding=utf-8
let mapleader = ","

colorscheme ir_black

if has('gui_running')
  set columns=85 lines=100
endif

filetype on
filetype plugin on
filetype indent on

syntax on
" }


" ***** Set stuff ***** {
set autoindent
set backspace=indent,eol,start
set completeopt=longest,menuone,preview
set cursorline
set expandtab
set foldenable
set foldmethod=marker
set formatoptions+=n  " gq recognizes numbered lists
set hidden  " When opening a new file hide the current instead of closing it
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set magic
set ofu=syntaxcomplete#Complete
set pastetoggle=<F2>
set ruler
set scrolloff=2
set shiftwidth=2
set showmatch
set smartcase
set smarttab
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}
set tabstop=2
set undolevels=1000
set visualbell
set wildmenu
set wildmode=list:longest,full
if has('gui_running')
  set guioptions-=T
endif
if has('autocmd')
  autocmd filetype html,xml set listchars-=tab:>.
endif
" Backup stuff {
set backup
set backupdir=$HOME/.vimbackup//
set directory=$HOME/.vimswap//
set viewdir=$HOME/.vimviews//
" Creating backup dirs if the don't exist
silent execute ' !mkdir -p $HOME/.vimbackup'
silent execute ' !mkdir -p $HOME/.vimswap'
silent execute ' !mkdir -p $HOME/.vimviews'
"  }
" }


" ***** Define commands ***** {
if has('gui_macvim')
  command! -nargs=0 Full set fullscreen
  command! -nargs=0 Unfull set nofullscreen
endif
command! -nargs=0 Restore set lines=100 columns=85
" }


" ***** Keybindings ***** {
" Normal/operator-pending/visual-mode bindings {
" Make navigating windows easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Toggle spellchecking
map <leader>ss :setlocal spell!<CR>
map <leader>o :BufExplorer<CR>
"  }
" Normal mode bindings {
nnoremap ; :
nnoremap j gj
nnoremap k gk
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>/ :let @/=""<CR>
nmap <leader>w :w<CR>
" Reflow paragraph
nmap Q gqap
" Using this instead of autochdir
nmap <leader>cd :cd %:p:h<CR>
" NERDTree bindings
nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <Leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>
" Keybindings for tabs
nmap <Leader>t <Esc>:tabedit .<CR>
nmap <leader>T <Esc>:tabnew<CR>
nmap gt <C-w>gf
nmap gT <C-w>gF
nmap <leader><Left> :tabprevious<CR>
nmap <leader><Right> :tabnext<CR>
nmap <leader>1 :tabn 1<CR>
nmap <leader>2 :tabn 2<CR>
nmap <leader>3 :tabn 3<CR>
nmap <leader>4 :tabn 4<CR>
nmap <leader>5 :tabn 5<CR>
nmap <leader>6 :tabn 6<CR>
nmap <leader>7 :tabn 7<CR>
nmap <leader>8 :tabn 8<CR>
nmap <leader>9 :tabn 9<CR>
nmap <leader>10 :tabn 10<CR>
"  }
" Command-mode bindings {
" Reopen the current file as sudo
cmap w!! w !sudo tee % > /dev/null
" Fix shift-key goofs
cmap W w
cmap WQ wq
cmap Q q
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"  }
" Visual-mode bindings {
vmap Q gq
"  }
" Insert mode bindings {
inoremap ;; <Esc>
"  }
" }


" ***** Miscellaneous autocmds ***** {
if has('autocmd')
  " Delete trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e
  " Warning: This enables fancy OmniCompletions for ruby, but makes loading
  " ruby files painfully slow...
  " autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
endif
" }


" ***** Plugin options ***** {
" NERDTree stuff {
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.o$', '\.git', '\.so' ]
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorLine=1
let NERDTreeMouseMode=1
"  }
" }


" ***** Mode-specific settings ***** {
" Python {
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
"  }
" }
