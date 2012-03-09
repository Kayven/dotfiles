let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"filtype recognition, filetype ident and autocompletion
filetype on
filetype plugin on
filetype indent on
syntax on
set ofu=syntaxcomplete#Complete

"Search as you type
set incsearch

"python completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
inore <Nul> <C-x><C-o>

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

set tags+=$HOME/.vim/tags/python.ctags

map <silent><C-Left> <C-T> 
map <silent><C-Right> <C-]> 
map <silent><A-Left> :tabprevious<CR>
map <silent><A-Left> :tabprevious<CR>
map <F5> yyp!!sh<CR><ESC>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :TlistOpen<CR>
nnoremap <C-left> :bn<cr>
nnoremap <C-right> :bp<cr>

set number
set ignorecase
set showmatch
set showmode
set ts=4
set sw=4
set autoindent
set background=dark
colorscheme ir_black
set guifont=Monaco:h12

if $TERM =~ '^xterm'
    set t_Co=256
endif 
