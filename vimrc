" gui stuff

" remove menu tool and scroll bar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

let g:email="planrichi@gmail.com"
let g:template_dir="~/.vim/templates"

filetype off

call pathogen#infect()

set ruler

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'derekwyatt/vim-protodef'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'kchmck/vim-coffee-script'

syntax enable

set background=dark
if has('gui_running')
    set background=light
    color codeschool
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
" noremap <silent> ,o <C-W>o
noremap <silent> ,j <C-W>j
noremap <silent> ,k <C-W>k
noremap <silent> ,l <C-W>l



if has("autocmd")

    " custom syntax
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType ruby,yaml setlocal ts=2 sw=2 expandtab
    autocmd FileType python setlocal ts=4 sw=4 expandtab

    augroup waf
            au BufEnter,BufNewFile wscript set filetype=python
    augroup END

    au BufEnter,BufNewFile *.am set filetype=am
    augroup hamljs
        au BufEnter,BufNewFile *.hamljs set filetype=haml
    augroup END
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

if has("gui_macvim")
  set guifont=Andale\ Mono:h14
endif

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q
