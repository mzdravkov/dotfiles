call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'AndrewRadev/deleft.vim'
Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'https://github.com/AndrewRadev/splitjoin.vim'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'phaazon/hop.nvim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'puremourning/vimspector'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'Yggdroot/indentLine'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }


call plug#end()

lua <<EOF
require'hop'.setup()
EOF


" Change the theme
syntax enable
colorscheme tempus_day
set termguicolors

set expandtab
set nocompatible
filetype plugin on
syntax on
" set mouse=a
set nu
set smartindent
set tabstop=2
set shiftwidth=2
set hlsearch " higlight matches
set incsearch
set showmatch
" set relativenumber
set undofile
set gdefault


ca WQ wq
ca Wq wq
ca W w
ca Q q


cmap w!! w !sudo tee > /dev/null %

let mapleader = " "
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Move an item to the left or right with H and L respectively.
nnoremap H :SidewaysLeft<cr>
nnoremap L :SidewaysRight<cr>


" Setup a hotkey for using Hop to move to anywhere in the file
nnoremap <leader>h <cmd>HopAnywhere<cr>


" Trailing Whitespace fighter
function! s:FixWhitespace(line1,line2)
	let l:save_cursor = getpos(".")
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
	call setpos('.', l:save_cursor)
endfunction

" Run :FixWhitespace to remove end of line white space.
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \      '+': 'win32yank.exe -i --crlf',
            \      '*': 'win32yank.exe -i --crlf',
            \    },
            \   'paste': {
            \      '+': 'win32yank.exe -o --lf',
            \      '*': 'win32yank.exe -o --lf',
            \   },
            \   'cache_enabled': 0,
            \ }

" if has("clipboard")
"   if has("unnamedplus")
"     " When possible use + register for copy-paste
"     set clipboard=unnamed,unnamedplus
"   else
"     " On Mac or Windows use * register for copy-paste
"     set clipboard=unnamed
"   endif
" endif



let g:vimspector_enable_mappings='HUMAN'
