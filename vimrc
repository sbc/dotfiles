" ----------------------------------------
" Vundle
" ----------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Load 'vundles'
source ~/.vim/vundles.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10:cANSI
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar
  set wildignore+=.git\*,.hg\*,.svn\*         " for Windows

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  "set guifont=Menlo\ Regular:h12
  "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h14
  "set guifont=Droid\ Sans\ Mono\ For\ Powerline\ Nerd\ Font\ Complete:h14
  set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h15


  set wildignore+=*/tmp/*,*/.git/*,*/.hg/*,*/.svn/*,*.swp,*.png,*.gif,*.jpg   " for Linux/MacOSX

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif
endif

" ----------------------------------------
" GUI Specific Configuration
" ----------------------------------------

if has('gui_running')

  " Set screen geometry
  set lines=50
  set columns=100

endif

" ----------------------------------------
" Regular Vim Configuartion (No Plugins Needed)
" ----------------------------------------

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set laststatus=2                " always show the statusline
set hidden                      " allow hidden buffers
set history=100
set wildmode=list:longest       " shell-like wildcard matching

"" Whitespace
set wrap                        " wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Line numbers (hybrid mode)
set relativenumber
set number

"" Color
"set background=dark

"" Base16 Shell

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

colorscheme base16-solarized-dark

"" No Bells/Flashes
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"" Key mappings
let mapleader = ","
" Map jj to Esc, but don't move cursor
:imap jj <Esc>`^

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"" File Types
au BufRead,BufNewFile *.hamlc set ft=haml

" -----------------------------
" Plugin-specific Configuration
" -----------------------------

"" Plugins Keys
nnoremap <silent><C-a> :Ack

"" See also files in ~/.vim/plugin/settins

