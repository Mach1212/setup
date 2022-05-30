" Install: 
" 	pip3 install pynvim 
" 	node.js
syntax on
set nofoldenable
set number relativenumber
set mouse=a
set autoindent
set completeopt=noinsert,menuone,noselect
set cc=80
set spell
set wrap

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
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdcommenter'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'ap/vim-css-color'
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'sirver/ultisnips'
  Plug 'luochen1990/rainbow'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" " DENITE
" " Use ripgrep for searching current directory for files
" " By default, ripgrep will respect rules in .gitignore
" "   --files: Print each file that would be searched (but don't search)
" "   --glob:  Include or exclues files for searching that match the given glob
" "            (aka ignore .git files)
" call denite#custom#var('file/rec', 'command',
        " ['rg', '--files', '--glob', '!.git'])
" " Use ripgrep in place of "grep"
" call denite#custom#var('grep', 'command', ['rg'])
" " Custom options for ripgrep
" "   --vimgrep:  Show results with every match on it's own line
" "   --hidden:   Search hidden directories and files
" "   --heading:  Show the file name above clusters of matches from each file
" "   --S:        Search case insensitively if the pattern is all lowercase
" call denite#custom#var('grep', 'default_opts',
        " ['--hidden', '--vimgrep', '--heading', '-S'])
" " Recommended defaults for ripgrep via Denite docs
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
" " Remove date from buffer list
" call denite#custom#var('buffer', 'date_format', '')

" COC
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=auto
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
let g:materialterminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

" NERDCOMMENTER
let g:NERDSpaceelims = 1
filetype plugin on
