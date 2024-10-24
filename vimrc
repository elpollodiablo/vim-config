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
Plugin 'stephpy/vim-yaml'

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
Plugin 'Valloric/YouCompleteMe'
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

Plugin 'sirtaj/vim-openscad'
call vundle#end()

"split navigations
" das ist bloedsinn, damit kannst du nicht umgehen
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
"py3 << EOF
"import os.path
"import sys
"import vim
"def execfile(filename, *args, **kwargs):
"    with open(filename) as fp:
"            exec(fp.read(), *args, **kwargs)
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  sys.path.insert(0, project_base_dir)
"  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*.scad set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw, *.scad set shiftwidth=4 foldmethod=indent autoindent shiftwidth=4 tabstop=4 expandtab softtabstop=4 autoindent

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
function! PasteForStatusline()
    let paste_status = &paste
    if paste_status == 1
        return "PASTE PASTE PASTE PASTE PASTE PASTE PASTE PASTE PASTE "
    else
        return ""
    endif
endfunction

" Add full file path to your existing statusline
set laststatus=2
set statusline=%{PasteForStatusline()}%.30F%h%m%r\ @%2c,%3l/%3L\ %{strlen(&ft)?&ft:'No\ Filetype'}

let g:ComponentDir = '~/workspace/things-app/src/app/components'
command! -nargs=1 ComponentTab tabnew | execute 'lcd' . g:ComponentDir . '/<args>' | sv <args>.component.spec.ts | vs <args>.component.ts | wincmd j | e <args>.component.scss | vs <args>.component.html | TabooRename <args>_co

let g:WFComponentDir = '~/workspace/things-app/src/app/workflow_components'
command! -nargs=1 WFComponentTab tabnew | execute 'lcd' . g:WFComponentDir . '/<args>' | sv <args>.component.spec.ts | vs <args>.component.ts | wincmd j | e <args>.component.scss | vs <args>.component.html | TabooRename <args>_wfco

let g:PageDir = '~/workspace/things-app/src/app/pages'
command! -nargs=1 PageTab tabnew | execute 'lcd' . g:PageDir . '/<args>' | sv <args>.page.spec.ts | vs <args>.page.ts | wincmd j | e <args>.module.ts | vs <args>.page.html | TabooRename <args>_pa

let g:ModalDir = '~/workspace/things-app/src/app/modals'
command! -nargs=1 ModalTab tabnew | execute 'lcd' . g:ModalDir . '/<args>' | sv <args>.page.spec.ts | vs <args>.page.ts | wincmd j | e <args>.module.ts | vs <args>.page.html | TabooRename <args>_mo

let g:ServiceDir = '~/workspace/things-app/src/app'
command! -nargs=1 ServiceTab tabnew | execute 'lcd' . g:ServiceDir | e <args>/<args>.service.spec.ts | vs <args>/<args>.service.ts | TabooRename <args>_mo

function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!
let g:session_default_name = FindSessionDirectory()

function! GetDir(path)
  return fnamemodify(a:path, ':p:h')
  "dir = finddir('.git/..', expand(a:path . '%:p:h').';')
endfunction

function! GetFilename(path)
  return fnamemodify(a:path, ':t')
endfunction

function! NgS(path) abort
  let l:fn = GetFilename(a:path)
  let l:dir = GetDir(a:path)
  echom 'filename: ' l:fn
  echom 'dir: ' l:dir
  if isdirectory(l:dir)
    echom 'dir: ' l:dir
    execute 'sv ' a:path
    execute 'lcd ' l:dir
    execute 'SaveSession'
  endif
endfunction

function! NgSt(path, suffix) abort
  let l:fn = GetFilename(a:path)
  let l:dir = GetDir(a:path)
  let l:stub = split(l:fn, '\.')[0]
  let l:name = l:stub . a:suffix
  let l:actions = l:stub . '.actions.ts'
  let l:state = l:stub . '.state.ts'
  let l:model = l:stub . '.model.ts'
  let l:state_model = l:stub . '-state.model.ts'
  let l:states_model = l:stub . '-states.model.ts'
  echom 'opening component window: ' l:name
  echom 'actions file: ' l:actions
  echom 'componentc file: ' l:state
  echom 'model file: ' l:model
  echom 'state-model file: ' l:state_model
  echom 'states-modelfile: ' l:states_model
  echom 'dir: ' l:dir

  if isdirectory(l:dir)
    execute 'tabnew'
    execute 'lcd ' l:dir
    execute 'sv ' l:actions
    execute 'vs ' l:state
    execute 'wincmd j'
    execute 'e ' l:model

    if filereadable(l:state_model)
      execute 'vs ' l:state_model
    endif
    if filereadable(l:states_model)
      echom 'states model: ' l:states_model
      execute 'vs ' l:states_model
    endif
    execute 'TabooRename ' l:name
    execute 'SaveSession'
  endif
endfunction

function! NgG(path, suffix) abort
  let l:infix = "UNKNOWN_SUFFIX_IN_VIMRC"
  if a:suffix == "_pa"
    let l:infix = "page"
  endif

  if a:suffix == "_co"
    let l:infix = "component"
  endif

  let l:fn = GetFilename(a:path)
  let l:dir = GetDir(a:path)
  let l:stub = split(l:fn, '\.')[0]
  let l:name = l:stub . a:suffix
  let l:spec = l:stub . '.' . l:infix . '.spec.ts'
  let l:co = l:stub . '.' . l:infix . '.ts'
  let l:scss = l:stub . '.' . l:infix . '.scss'
  let l:sass = l:stub . '.' . l:infix . '.sass'
  let l:html  = l:stub . '.' . l:infix . '.html'
  echom 'opening ' . l:infix . ' window: ' l:name
  echom 'spec file: ' l:spec
  echom '' . l:infix . 'c file: ' l:co
  echom 'scss file: ' l:scss
  echom 'sass file: ' l:sass
  echom 'html file: ' l:html
  echom 'dir: ' l:dir

  if isdirectory(l:dir)
    execute 'tabnew'
    execute 'lcd ' l:dir
    execute 'sv ' l:spec
    execute 'vs ' l:co
    execute 'wincmd j'
    if filereadable(l:scss)
      execute 'vs ' l:scss
      execute 'e ' l:scss
    endif
    if filereadable(l:sass)
      execute 'vs ' l:sass
      execute 'e ' l:sass
    endif
    execute 'vs ' l:html
    execute 'TabooRename ' l:name
    execute 'SaveSession'
  endif
endfunction

set wildignore=node_modules/**,.git/**

function! C1Complete(arglead, cmdline, cursorpos)
  echom 'arglead: ' string(a:arglead)
  echom 'cmdline: ' string(a:cmdline)
  echom 'cursorpos: ' string(a:cursorpos)
  return getcompletion('**/*.html', 'file', 1)
endfunction

function! CompleteComponent(arglead, cmdline, cursorpos)
  return getcompletion(g:session_default_name.'/**/*'. a:arglead .'*.component.ts', 'file', 1)
endfunction

function! CompletePage(arglead, cmdline, cursorpos)
  return getcompletion(g:session_default_name.'/**/*'. a:arglead .'*.page.ts', 'file', 1)
endfunction

function! CompleteService(arglead, cmdline, cursorpos)
  return getcompletion(g:session_default_name.'/**/*'. a:arglead .'*.service.ts', 'file', 1)
endfunction

function! CompleteState(arglead, cmdline, cursorpos)
  return getcompletion(g:session_default_name.'/**/*'. a:arglead .'*.state.ts', 'file', 1)
endfunction

function! CompleteModel(arglead, cmdline, cursorpos)
  return getcompletion(g:session_default_name.'/**/*'. a:arglead .'*.model.ts', 'file', 1)
endfunction

function! CompleteDirective(arglead, cmdline, cursorpos)
  return getcompletion(g:session_default_name.'/**/*'. a:arglead .'*.directive.ts', 'file', 1)
endfunction

function! CompleteGuard(arglead, cmdline, cursorpos)
  return getcompletion(g:session_default_name.'/**/*'. a:arglead .'*.guard.ts', 'file', 1)
endfunction

command! -nargs=* -complete=customlist,C1Complete C1 echo <q-args>
command! -nargs=* -complete=customlist,CompleteComponent CC echo <q-args>

command! -nargs=1 -complete=customlist,CompleteService NgService call NgS(<q-args>)
command! -nargs=1 -complete=customlist,CompleteComponent NgModal call NgG(<q-args>, '_mo')
command! -nargs=1 -complete=customlist,CompleteComponent NgComponent call NgG(<q-args>, '_co')
command! -nargs=1 -complete=customlist,CompletePage NgPage call NgG(<q-args>, '_pa')
command! -nargs=1 -complete=customlist,CompleteState NgState call NgSt(<q-args>, '_st')
command! -nargs=1 -complete=customlist,CompleteModel NgModel call NgS(<q-args>)
command! -nargs=1 -complete=customlist,CompleteDirective NgDirective call NgS(<q-args>)
command! -nargs=1 -complete=customlist,CompleteGuard NgGuard call NgS(<q-args>)

" Rename.vim  -  Rename a buffer within Vim and on the disk
"
" Copyright June 2007-2011 by Christian J. Robinson <heptite@gmail.com>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Rename[!] {newname}

command! -nargs=* -complete=file -bang Rename call Rename(<q-args>, '<bang>')

function! Rename(name, bang)
  let l:name    = a:name
  let l:oldfile = expand('%:p')

  if bufexists(fnamemodify(l:name, ':p'))
    if (a:bang ==# '!')
      silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
    else
      echohl ErrorMsg
      echomsg 'A buffer with that name already exists (use ! to override).'
      echohl None
      return 0
    endif
  endif

  let l:status = 1

  let v:errmsg = ''
  silent! exe 'saveas' . a:bang . ' ' . l:name

  if v:errmsg =~# '^$\|^E329'
    let l:lastbufnr = bufnr('$')

    if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
      if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
        silent exe l:lastbufnr . 'bwipe!'
      else
        echohl ErrorMsg
        echomsg 'Could not wipe out the old buffer for some reason.'
        echohl None
        let l:status = 0
      endif

      if delete(l:oldfile) != 0
        echohl ErrorMsg
        echomsg 'Could not delete the old file: ' . l:oldfile
        echohl None
        let l:status = 0
      endif
    else
      echohl ErrorMsg
      echomsg 'Rename failed for some reason.'
      echohl None
      let l:status = 0
    endif
  else
    echoerr v:errmsg
    let l:status = 0
  endif

  return l:status
endfunction

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
set hlsearch
"/\s\+$
"/\t
"/\s\+\%#\@<!$/
set autoread
autocmd FocusGained * checktime
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
highlight Unwanted ctermbg=red guibg=red
2match Unwanted /\t/

"copy paste
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>
