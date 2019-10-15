set nocompatible
set visualbell

let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'vim-airline')

execute pathogen#infect()

set t_Co=256
colorscheme xoria256


" syntax highlighting and filetype/plugin/indent stuff
syntax on
filetype plugin indent on

" default: spaces, 4 spaces per tab, 4 spaces per shift
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" autocmds

" python: textwidth of 120
autocmd FileType python set textwidth=120
" lisp: lisp mode, auto indent
autocmd FileType lisp set lisp autoindent
" clojure: map return to :Eval (from fireplace.vim)
autocmd FileType clojure call ClojureOptions()
function ClojureOptions()
    nmap <Leader><Enter> :%Eval<CR>
    nmap <Enter> :Eval<CR>
endfunction

autocmd FileType cpp call CppOptions()
autocmd FileType ino call CppOptions()
autocmd FileType pde call CppOptions()
function CppOptions()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction

"NOTE: commented out hidden just to see if i'll miss it
" set hidden " Allow hidden unsaved buffers
set laststatus=2 " Always show status line

" Menu Completion
set wildmenu
set wildmode=longest,list

" Intelligent case searching
set ignorecase
set smartcase
" highlight search term while typing
set incsearch

" Invisible characters
set listchars=tab:>-,trail:-

set showmatch " Parenthesis matching

set title " Set title

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set ruler " Show ruler

" 80 character width plus highlighting boundary
"set textwidth=80
set colorcolumn=+1
hi ColorColumn ctermbg=darkgray

set backspace=eol,start,indent " Backspace config

let g:mapleader = ";"

" Leader maps
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>s :set list! list?<CR>
nmap <Leader>n :set number! number?<CR>
nmap <Leader>h :set hlsearch! hlsearch?<CR>
nmap <Leader>k :bn<CR>
nmap <Leader>j :bp<CR>
nmap <Leader>o :b#<CR>
nmap <Leader>t :tabnew<Space>
nmap <Leader>m :make<CR>

" FuzzyFinder
nmap <Leader>f :FZF<CR>
nmap <Leader>l :FufLine<CR>
nmap <Leader>b :FufBuffer<CR>

" Tags/goto defn
" nmap <Leader>g <C-]><CR>
" nmap <Leader>G :pop<CR>
" close the preview window
" nmap <Leader>x :pc<CR>
" Line and character selection, using home row keys.  Conflicts mapped out of the way using the leader key
nmap <Leader>J :join<CR>
"nmap <Leader>K :
nnoremap <Leader>H H
nnoremap <Leader>L L

nmap J V
vmap J j

nmap K V
vmap K k

nmap L vl
vmap L l

nmap H vh
vmap H h


" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

"    \ ['black',       'SeaGreen3'],
au BufRead,BufNewFile *.hl setfiletype clojure
au BufRead,BufNewFile *.boot setfiletype clojure
"let g:vim_arduino_auto_open_serial = 1

autocmd BufWritePre * :%s/\s\+$//e

let g:jsx_ext_required = 1

autocmd FileType javascript set formatprg=prettier\ --parser\ babel\ --stdin
"autocmd BufWritePre *.js :normal gggqG

set undodir=~/.local/share/vim/undodir
set undofile

set rtp+=/usr/local/opt/fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

set statusline+=%{gutentags#statusline()}
