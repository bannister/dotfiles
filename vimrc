set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin on
filetype indent on

" highlighting
set t_Co=256
set term=screen-256color
"set term=xterm-256color

syntax enable
set background=dark
"set relativenumber
"set cursorline
"set number

" tabbing
set expandtab
set shiftwidth=2
set softtabstop=2

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"powerline status bar
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'ervandew/screen'
Plugin 'scrooloose/nerdtree'
"Plugin 'powerline/powerline'
Plugin 'suan/vim-instant-markdown'
Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" R script settings
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
let maplocalleader = ","
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
"vmap <C-Enter> <Plug>RDSendSelection
"nmap <C-Enter> <Plug>RDSendLine
let vimrplugin_applescript=0
let vimrplugin_vsplit=1

" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" vim-latex-live-preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

" use solarised theme
let g:solarized_termtrans=1
let g:solarized_visibility = "high"
let g:solarized_termcontrast="high"
let g:solarized_termcolors=256
colorscheme solarized
"togglebg#map("<F5>") 
