" gui stuff

" remove menu tool and scroll bar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

call pathogen#infect()
syntax on

filetype plugin indent on

colo pyte

" dont use tabs
set expandtab
set tabstop=4
set shiftwidth=4

" enable suggestions
set wildmenu

" set numbers on the left side
set nu

set stl=%f\ %m\ %r%{fugitive#statusline()}\ line:%l/%L[%p%%]\ col:%v\ buf:#%n\ [%b][0x%B]

" set cmdline height
set ch=2

set laststatus=2

" don't care about whitespace stuff
set diffopt+=iwhite

set autoindent

set cursorline

let mapleader = ","

nmap <silent> ,cd :lcd %:h<CR>

nmap <silent> ,cr :source ~/.vimrc<CR>

map <S-Insert> <MiddleMouse>

noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> ,mk <C-W>K
noremap <silent> ,ml <C-W>L

noremap <silent> ,h <C-W>h
noremap <silent> ,o <C-W>o
noremap <silent> ,j <C-W>j
noremap <silent> ,k <C-W>k
noremap <silent> ,l <C-W>l

" some java stuff
function! MapJavaUtils()
    silent! noremap <silent> ,i :JavaImport<CR>
    silent! noremap <silent> ,d :JavaDocPreview<CR>
endfunction

augroup java_utils
    au!
    au BufEnter *.java call MapJavaUtils()
augroup END

" custom syntax
syntax enable
au BufRead,BufNewFile *.kaa set filetype=kaa
