"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

"html
"  isnowfy only compatible with python not python3
"Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"coffeescript
Plugin 'kchmck/vim-coffee-script'

"typescript
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'

"Ionic and angular
Plugin 'akz92/vim-ionic2'

"auto-completion stuff
"Plugin 'klen/python-mode'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'
set nofoldenable

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

"Swap windows
Plugin 'wesQ3/vim-windowswap'

"table editing
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jeetsukumaran/vim-buffergator'

"better session saving/restore
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
set sessionoptions+=tabpages,globals

"renaming tabs
Plugin 'gcmt/taboo.vim'
call vundle#end()

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"pydiction
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
call togglebg#map("<F5>")
colorscheme zenburn
"set guifont=Monaco:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"lets have mouse-resizable panes
set mouse=a
set ttymouse=xterm2

"lets see the current line
set cursorline

"turn on numbering
set nu

"python with virtualenv support
py3 << EOF
import os.path
import sys
import vim
def execfile(filename, *args, **kwargs):
    with open(filename) as fp:
            exec(fp.read(), *args, **kwargs)
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4 foldmethod=indent autoindent shiftwidth=4 tabstop=4 expandtab softtabstop=4 autoindent

"lets have sane paragraphs when we want them
autocmd FileType markdown set textwidth=80

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent autoindent shiftwidth=4 tabstop=4 expandtab softtabstop=4 autoindent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
au BufRead,BufNewFile *.js,*.es6,*.es7,*.es5,*.json set filetype=javascript shiftwidth=2 tabstop=2 expandtab softtabstop=2 autoindent foldmethod=indent
au BufRead,BufNewFile *.ts set filetype=typescript shiftwidth=2 tabstop=2 expandtab softtabstop=2 autoindent foldmethod=indent
autocmd FileType javascript set shiftwidth=2 tabstop=2 expandtab softtabstop=2 autoindent foldmethod=indent
autocmd FileType typescript set shiftwidth=2 tabstop=2 expandtab softtabstop=2 autoindent foldmethod=indent

au BufRead,BufNewFile *.coffee set softtabstop=2 shiftwidth=2 tabstop=2 expandtab softtabstop=2 autoindent foldmethod=indent

" Add full file path to your existing statusline
set laststatus=2
set statusline=%.30F%h%m%r\ @%2c,%3l/%3L\ %{strlen(&ft)?&ft:'No\ Filetype'} 
