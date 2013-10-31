execute pathogen#infect()
syntax on
set nocompatible
set mouse=a
set nu
set smartindent
set tabstop=2
set shiftwidth=2
"set autoindent
set hlsearch " higlight matches
set incsearch
set showmatch
set relativenumber
set undofile
set gdefault
"set clipboard=unnamed
"Settings for various plugins (which opens new subwindows)

set background=dark
colo solarized
"colorscheme molokai
"let g:molokai_original=0 "Setting for vimClojure let vimclojure#HighlightBuiltins = 1 " Highlight Clojure's builtins let vimclojure#ParenRainbow = 1 	 " Rainbow parentheses
"set clipboard=unnamed
"Settings for various plugins (which opens new subwindows)

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"autocmd VimEnter * execute "normal \<C-w>k"
"Setting for vimClojure
"let vimclojure#HighlightBuiltins = 1 " Highlight Clojure's builtins
"let vimclojure#ParenRainbow = 1 	 " Rainbow parentheses
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" the above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/


" Trailing Whitespace fighter
function! s:FixWhitespace(line1,line2)
	let l:save_cursor = getpos(".")
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
	call setpos('.', l:save_cursor)
endfunction

	" Run :FixWhitespace to remove end of line white space.
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

filetype plugin indent on
autocmd BufNewFile,BufRead *.rb setlocal filetype=ruby
autocmd BufNewFile,BufRead *.erb source ~/.vim/ftplugin/erb.vim

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap [      []<Left>

ca WQ wq
ca Wq wq
ca W w
ca Q q
ca bg set keymap=bulgarian
