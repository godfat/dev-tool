scriptencoding utf-8

set t_Co=256 " force using 256 colors because fish didn't like xterm-256color,
             " so i need to set TERM to xterm-color for fish!

colorscheme twilight256

"set foldcolumn=7
hi foldcolumn  ctermbg=black
hi colorcolumn ctermbg=235
hi spellbad    ctermbg=black cterm=underline,bold
hi spelllocal  ctermbg=black cterm=underline,bold
hi spellcap    ctermbg=235
hi spellrare   ctermbg=235

highlight extrawhitespace ctermbg=darkred
match     extrawhitespace /\t\|\s\+\%#\@<!$/

set hlsearch
set expandtab
set colorcolumn=80
set encoding=utf-8
set fileencoding=utf-8
set fenc=utf-8
set termencoding=utf-8

set noautoindent               " this is annoying when pasting from clipboard
set nocompatible               " don't simulate vi

set backspace=indent,eol,start " more powerful backspacing
set bs=2                       " backspace
set softtabstop=2              " soft tab
set scrolloff=3                " keep 3 lines between scroll
set history=1000               " undo history
set cmdheight=2
set shiftwidth=2               " tab width?
set mouse=a                    " mouse support

syntax on
filetype on
filetype plugin on
filetype indent on
au BufNewFile,BufRead *.md set filetype=markdown

set wildmenu                   " i need friendly menu
set wildmode=list:longest

set ruler                      " show line, col info
set hidden                     " what's this?
set ignorecase                 " ignore case when searching
set smartcase                  " ignore case when searching lower cases
set spell                      " spell checker for non-native English speaker

syntax match Normal /[^!-~]/ contains=@NoSpell

set backupdir=~/tmp,/tmp
set directory=~/tmp,/tmp

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
autocmd vimenter * if !argc() | NERDTree | endif
