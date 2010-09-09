let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

filetype on
filetype plugin on

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
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :TlistOpen<CR>

set number
set ignorecase

