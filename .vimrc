set t_Co=256
"imap <buffer> <M>it <Plug>Tex_InsertItemOnThisLine
" Vim doesn't like fish
set shell=/bin/bash
" Vundle config
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" FIXME: remove hard-coded path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'vimwiki/vimwiki'
"Plugin 'editorconfig/editorconfig-vim'
"Plugin 'vim-scripts/opencl.vim'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
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
" Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'
Plugin 'Lokaltog/vim-distinguished'
" Plugin 'tomasr/molokai'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
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

call vundle#end()			 " required

" Rule for YCM
" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>
"let g:ycm_auto_trigger = 1

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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1 "Not working ??
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

nnoremap <Tab> :bnext <CR>
nnoremap <S-Tab> :bprevious <CR>

" nnoremap j gj
" nnoremap k gk

imap jj <Esc>
nnoremap gb :ls<CR>:b<Space>



" Always show a status line
set laststatus=2

" Switch on file-specific plugins and indenting
filetype plugin on
filetype indent on

let python_highlight_all=1
" Enable syntax highlighting and set an appropriate colour-scheme
syntax on
"colorscheme solarized
set background=dark
" colorscheme Tomorrow-Night-Bright
" colorscheme Tomorrow-Night-Eighties
colorscheme gruvbox
set laststatus=2
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '░'
" Disable powerline arrows and setting blank seperators creates a rectangular box
let g:airline_left_sep = '█▓░'
let g:airline_right_sep = '░▓█'

" I like these colours for the status bar rather than the zenburn ones. They
" are just the default but with fg and bg reversed.
" hi StatusLine	   guibg=#313633 guifg=#ccdc90
" hi StatusLineNC    guibg=#2e3330 guifg=#88b090
" hi StatusLine	   ctermbg=236	 ctermfg=186
" hi StatusLineNC    ctermbg=235	 ctermfg=108

" Enable man-page reading via the :Man command
runtime ftplugin/man.vim

" Re-generate omni-complete ctags file via CRTL-F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" If we're using the DoxygenToolkit plugin, set the comment style to be C++ style.
let g:DoxygenToolkit_commentType="C++"

" Enable enhanced syntax highlighting for doxygen.
let g:load_doxygen_syntax=1

" For C++ files, add Doxygen-style comments to the accepted styles
autocmd Filetype c,cpp set comments^=:///

" I never write common LISP but quite often write OpenCL kernels :)
autocmd BufRead,BufNewFile *.cl set filetype=opencl
autocmd BufRead,BufNewFile *.cl set cindent

" With fugitive, auto-delete buffers when we move out of them and show the
" current git branch name in the status line.
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

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
nmap <F12> :NERDTreeToggle<CR>

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
set noexpandtab
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
set directory=$HOME/.vim/tmp//

" Make pylint slightly less spammy
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--disable invalid-name,missing-docstring,fixme"

" Support using jsxhit rather than jshint with syntasic
autocmd BufRead,BufNewFile *.jsx let g:syntastic_javascript_checkers = ['jsxhint']

" Load leader key commands
source $HOME/.vim/leaders.vim

" Highlight column 1 after textwidth
set textwidth=80
set colorcolumn=+1

" Make colorcolumn look nicer
hi ColorColumn guibg=#262626 ctermbg=235

" Don't start with any folds
set foldlevelstart=99

" Specific autocmds
source $HOME/.vim/autocmds.vim

" vim:sw=2:sts=2:et

set cursorline
set foldmethod=indent
nnoremap <space> za
vnoremap <space> zf

