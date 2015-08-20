set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set shell=bash

if has("gui")
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    "Plugin 'wincent/command-t'
    Plugin 'tpope/vim-rails'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'scrooloose/nerdtree'
    Plugin 'derekwyatt/vim-fswitch'
    Plugin 'derekwyatt/vim-protodef'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'xolox/vim-session'
    Plugin 'xolox/vim-misc'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'spf13/vim-colors'
    Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-surround'
    Plugin 'kien/ctrlp.vim'
    Plugin 'myusuf3/numbers.vim'
    " Plugin 'Shougo/neocomplcache.vim'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
endif

filetype off
" call pathogen#infect()

" gui stuff

" remove menu tool and scroll bar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

if has("gui")
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
endif


let g:email="planrichi@gmail.com"
let g:template_dir="~/.vim/templates"

set ruler


syntax enable

set background=dark
if has('gui_running')
    set background=light
    color ir_black
    "nmap <leader>l :set list!<CR>
    set listchars=tab:▸\ ,eol:¬
    set list
endif

filetype plugin indent on

" dont use tabs
set expandtab
set tabstop=4
set shiftwidth=4

" enable suggestions
set wildmenu

" set numbers on the left side
set nu

"set stl=%f\ %m\ %r%{fugitive#statusline()}\ line:%l/%L[%p%%]\ col:%v\ buf:#%n\ [%b][0x%B]
set stl=%f\ %m\ %r\ line:%l/%L[%p%%]\ col:%v\ buf:#%n\ [%b][0x%B]

" set cmdline height
set ch=2
set laststatus=2
" don't care about whitespace stuff
set diffopt+=iwhite
set autoindent
set cursorline
set wildignore=*.o,*.pyc,*.pyo

let mapleader = ","

nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,cr :source ~/.vimrc<CR>
nmap <silent> ,n :cnext<CR>
nmap <silent> ,p :cp<CR>

map <S-Insert> <MiddleMouse>

noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> ,mk <C-W>K
noremap <silent> ,ml <C-W>L

noremap <silent> ,h <C-W>h
" noremap <silent> ,o <C-W>o
noremap <silent> ,j <C-W>j
noremap <silent> ,k <C-W>k
noremap <silent> ,l <C-W>l



if has("autocmd")

    " custom syntax
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType ruby,yaml setlocal ts=2 sw=2 expandtab
    autocmd FileType python setlocal ts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=2 sw=2 expandtab

    
    augroup waf
            au BufEnter,BufNewFile wscript set filetype=python
    augroup END

    au BufEnter,BufNewFile *.am set filetype=am
    augroup hamljs
        au BufEnter,BufNewFile *.hamljs set filetype=haml
    augroup END

  au! BufEnter *.c let b:fswitchdst = 'h' | let b:fswitchlocs = '.'
  au! BufEnter *.h let b:fswitchdst = 'c,cpp' | let b:fswitchlocs = '.'
  au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'
  au! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = '.'
  au! BufEnter * call protodef#MakeMapping()
endif
 

nmap <silent> <Leader>of :FSHere<cr>

imap a ä
imap A Ä
imap u ü
imap U Ü
imap o ö
imap O Ö
imap ss ß


highlight OverLength ctermbg=red ctermfg=white guibg=#ff2929

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

let g:jedi#completions_enabled = 0

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
