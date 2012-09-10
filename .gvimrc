set lines=79 columns=272

set guioptions=eg               " disable scrollbars, etc
set guifont=Monaco:h11         " nice font
" set guifont=Bitstream\ Vera\ Sans\ Mono:h12
set number                      " show line numbers

syntax enable
set background=dark
colorscheme solarized
hi Normal guibg=Black
hi rubyDefine guibg=Black

" Don't want the line numbers to jump out and grab attention
highlight LineNr guibg=#161616

" Make it a little more prominent than the default so I can actually see it.
highlight MatchParen guibg=#234B96

" ----------------------------------------------------------------------------
"  Window sizes
" ----------------------------------------------------------------------------
" set winwidth=84
" set winheight=13
" set winminheight=13
" set winheight=999
