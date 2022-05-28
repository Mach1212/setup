syntax on
set expandtab
set nofoldenable
set number relativenumber
set diffopt+=vertical
set mouse=a
set autoindent
set completeopt=noinsert,menuone,noselect
set cc=80
set spell

" OPTIONS
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
if (has('termguicolors'))
  set termguicolors
endif

" PLUGS
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'tpope/vim-fugitive'
call plug#end()

" MAPS
nnoremap <S-t> :NERDTreeToggle<CR>

" AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" NERDTREE
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let NERDTreeStatusline =""

" MATERIAL
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material
