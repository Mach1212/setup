" Install:
"   https://github.com/ryanoasis/powerline-extra-symbols/blob/86c2cde05f7c34bac34f958bb67c553ab3674aa3/patched-fonts/DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf
" 	pip3 install pynvim
" 	node.js
" 	CocInstall coc-marketplace

syntax on
set signcolumn=auto
set nofoldenable
set number relativenumber
set mouse=a
set autoindent
set completeopt=noinsert,menuone,noselect
set cc=80
set spell
set wrap
set iskeyword&
set expandtab
set tabstop=4
set shiftwidth=4
nnoremap v <c-v>

" OPTIONS
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
if (has('termguicolors'))
  set termguicolors
endif

" PLUGS
call plug#begin()
  " Color
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'ap/vim-css-color'
  " Navigation
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  " Command line
  Plug 'tpope/vim-fugitive'
  " UI
  Plug 'airblade/vim-gitgutter'
  " Coding
  Plug 'preservim/nerdcommenter'
call plug#end()

" MATERIAL
let g:materialterminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

" AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" TREESITTER
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash","c","cmake","cpp","css","dockerfile","html","java","javascript","json","lua","make","python","regex","rust","scss","toml","typescript","vim","yaml" },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
    indent = {
      enable = true
    },
  },
}
EOF

" FZF
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResourcesRpc project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatusRpc<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActionsRpc<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffersRpc<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffersRpc<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResourcesRpc buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumpsRpc<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChangesRpc<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrepRpc<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrepRpc<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTagsRpc<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFixRpc<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationListRpc<CR>

" NERDCOMMENTER
let g:NERDSpaceelims = 1
filetype plugin on








