set lines=79 columns=272

set guioptions=eg               " disable scrollbars, etc
set guifont=Monaco:h12         " nice font
" set guifont=Bitstream\ Vera\ Sans\ Mono:h12
set number                      " show line numbers
set showbreak=------>\  " line up soft-wrap prefix with the line numbers
set cpoptions+=n        " start soft-wrap lines (and any prefix) in the line-number area

syntax enable
set background=dark

colorscheme solarized

hi Normal guibg=#0F0F0F
hi rubyDefine guibg=#0F0F0F
highlight LineNr guibg=#1F1F1F
highlight MatchParen guibg=#404040

" ----------------------------------------------------------------------------
"  Window sizes
" ----------------------------------------------------------------------------
" set winwidth=84
" set winheight=13
" set winminheight=13
" set winheight=999
