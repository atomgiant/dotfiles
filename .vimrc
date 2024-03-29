
" ---------------------------------------------------------------------------
" Vundle initialization
" ---------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My bundles
Plugin 'altercation/vim-colors-solarized'
Plugin 'chrisbra/Colorizer'
Plugin 'chrisbra/csv.vim'
Plugin 'dense-analysis/ale'
Plugin 'duff/vim-trailing-whitespace'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fidian/hexmode'
Plugin 'github/copilot.vim'
Plugin 'godlygeek/tabular'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'yegappan/greplace'

runtime macros/matchit.vim
filetype plugin indent on     " required!

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------
set nocompatible
let mapleader = ","
set history=1000                              " lots of command line history
set viminfo='10,\"0,:20,%,n~/.viminfo         " remember certain things when we exit
set autoread                                  " reload files changed outside of Vim
set autowrite                                 " some commands should cause an automatic write
set nrformats=                                " improves incrementing when there are leading 0's.
set tags=.git/tags,tags                       " search current, then root tags
set foldmethod=syntax
set foldlevel=99


" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
set ruler                             " show the cursor position all the time
set backspace=start,indent,eol        " allow backspacing over anything in insert mode
set wm=2                              " wrap margin on the right
set scrolloff=2                       " keep some context when scrolling
set antialias                         " of course
set synmaxcol=200                     " limit syntax highlighting for long lines

" wrap config
set wrap
set linebreak
set nolist     " list disables linebreak
set textwidth=0
set wrapmargin=0

" ----------------------------------------------------------------------------
"  Visual cues
" ----------------------------------------------------------------------------
set laststatus=2                " always show the status line
set visualbell                  " quiet
set noerrorbells                " quiet
set showcmd                     " show size of visual selection
set wildmode=longest,list,full  " longest common string, then list, then full
set wildmenu                    " show possible matches for command completions using tab


" ----------------------------------------------------------------------------
"  NerdTree config
" ----------------------------------------------------------------------------
let NERDTreeWinSize=31                " how wide nerdtree ought to be
let NERDTreeMinimalUI=1               " don't need to the noise
let NERDTreeDirArrows=1               " prettier arrows
let NERDTreeIgnore=[]


" ----------------------------------------------------------------------------
"  Notes config
" ----------------------------------------------------------------------------
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
let g:notes_title_sync = 'change_title'

" ----------------------------------------------------------------------------
"  Tabs
" ----------------------------------------------------------------------------
set tabstop=2
set softtabstop=2          " yep, two
set shiftwidth=2
set nosmarttab             " no tabs, thanks.
set autoindent             " automatically indent new lines
set expandtab              " expand tabs to spaces


" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------
set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=~/.vim/backups           " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/tmp               " where to keep swp files

" ----------------------------------------------------------------------------
"  Searching
" ----------------------------------------------------------------------------
nnoremap / /\v
vnoremap / /\v
set ignorecase              " make searches case insensitive
set smartcase               " care about case sensitivity if there's a capital letter
set incsearch               " do incremental searching
set nohlsearch              " don't highlight searches


" ---------------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------------

" show/hide nerdtree
nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" highlight the current buffer in the nerdtree
nnoremap <leader>n :NERDTreeFind<CR>

" make it easy to move to adjacent files in the dir
nmap gj :NERDTreeFind<CR><C-j><Enter>
nmap gk :NERDTreeFind<CR><C-k><Enter>

" navigating search results
nnoremap <leader>1 :cprevious <CR>
nnoremap <leader>2 :cnext <CR>

" space is much easier to press than %
map <space> %

" move between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" resize windows
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>
nmap <C-Up> <C-W>+<C-W>+
nmap <C-Down> <C-W>-<C-W>-

" method navigation
map <leader>J ]m
map <leader>j ]M
map <leader>k [m
map <leader>K [M

" add the dir of the current file to the command
cnoremap %% <C-R>=expand('%:h').'/'<cr>

set wildignore+=*/vendor/plugins/**,*/vendor/ruby/**,*/vendor/gems/**,*/vendor/cache/**,*/vendor/rails/**,*/public/assets/**,*/coverage/**,*/tmp/**,*/node_modules/**,*/deps/**,*/priv/**


" ack shortcuts
nnoremap <leader>A :Ack<cword><CR>
nnoremap <leader>a :Ack<space>
vmap <leader>A "ry:Ack<space>"<C-r>r"<CR>

" normal mode shortcuts
nmap <leader><Enter> [<space>
nnoremap <leader><space> i<space><Esc>

" Easier to get to the end of the line
noremap gl g_

" Easier to get to the first non-blank character of the line
noremap gh ^

" switch between a symbol and a string
nmap <leader>: ds"i:<Esc>e
nmap <leader>" csw"hxl

" ctags shortcuts
nmap <C-\> <C-]>
nmap g<C-\> g]

" easily back to normal mode
inoremap ;; <Esc>
inoremap ¬ <Esc>
inoremap jj <Esc>

" auto expand brackets
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" auto complete shortcut
imap <S-space> <C-n>

" hash syntax shortcut
inoremap <C-l> <space>=><space>

" allow multiple pastes of the same content when pasting in visual mode.
vnoremap p pgvy

" delete the line below/above the current cursor position
nnoremap do jddk^
nnoremap dO kdd^

" Shortcut to make splits
nnoremap <leader>s :sp<cr><C-w>j
nnoremap <leader>v :vsp<cr><C-w>l

" edit vimrc
nmap <leader>c :sp ~/.vimrc<CR><C-W>_
nmap <leader>C :source $MYVIMRC<CR>:source $MYGVIMRC<CR>:filetype detect<CR><leader>d<leader>d<C-L>:exe ":echo 'vimrc reloaded'"<CR>

" Remove trailing whitespace
nnoremap <leader>h :FixWhitespace<cr>

" Save a few keystrokes
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Bubble lines
nmap ˚ [e
nmap ∆ ]e
vmap ˚ [egv
vmap ∆ ]egv

" Easily replay the macro recorded in register q
nnoremap <Leader>m @q

" Hook up ctrl-i to navigate the jump list. I don't know why ctrl-i
" doesn't seem to work for me by default.
nmap <C-i> <C-tab>

" Better goto mark default
nnoremap ' `
nnoremap ` '

" show/hide gundo
nnoremap <leader>g :GundoToggle<CR>

" switch between the last 2 files
nnoremap go <c-^>

" switch to a 1.9 hash
nnoremap <leader>y F:xea:<esc>llxxx

" some rails helpers
nnoremap <leader>gr :topleft :split config/routes.rb<cr>
nnoremap <leader>gg :topleft 100 :split Gemfile<cr>
nnoremap <leader>r :Rake<CR>
nnoremap <leader>R :.Rake<CR>

" hex mode
nnoremap <leader><leader>x :Hexmode<CR>

" ---------------------------------------------------------------------------
"  ALE
" ---------------------------------------------------------------------------

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'json': ['eslint'],
\   'ruby': ['rubocop'],
\}

" ---------------------------------------------------------------------------
"  CtrlP
" ---------------------------------------------------------------------------
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPClearCache<CR>:CtrlP<CR>

let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_working_path_mode = 0
" make ctrlp faster
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ctrlp_max_files=0
" let g:ctrlp_clear_cache_on_exit = 0

" ---------------------------------------------------------------------------
"  EasyAlign
" ---------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ---------------------------------------------------------------------------
"  primary rails navigation
" ---------------------------------------------------------------------------
nnoremap <leader><leader>m :CtrlP app/models<cr>
nnoremap <leader><leader>v :CtrlP app/views<cr>
nnoremap <leader><leader>c :CtrlP app/controllers<cr>
nnoremap <leader><leader>h :CtrlP app/helpers<cr>
nnoremap <leader><leader>l :CtrlP lib<cr>
nnoremap <leader><leader>f :CtrlP features<cr>
nnoremap <leader><leader>u :CtrlP test<cr>
nnoremap <leader><leader>r :CtrlP spec<cr>
nnoremap <leader><leader>o :CtrlP doc<cr>
nnoremap <leader><leader>p :CtrlP app/presenters<cr>
nnoremap <leader><leader>j :CtrlP app/assets/javascripts<cr>
nnoremap <leader><leader>s :CtrlP app/assets/stylesheets<cr>

nnoremap <leader><leader>i :Rinitializer<space>
nnoremap <leader><leader>e :Renvironment<space>
nnoremap <leader><leader>j :Rjavascript<space>
nnoremap <leader><leader>t :Rtask<space>
nnoremap <leader><leader>d :Rmigration<space>

" ---------------------------------------------------------------------------
"  custom commands - use these at the : command prompt
" ---------------------------------------------------------------------------

" Forgot to `sudo vim`.  This saves the file anyway.
command! SudoWrite w !sudo tee %

" Reload snipmate snippets
command! SnipmateReloadSnippets call ReloadAllSnippets()


" ---------------------------------------------------------------------------
"  rails.vim autocommands
" ---------------------------------------------------------------------------
autocmd User Rails silent! Rnavcommand feature           features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand stepdefinitions   features/step_definitions -glob=**/* -suffix=_steps.rb


" ---------------------------------------------------------------------------
"  Status line customization
" ---------------------------------------------------------------------------
set statusline=
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" ---------------------------------------------------------------------------
"  Gundo customization
" ---------------------------------------------------------------------------
let g:gundo_right=1

" ---------------------------------------------------------------------------
"  ctags-vim-johnson customization
" ---------------------------------------------------------------------------
let g:ctags_statusline=1

" ---------------------------------------------------------------------------
"  Colors/Theme
" ---------------------------------------------------------------------------
syntax on

" Colorizer
" let g:colorizer_auto_filetype='scss,css,html,erb'
" let g:colorizer_skip_comments = 1

" ---------------------------------------------------------------------------
"  Surround plugin - allow # to be used for string interpolation.
" ---------------------------------------------------------------------------
autocmd FileType ruby let g:surround_113 = "#{\r}"   " v
autocmd FileType ruby let g:surround_35  = "#{\r}"   " #

" ---------------------------------------------------------------------------
"  Ragtag plugin
" ---------------------------------------------------------------------------
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" ---------------------------------------------------------------------------
" persistent undo
" ---------------------------------------------------------------------------
if v:version >= 703    " Only available in Vim 7.3 or greater
  set undofile
  set undodir=~/.vim/.undo
endif

" ---------------------------------------------------------------------------
"  Buffers
" ---------------------------------------------------------------------------
set hidden                                    " Let me leave buffers even when they're changed.

" Write all named, changed buffers when Vim loses focus
au BufLeave,FocusLost * silent! :wall

" ---------------------------------------------------------------------------
"  Misc stuff
" ---------------------------------------------------------------------------
set grepprg=ack
set grepformat=%f:%l:%m
set completeopt=longest,menu,preview        " insert mode comletion options
set complete=.

" Improve navigation of the popup menu for completion.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Yank to the * register (system clipboard) to easily paste into other apps.
set clipboard+=unnamed


augroup myfiletypes
  "clear old autocmds in group
  autocmd!

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml set ai sw=2 sts=2 et
augroup END

let g:liquid_highlight_types=["html","erb=eruby","html+erb=eruby.html"]

" vim-liquid: Set filetype for Shopify alternate templates
au BufNewFile,BufRead */templates/**.liquid,*/layout/**.liquid,*/snippets/**.liquid
      \ let b:liquid_subtype = 'html' |
      \ set ft=liquid |
au BufNewFile,BufRead */assets/**.js.liquid
      \ let b:liquid_subtype = 'javascript' |
      \ set ft=liquid |

" Read vue as html
au BufRead,BufNewFile *.vue set ft=html
au BufRead,BufNewFile *.md.erb set ft=markdown

" ---------------------------------------------------------------------------
"  Jump to last saved position of buffer when re-opening
" ---------------------------------------------------------------------------
autocmd BufReadPost *
  \ if !(bufname("%") =~ '\(COMMIT_EDITMSG\)') && line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" ---------------------------------------------------------------------------
"  Open url on current line in browser
" ---------------------------------------------------------------------------
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
nmap <Leader>b :call HandleURI()<CR>


" ---------------------------------------------------------------------------
" Allow toggling of the quickfix window
" ---------------------------------------------------------------------------
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen 15"
  endif
endfunction
nmap Q :QFix<CR>

augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END


if $TERM == 'screen'
  set term=xterm
endif
