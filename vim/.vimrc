" Plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'https://github.com/easymotion/vim-easymotion.git'
" Plug 'https://github.com/flrnd/plastic.vim.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/mxw/vim-jsx.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
" Plug 'https://github.com/chrisbra/Colorizer.git'
Plug 'Rigellute/rigel'
Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" Set different cursors in different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Sets keycode timeout
set timeoutlen=150 ttimeoutlen=0

" Displays line numbers
set relativenumber

" --------------- Colors ------------------ "
" Colorscheme
syntax enable
colorscheme rigel

" Background color
hi Normal ctermbg=none

" Selected text color
hi Visual term=reverse cterm=reverse

" Current line colors
hi CursorLineNr  ctermbg=blue ctermfg=white

" Easymotion colors
hi EasyMotionTarget2First ctermbg=none ctermfg=191
hi EasyMotionTarget2Second ctermbg=none ctermfg=191
" hi EasyMotionTarget ctermbg=none ctermfg=red
" hi EasyMotionShade  ctermbg=none ctermfg=yellow

" Line number colors
hi LineNr ctermfg=blue ctermbg=0

" --------------- Bindings ------------------ "
" By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with.
" Press enter and then confirm each change you agree with y or decline with n.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Maps S to save file
nnoremap S :update<CR>

" Maps q to exit file
nnoremap q :q<CR>

" Maps Q to force exit file
nnoremap Q :q!<CR>

" Maps redo to U
nnoremap U :redo<CR>


" Opens nerdtree file explorer
map <C-o> :NERDTreeToggle<CR>

" Multiple cursors
let g:multi_cursor_start_word_key = '<C-n>'

" Set Leader to Space
let mapleader = "\<Space>"

" Toggles comment with Ctrl+/ NOT _, vim for some reason registers <C-/> as
" <C-_>
map <C-_> <plug>NERDCommenterToggle

" Maps leader(space) to be same as leader-w
map <Leader> <Plug>(easymotion-w)

" Enables moving lines with alt (for loop is needed to make urxvt work with
" the alt key)
for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <A-".c.">"
  exec "map! \e".c." <A-".c.">"
endfor
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
