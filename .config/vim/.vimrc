" ****************************************
" Plugins
" ****************************************
set multiple-cursors
set commentary
set NERDTree
set easymotion
set ideajoin
set idearefactormode=keep
set surround

" ****************************************
" Vim Config
" ****************************************


" ****************************************
" Basic
" ****************************************
set showmode
set number          " Line numbers
set relativenumber  " Relative line numbers
set hlsearch        " Highlight whole word when searching
set ignorecase      " Ignore case when searching...
set smartcase       " ...except when serach query contains a capital letter
set ignorecase smartcase
set NERDTree
set showmode
set scrolloff=5
set history=1000
set surround
set incsearch
set relativenumber
set number
set smartcase
set hlsearch
set visualbell
set noerrorbells
set easymotion
set commentary
set ideajoin
set exchange
set multiple-cursors
set sneak

" Greatest remap EVER!! 
" Let me explain, this remap while in visiual mode
" will delete what is currently highlighted and replace it 
" with what is in the register BUT it will YANK (delete) it 
" to a VOID register. Meaning I still have what I originally had
" when I pasted. I don't loose the previous thing I YANKED!
vnoremap pp "_dP

" end
" ******************************************
" REMAP Y and P for clipboard usages
" * for main clipboard
" + for vim clipboard?
" *****************************************
noremap yy "*y
noremap pp "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
set clipboard+=ideaput
set clipboard+=unnamedplus

" ******************************************
" Remap for ideavim to show error description
" *****************************************
map gh :action ShowErrorDescription \| :action QuickJavaDoc<CR>
map gm :action HideAllWindows<CR>
map gu :action FindUsages<CR>
nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <C-w>q :action CloseContent<CR>

" ******************************************
" NERD Tree Keybinding
" ******************************************
" Toggle NERDTree and go to file with Find
" map NERDTree to Ctrl+Shift+E
nnoremap <C-S-e> :NERDTreeToggle<CR>
