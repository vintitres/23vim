set nocompatible  " be iMproved

set shell=bash

""""""""""
" Vundle "
""""""""""
filetype off  " required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" NOTE: comments after Bundle command are not allowed..

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles:
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'skwp/vim-colors-solarized'
Bundle 'sjl/gundo.vim'
Bundle 'The-NERD-tree'
Bundle 'comments.vim'
Bundle 'christoomey/vim-tmux-navigator'

Bundle 'hynek/vim-python-pep8-indent'
"Bundle 'iynaix/django.vim'
"Bundle 'sjl/dotfiles', {'rtp': 'vim/bundle/django-custom'}

"Bundle 'promela.vim'
"Bundle 'petRUShka/vim-opencl'

" To check:
"Bundle 'wincent/Command-T'
"Bundle 'rstacruz/sparkup'
"Bundle 'FuzzyFinder'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ




" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set laststatus=2
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set scrolloff=5

" Don't use Ex mode, use Q for formatting
map Q gq

" In an xterm the mouse should work quite well, thus enable it.
" set mouse=a

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
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
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis


"
"
" HERE starts the section with my owne settings
" 
"

"color evening

" UI
"color cs
if has("gui_running")
    set guifont=Courier\ New
endif

set nowrap

" when wrap ... motions
map <Up> gk
map <Down> gj
set whichwrap=<,>,[,],b,s

set fileencodings=utf-8,latin2
"set encoding=utf-8

set tabstop=2

set shiftwidth=2 softtabstop=2 expandtab

if &t_Co > 2 || has("gui_running")
  " folding
  set foldcolumn=0
  set foldlevel=10000
  set foldmethod=indent
  highlight Folded ctermbg=black ctermfg=blue
  highlight FoldColumn ctermbg=black ctermfg=darkgrey
endif


" searching
set ignorecase smartcase

"let Tlist_Exit_OnlyWindow=1
"let Tlist_Auto_Open=1
"let g:bufExplorerShowRelativePath=1
"let g:bufExplorerShowUnlisted=1

"function! SwitchToNextBuffer(incr)
"  let help_buffer = (&filetype == 'help')
"  let current = bufnr("%")
"  let last = bufnr("$")
"  let new = current + a:incr
"  while 1
"    if new != 0 && bufexists(new) && ((getbufvar(new, "&filetype") == 'help') == help_buffer) && (getbufvar(new, "&filetype") != 'taglist')
"      execute ":buffer ".new
"      break
"    else
"      let new = new + a:incr
"      if new < 1
"        let new = last
"      elseif new > last
"        let new = 1
"      endif
"      if new == current
"        break
"      endif
"    endif
"  endwhile
"endfunction
"nnoremap <silent> <C-n> :call SwitchToNextBuffer(1)<CR>
"nnoremap <silent> <C-p> :call SwitchToNextBuffer(-1)<CR>

" Faster window switching
"map <C-j> <C-W><C-J>
"map <C-k> <C-W><C-K>
"map <C-l> <C-W><C-L>
"map <C-h> <C-W><C-H>

" Autocomplete
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
    \ "\<lt>C-n>" :
    \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
"Ptyhon problems
autocmd FileType python set omnifunc=
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"let mapleader = ","
" set hidden
set title
set wildmenu
set wildmode=list:longest,full
nmap <silent> <C-n> :tabn<CR>
imap <silent> <C-n> <Esc>:tabn<CR>i
nmap <silent> <C-p> :tabp<CR>
imap <silent> <C-p> <Esc>:tabp<CR>i
nmap <silent> <C-o> :tabnew<CR>
imap <silent> <C-o> <Esc>:tabnew<CR>
nmap <silent> <C-a> :ConqueTermVSplit bash<CR>
imap <silent> <C-a> <Esc>:ConqueTermVSplit bash<CR>
"nmap <silent> <C-w> :tabclose<CR>
"imap <silent> <C-w> <Esc>:tabclose<CR>i
set nobackup
set nowritebackup
set tags=.TAGS;$HOME
nmap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
imap <C-\> <Esc>:tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Solarized theme
syntax enable
let g:solarized_termtrans=1
let g:solarized_bold=0
set background=dark
colorscheme solarized

" Error marking
hi clear SpellBad
hi SpellBad ctermbg=blue ctermfg=white

" Too long lines
set colorcolumn=80,81
"set tw=80
"hi ColorColumn ctermfg=blue

" Remove Trailing Spaces in files
autocmd BufWritePre *.cc :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.svg :%s/\s\+$//e


"set shell=bash\ --login

set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'
"let g:Powerline_theme = 'solarized256'


"cmap w!! w! !sudo tee % >/dev/null<CR>:e!<CR><CR>
