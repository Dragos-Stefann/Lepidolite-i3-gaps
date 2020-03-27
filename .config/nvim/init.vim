"Set the leader key
let mapleader ="\<Space>"
"####Define plugins####
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
cal plug#end()

"###Plugin settings####
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
let g:deoplete#enable_at_startup = 1

"####Functionality & more eyecandy####

filetype plugin indent on
set mouse=a
set t_Co=256
syntax on
set number
set relativenumber
set encoding=UTF-8
set noshowmode
set clipboard+=unnamedplus
set go=on
" Color previews

let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]
let g:Hexokinase_highlighters = ['backgroundfull']

" Reenable hexokinase on enter
autocmd VimEnter * HexokinaseTurnOn

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set bg=light \| set linebreak \| set showmode<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=ro_RO<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
map <leader>v :VimwikiIndex
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writting
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>
