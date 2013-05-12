set nocompatible
set mouse=a
set nu
set smartindent
set tabstop=2
set shiftwidth=2
set autoindent
"Settings for various plugins (which opens new subwindows)
"autocmd VimEnter * ConqueTermSplit bash
"autocmd VimEnter * resize 9
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * execute "normal \<C-w>k"
"Setting for vimClojure
let vimclojure#HighlightBuiltins = 1 " Highlight Clojure's builtins
let vimclojure#ParenRainbow = 1 	 " Rainbow parentheses

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

" Abbreviations

func Eatchar(pat) " used to remove the space after expanding
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

" Ruby
	" expands dend to do end block
	:iab dend do
	\<CR>
	\<CR>end<UP>

	" expands dpend to do parametar end block
	:iab dpend do \|\|
	\<CR>end<UP><END><LEFT><C-R>=Eatchar('\s')<CR>

	" expands if. to if with end
	:iab if. if
	\<CR>end<ESC>hhi<bs><UP><END>

	" expands class. to class with end
	:iab class. class
	\<CR>end<UP><END>

" Rails
	" expands erb. to <%  %>
	:iab erb. <% %><LEFT><LEFT><LEFT>

	" expands erbs. to <%=  %>
	:iab erbs. <%= %><LEFT><LEFT><LEFT>
