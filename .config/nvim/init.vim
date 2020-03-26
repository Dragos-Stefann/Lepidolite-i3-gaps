"####Define plugins#### 
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
cal plug#end()

"###Plugin settings####
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
let g:deoplete#enable_at_startup = 1

"####Functionality & more eyecandy####

filetype plugin indent on
set mouse=a
set t_Co=256
syntax on
set number
set relativenumber
set wildmode=longest,list,full
set encoding=UTF-8
