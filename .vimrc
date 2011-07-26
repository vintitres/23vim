set nocompatible

" Pathogen
call pathogen#infect()                                                          

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set scrolloff=5

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

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

" save / close 
map <F2> :w<CR>
imap <F2> <ESC><F2>a
map <F10> :q<CR>
imap <F10> <ESC><F10>a

" default comment/uncomment
map <C-D> :s@^[[:space:]]*@&#@g<CR>:nohls<CR>
map <C-U> :s@^\([[:space:]]*\)#@\1@g<CR>:nohls<CR>


set fileencodings=utf-8,latin2
"set encoding=utf-8

set tabstop=4 " every tab is 8-spaces long

" indentation is always 4-spaces long and tabs are used
set shiftwidth=4 softtabstop=4 expandtab

" gT C++ environment
"set shiftwidth=8 softtabstop=8 noexpandtab

" SMK C++ environment
" indentation is always 4-spaces long and tabs are used


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
map <C-j> <C-W><C-J>
map <C-k> <C-W><C-K>
map <C-l> <C-W><C-L>
map <C-h> <C-W><C-H>

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
"nmap <silent> <C-l> :ConqueTermVSplit bash<CR>
"imap <silent> <C-l> <Esc>:ConqueTermVSplit bash<CR>
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

" Git branch show
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Error marking
hi clear SpellBad
hi SpellBad ctermbg=blue

" Too long lines
hi clear OverLength
hi OverLength ctermbg=white ctermfg=red
match OverLength /\%>79v.\+/
set colorcolumn=80
hi ColorColumn ctermfg=red

" Remove Trailing Spaces in *.py files
autocmd BufWritePre *.py :%s/\s\+$//e
