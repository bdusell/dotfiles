set nocompatible
filetype off

" Configure Vundle
" See https://github.com/VundleVim/Vundle.vim

" Vundle commands:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins
" :PluginUpdate     - updates plugins
" :PluginSearch foo - searches for foo
" :PluginClean      - confirms removal of unused plugins
" To install from command line:
" vim +PluginInstall +qall

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Vundle plugins go here
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'chr4/nginx.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-pug'
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on

" Stop configuring vundle

" Restore cursor position
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Other options
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
       
set tabstop=8       " Number of spaces that a <Tab> in the file counts for.
 
"set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
"set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
"set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

"set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
"set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

" Disable paste when middle-clicking
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

filetype plugin indent on
syntax on

" Word-wrap plain text files
au BufNewFile,BufRead *.txt,README,README.* setlocal textwidth=79

" Treat .html.jst, .html.ejs as HTML
au BufNewFile,BufRead *.html.jst,*.html.ejs,*.ejs set filetype=html

" Treat .md as Markdown
au BufNewFile,BufRead *.md set filetype=markdown

" Treat Dockerfile* as Dockerfile
au BufNewFile,BufRead Dockerfile* set filetype=dockerfile

" Change indentation style to 2 spaces for these languages
au FileType html,css,sass,scss,eruby,ruby,cucumber,vim,less,javascript,coffee,sh,html.twig,yaml,json,pug,typescript,c,cpp setlocal softtabstop=2 shiftwidth=2 expandtab smarttab
au BufNewFile,BufRead *.html.php setlocal softtabstop=2 shiftwidth=2 expandtab smarttab

" Change indentation style to 4 spaces for these languages
au FileType python,nginx,dockerfile setlocal softtabstop=4 shiftwidth=4 expandtab smarttab

" For all other languages, use the default tabbed indentation style

" Add a command to revert to tabbed spacing
command TabbedSpacing setlocal softtabstop=8 shiftwidth=8 noexpandtab nosmarttab
command NoWrap setlocal formatoptions=c,q,r

" When indenting blocks, do not de-select
vnoremap < <gv
vnoremap > >gv

" Play nice with tools that perform automatic recompilation.
" See https://webpack.js.org/guides/development/#adjusting-your-text-editor
set backupcopy=yes

" This fixes a bug where the mouse does not work on the right side of the
" screen on very large monitors.
" See https://stackoverflow.com/questions/7000960/in-vim-why-doesnt-my-mouse-work-past-the-220th-column
set ttymouse=sgr
