set nocompatible

" pathogen
call pathogen#infect()

" intuitive backspace
set backspace=indent,eol,start

" backup
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nowrap		" don't wrap long lines

set encoding=utf-8

set tabstop=4
set shiftwidth=4 softtabstop=4 expandtab

set foldmethod=indent
highlight Folded ctermbg=black ctermfg=blue

set ignorecase smartcase

set scrolloff=5
set visualbell


set hidden
hi clear SpellBad
hi SpellBad ctermbg=blue
set title
set wildmenu
set wildmode=list:longest,full
nmap <silent> <C-n> :tabn<CR>
imap <silent> <C-n> <Esc>:tabn<CR>i
nmap <silent> <C-p> :tabp<CR>
imap <silent> <C-p> <Esc>:tabp<CR>i
nmap <silent> <C-o> :tabnew<CR>
imap <silent> <C-o> <Esc>:tabnew<CR>

highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%>79v.\+/

set tags=.TAGS;$HOME
nmap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
imap <C-\> <Esc>:tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Remove Trailing Spaces in *.py files
autocmd BufWritePre *.py :%s/\s\+$//e

nnoremap ' `
nnoremap ` '
