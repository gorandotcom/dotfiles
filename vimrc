
set nocompatible

" PATHOGEN
filetype off
silent! call pathogen#helptags()
silent! call pathogen#infect()
filetype plugin indent on

noremap , \
let mapleader = ","

" CONFIGURATION MAPPING
set autoread                        " set to auto read when a file is changed from the outside
set showcmd                         " show typed commands
set expandtab                       " use spaces, not tabs
set shiftwidth=4                    " set tab width
set tabstop=4                       " a tab is two spaces
set softtabstop=4
"set noexpandtab                     " use tabs, not spaces
"set shiftwidth=4                    " set tab width
"set tabstop=4                       " a tab is four spaces
"set softtabstop=4
set smarttab                        " align space-tabs
set autoindent                      " set automatic code indentation
let python_highlight_all = 1

set wildmenu                        " turn on WiLd menu
set wildmode=list:longest,list:full " activate TAB auto-completion for file paths
set wildignore+=*.o,.git,.svn,node_modules

set backspace=indent,eol,start      " set backspace config, backspace as normal
set nomodeline                      " security
set encoding=utf8                   " default encoding for all files

set hlsearch                        " highlight search terms
set incsearch                       " go to search results as typing
set smartcase                       " but case-sensitive if expression contains a capital letter.

set ttyfast                         " improves redrawing for newer computers
set fileformats=unix,mac,dos

set nobackup                        " prevent backups of files
set noswapfile                      " no need for swap files
set directory=~/.vim/.swp,/tmp      " swap directory, just in case
set hidden                          " hide buffers without closing them
set viminfo='1000,<0,@0,/0          " don't remember things that can compromise data
set cryptmethod=blowfish2           " zip encryption sucks, use blowfish


set linebreak                       " this will not break whole words while wrap is enabled
set nolist                          " when line break is enabled, don't break on words
set showbreak=…                     " show when line has been broken
set cursorline                      " highlight current line
set list listchars=tab:\ \ ,trail:· " like to know when trailing characters exist


set cpoptions+=$                    " changed end with $ while typing
set nu                              " turn on line numbering
set virtualedit=onemore             " alter virtual edit mode
set pastetoggle=<F3>                " set pastetoggle shortcut
set tags=./tags;,tags;              " better tags file search order

set scrolloff=3                     " force lines on top and bottom
syntax enable                       " enable syntax highlighting

" Python
au FileType python set noexpandtab

" font
if has('gui_running')
        set guifont=Ubuntu_Mono_Bold:h15
        endif


" COLOR SCHEME
set t_Co=256
set background=dark

colorscheme distinguished "desert
set list listchars=tab:\⁚\ ,trail:· " draw tab lines automatically
if has("gui_running")
  "set list listchars=tab:\⁚\ ,trail:· " draw tab lines automatically
  colorscheme ir_black
  set showtabline=2                 " prevent full screen display issues
  set guifont=Droid\ Sans\ Mono\ 11,Liberation\ Mono\ 11,Monospace\ 10
endif

"" ADDITIONAL GUI SETTINGS
if has("gui_running")
  set guioptions-=T
  set columns=130 lines=45
  set guioptions-=T
  " crazy hack to get gvim to remove all scrollbars
  set guioptions+=LlRrb
  set guioptions-=LlRrb
endif

" Highligh all matching words under cursor
au CursorMoved * silent! exe printf('match VisualNOS /\<%s\>/', expand('<cword>'))

