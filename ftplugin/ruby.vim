" Abbreviations

func Eatchar(pat) " used to remove the space after expanding
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

" expands dend to do end block
:iab dend do
\<CR>
\<CR>end<UP>

" expands do |to do parametar end block
:iab dpend do \|\|
\<CR>end<UP><END><LEFT><C-R>=Eatchar('\s')<CR>

" expands if. to if with end
:iab if. if
\<CR>end<ESC>hhi<bs><UP><END>

" expands class. to class with end
:iab class. class
\<CR>end<UP><END>
