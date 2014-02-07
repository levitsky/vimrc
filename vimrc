let mapleader = " "
set nocompatible    " no compatibility mode, must be the first option in the
set autochdir       " automatically change working directory
"set ls=2            " always show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set showmode        " show the current mode
"set hlsearch        " highlight searches
set incsearch       " do incremental searching
"set spell           " enable spellchecking 
set ruler           " show the cursor position all the time
"set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
"set nobackup        " do not keep a backup file
"set undofile        " create an undo file
set history=1000    " really long history and undo
set undolevels=1000
"set backupdir=~/.vim/tmp "tmp dir
"set directory=~/.vim/tmp "tmp dir
set number          " show line numbers
set ignorecase      " ignore case
set smartcase       " smart case when searching
"set gdefault        " global replacement by default
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
"set modeline        " last lines in document sets vim mode
"set modelines=3     " number lines checked for modelines
"set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
"set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

set wildmode=list:longest "BASH-like completion behaviour
"set autoindent     " always set autoindenting on
set smartindent        " smart indent
"set cindent            " cindent
"set noautoindent
"set nosmartindent
"set nocindent
set expandtab      " tabs are converted to spaces, use only when required

"!!!Folding
set foldenable
set foldmethod=syntax

set encoding=utf-8  " as it was said somewhere in the internets,
		    " welcome to 21st century

syntax on           " syntax highlighing
"set colorcolumn=+1
set background=dark        " adapt colors for background
colorscheme default
"if has("gui_running")
"    " See ~/.gvimrc
"    set guioptions=a          " remove the toolbar 
"    set guifont=Monospace\ 10  " use this font
"    set lines=50       " height = 50 lines
"    set textwidth=80   " width = 80 columns
"    let &columns=80+&numberwidth
"    "set selectmode=mouse,key,cmd
"    set keymodel=
"elseif &t_Co == 256
"    colorscheme oceanblack256
"else
"    colorscheme elflord
"endif

"editing
set backspace=indent,eol,start " backspace for dummies
set showmatch 		       " show matching brackets
" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk
" Tabulation using Tab/Shift-Tab (for gvim).
:nnoremap <Tab> >>
:nnoremap <S-Tab> <<
:vnoremap <Tab> >gv
:vnoremap <S-Tab> <gv
:inoremap <Tab> <C-t>
:inoremap <S-Tab> <C-d>
" Use ; instead of :
nnoremap ; :
" If I forget to switch the layout:
nnoremap жц :w
nnoremap ш i

" Clear highlighting
nnoremap <leader>/ :noh<cr>

" Save with sudo if opened without it
cmap w!! w !sudo tee % >/dev/null

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

highlight OverLength ctermfg=yellow
let disable_overlength = ['xml', 'html']

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  augroup file_types
      au!
      autocmd BufReadCmd *.doc execute "normal! :read !antiword %\<cr>:echo \"Converted with antiword\"\<cr>"
      autocmd FileType text :iabbrev <buffer> -- –
      match OverLength /\%81v.\+/
      autocmd FileType xml match none
  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" edit my vimrc file
nnoremap <leader>ev :split $MYVIMRC<cr>G
" source my vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

"highlight trailing whitespace
2match SpellRare /\s\+$/

" Always view diffs with vertical splits
let &diffopt = &diffopt . ',vertical'
" Load Pathogen
execute pathogen#infect()
