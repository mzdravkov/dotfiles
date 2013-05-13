" Abbreviations (should have endwise to work properly)

func! Eatchar(pat) " used to remove the space after expanding
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

" expands bp. to { || }
:iab bp. { \|\| }<LEFT><LEFT><LEFT><C-R>=Eatchar('\s')<CR>
