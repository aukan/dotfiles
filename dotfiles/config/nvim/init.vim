" Use vim instead of vi
set nocompatible

" Vundle setup
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'  " required

    " Colorscheme
    Plugin 'altercation/vim-colors-solarized'

    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-notes'

    " Apache thrift highlighting
    Plugin 'solarnz/thrift.vim'

    " Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'aukan/vim-snippets'

    " Swift highlighting
    Plugin 'toyamarinyon/vim-swift'

    " Ctrlp
    Plugin 'ctrlpvim/ctrlp.vim'

    " Tcomment
    Plugin 'tomtom/tcomment_vim'

    " Fugitive (git wrapper)
    Plugin 'tpope/vim-fugitive'

    " Code structure browser
    Plugin 'majutsushi/tagbar'

    " Tags
    Plugin 'xolox/vim-easytags'

    " Check syntaxis
    Plugin 'vim-syntastic/syntastic'
call vundle#end()
filetype plugin indent on

" UTF-8 Encoding
scriptencoding utf-8
set encoding=utf-8

" Backspace behavior
set backspace=indent,eol,start

" Backup files when overwriten
set backup
set writebackup
set dir=~/.vimtemp
set backupdir=~/.vimtemp

" Keep history
set history=1000

" Show cursor coordinates
set ruler

" Show partial command
set showcmd

" Dont match search while typing
set incsearch

" Highlight serches
set hlsearch

" Switch wrap off for everything
set nowrap

" \ is the leader character
let mapleader = ","

" Textwidth
set textwidth=120

" Softtabs, 4 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" Prepare for copying to clipboard.
map <Leader>y :setl nolist nonumber <CR>
map <Leader>k :setl list number <CR>

" Hide search highlighting
map <Leader>h :set nohls

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Remap <F5> in ctrlp
map <leader>p :CtrlPClearCache<cr>

" Move lines up and down
map <C-J> :m +1 <CR>
map <C-K> :m -2 <CR>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Display extra whitespace
set listchars=tab:▸\ ,eol:¬
set list

" Color scheme
syntax enable
set background=dark
silent! colorscheme solarized

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
" let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Buffers
map <Leader>b :b#<Enter>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  " For Haml
  au! BufRead,BufNewFile *.haml setfiletype haml

  " For Handlebars
  au! BufRead,BufNewFile *.hbs setfiletype html
else
  set autoindent " always set autoindenting on
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

if has("folding")
  " set foldenable
  " set foldmethod=syntax
  " set foldlevel=1
  " set foldnestmax=2
  " set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
endif

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Configure notes.vim
:let g:notes_directories = ['~/notes/user']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

