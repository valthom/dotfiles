set t_Co=256
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm""]"
"]"
"imap <buffer> <M>it <Plug>Tex_InsertItemOnThisLine
" Vim doesn't like fish
set shell=/bin/zsh
" Vundle config
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" FIXME: remove hard-coded path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

" Other plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround.git'
"Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
"Plugin 'vimwiki/vimwiki'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'godlygeek/csapprox'
"Plugin 'editorconfig/editorconfig-vim'
"Plugin 'vim-scripts/opencl.vim'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'tpope/vim-vinegar'
"
" Vim bar theme
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'killphi/vim-ebnf'
"Plugin 'groenewege/vim-less'
"Plugin 'tpope/vim-abolish'
"
" Colors
" Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'baskerville/bubblegum'
" Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'
Plugin 'Lokaltog/vim-distinguished'
" Plugin 'tomasr/molokai'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'lervag/vimtex'
" Plugin 'vim-scripts/auctex.vim'
"Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kshenoy/vim-signature'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomtom/tcomment_vim' "gc movement to comment. eg gcap to comment paragraph
Plugin 'christoomey/vim-sort-motion' "ga movement to sort lines
Plugin 'vim-scripts/ReplaceWithRegister' "gr. eg griw replace current word with default regster
Plugin 'wellle/targets.vim' "add various text objects \", (, ', $ in commands

" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
"
" " Optional:
" Plugin 'honza/vim-snippets'
" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'


call vundle#end()            " required

" Rule for YCM
" Apply YCM FixIt
"map <F9> :YcmCompleter FixIt<CR>
"let g:ycm_auto_trigger = 1
let g:jedi#popup_on_dot = 0
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = '<C-@>'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
set omnifunc=syntaxcomplete#Complete

" General editor options
set modeline
set number
set relativenumber
set ttyfast
set confirm

" Tab-completion behaviour
set wildmenu
set wildmode=list:full
set lazyredraw

set splitright
set splitbelow

set autoread
set autoindent copyindent
set nopreserveindent
set nosmartindent

set hlsearch
set incsearch       " While typing a search command, show immediately where the
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_insertion = 1 "Not working ??

"let g:ycm_add_preview_to_completeopt = 1
" Enable spell checking
"set spell
"set spelllang=en_gb
"set spelllang=fr.utf-8.spl
":setlocal spell spelllang=fr:w
hi clear SpellBad
hi SpellBad cterm=underline

" spell checking
function! ToggleSpellLang()
  " toggle between en and fr
  if &spelllang =~# 'en'
    set spelllang=fr
  else
    set spelllang=en
  endif
endfunction
nnoremap <F7> :setlocal spell!<CR> " toggle
"spell on or off
nnoremap <F8> :call ToggleSpellLang()<CR> "
"toggle language

nnoremap <C-n> :bnext <CR>
nnoremap <C-p> :bprevious <CR>
imap <C-e> <C-o>$
imap <C-a> <C-o>0

cmap w!! w !sudo tee % > /dev/null

" nnoremap j gj
" nnoremap k gk




" Always show a status line
set laststatus=2

" Switch on file-specific plugins and indenting
filetype plugin on
filetype indent on

let python_highlight_all=1
" Enable syntax highlighting and set an appropriate colour-scheme
"colorscheme solarized
set background=dark
syntax on
" hi StatusLine    guibg=#313633 guifg=#ccdc90
" hi StatusLineNC    guibg=#2e3330 guifg=#88b090
" hi StatusLine    ctermbg=236   ctermfg=186
" hi StatusLineNC    ctermbg=235     ctermfg=108
" colorscheme Tomorrow-Night-Bright
" colorscheme Tomorrow-Night-Eighties
colorscheme gruvbox
"highlight Special ctermfg=Black
"highlight nonText ctermfg=White
highlight Normal ctermbg=None

set laststatus=2
let g:airline_theme='gruvbox'
let g:airline_theme='bubblegum'

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '░'
" Disable powerline arrows and setting blank seperators creates a rectangular box
" let g:airline_left_sep = '█▓░'
" let g:airline_right_sep = '░▓█'

" I like these colours for the status bar rather than the zenburn ones. They
" are just the default but with fg and bg reversed.
"nnoremap <F5> :GundoToggle<CR>

" Enable man-page reading via the :Man command
runtime ftplugin/man.vim

"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Set the default encoding to be UTF-8
set encoding=utf-8

" Enable local .vimrcs
set exrc

" let g:clang_use_library=1
" let g:clang_library_path="/usr/lib/llvm-3.2/lib/"

" Use F12 to toggle filesystem tree on and off
" HACK to make .md mean markdown and not modula2
autocmd BufWinEnter *.{md,mkd,mkdn,mark*} silent setf markdown

" When using the vim-markdown plugin, this maps code-block language names
" to the syntax highlighter to use. Add things here as one uses them.
let g:markdown_fenced_languages = ["javascript", "python", "css", "html", "console=sh", "latex"]

" Set characters to show for trailing whitespace/tabs
set list
set listchars=tab:›\ ,trail:·

"set tabstop=8 softtabstop=0 noexpandtab shiftwidth=4 smarttab
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab
set noruler
%retab!


" Ignore VCS directories and virtual environments
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules|bower_components|venv[23]?)$'

" Some files we definitely do not want to complete when matching files or
" directories
set wildignore+=*.egg,*.egg-info,*.pyc,*.pdf,*.log,*.aux,*.out,*.dvi " Python and LaTeX-related files

" Specify that we store swap files inside ~/.vim.
" TODO: make this portable to non-Unix systems
"set directory=$HOME/.vim/tmp//
set noswapfile



let mapleader = " "
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>s :w<CR>
" Load leader key commands
" source $HOME/.vim/leaders.vim

" Highlight column 1 after textwidth
set textwidth=80
set colorcolumn=+1

" Make colorcolumn look nicer
hi ColorColumn guibg=#262626 ctermbg=235

" Don't start with any folds
set foldlevelstart=99

" Specific autocmd
" source $HOME/.vim/autocmds.vim

" vim:sw=2:sts=2:et

set cursorline
set foldmethod=indent
nnoremap <space> za
vnoremap <space> zf

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-O> o<esc>
nnoremap ss i<Space><esc>
imap jj <esc>
nnoremap gb :ls<CR>:b<Space>

