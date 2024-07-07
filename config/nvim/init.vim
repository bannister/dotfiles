"let g:python3_host_prog='/usr/local/bin/python3'
"let g:python3_host_prog='/usr/local/opt/python@3.9/bin/python3.9/'
"let g:python2_host_prog='/System/Library/Frameworks/Python.framework/Versions/2.7/Resources/Python.app/Contents/MacOS/Python/'

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
" List of plugins.
" Make sure you use single quotes
" Shorthand notation
"Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
Plug 'sirver/UltiSnips'
"Plug 'ncm2/ncm2-ultisnips'
Plug 'wsdjeg/Nvim-R'
"Plug 'jalvesaq/Nvim-R'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
Plug 'rizzatti/dash.vim'
Plug 'preservim/nerdtree'
Plug 'raimondi/delimitMate'
Plug 'w0rp/ale'
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox' 
Plug 'joshdick/onedark.vim'
"Plug 'vim-scripts/matrix.vim'
"Plug 'vim-scripts/revolutions.vim'
Plug 'i3d/vim-jimbothemes'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ellisonleao/glow.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
"Plug 'luisiacc/thematrix'
" Initialize plugin system
call plug#end()


" Colourscheme/Theme

set background=dark
set termguicolors
set laststatus=2              " To tell Vim we want to see the statusline.

"colorscheme solarized8
"let g:airline_theme = 'solarized'
"let g:airline_solarized_bg='dark'
" colorscheme solarized
"let g:solarized_termtrans=1
"let g:solarized_visibility = "high"
"let g:solarized_termcontrast="high"
"let g:solarized_termcolors=256

colorscheme matrix
"colorscheme darkmatrix
let g:airline_theme = 'biogoo'

"colorscheme thematrix

"colorscheme gruvbox
"let g:airline_theme = 'gruvbox'

"colorscheme base16-solarized-dark
"let g:airline_theme = 'solarized'
"let g:airline_solarized_bg='dark'

""colorscheme onedark
"let g:onedark_termcolors = 256
""let g:onedark_terminal_italics = 1
"let g:onedark_hide_endofbuffer = 1
"let g:airline_theme='onedark'

" Set a Local Leader

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
"let maplocalleader = ","


" Plugin Related Settings


" Nerdtree {{{
map <leader>n :NERDTreeToggle<CR>                  " Toggle NERD tree.
"nnoremap <C-n> :NERDTreeTabsToggle<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeChDirMode       = 2
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
autocmd BufWinEnter * silent NERDTreeMirror " Open the existing NERDTree on each new tab.
" }}}


" R configuration - Nvim-R {{{
let g:rout_follow_colorscheme = 1 " R output is highlighted with current colorscheme
let g:Rout_more_colors = 1 " R commands in R output are highlighted
let r_indent_ess_comments = 0 " Set vim-r-plugin to mimics ess :
let r_indent_ess_compatible = 0 
let r_indent_align_args = 0
"let g:R_pdfviewer="evince"
let R_show_args = 1 " show the arguments for functions with autocompletion
let g:R_objbr_opendf = 0
let g:R_objbr_openlist = 0
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif " exit R when you exit the vim
autocmd FileType rmd set foldmarker=```{,```
autocmd FileType rmd setlocal foldmethod=marker
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" }}}
"
" " R configuration - NCM2 {{{
"autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
"set completeopt=noselect,noinsert,menuone,preview
" }}}

"" Snips - Ultisnips - ncm2 {{{
" First use tab and shift tab to browse the popup menu and use enter to expand:
"inoremap ncm2_ultisnips#expand_or("<CR>”, 'n')
"inoremap pumvisible() ? "<C-n>" : "<Tab>"
"inoremap pumvisible() ? "<C-p>" : "<S-Tab>"
"let g:UltiSnipsExpandTrigger="<c-0>"
"au BufNewFile,BufRead *.Rmd set filetype=rmd
" c-j c-k for moving in snippet
"let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
"let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
"let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
"let g:UltiSnipsRemoveSelectModeMappings = 0
"" }}}

" Dash {{{
nmap <silent> <leader>d <Plug>DashSearch<CR>
" }}}



" MARKDOWN
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
nnoremap <M-m> :MarkdownPreview<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" General NVIM/VIM Settings

" Mouse Integration
set mouse=i                   " Enable mouse support in insert mode.

" Tabs & Navigation
map <leader>nt :tabnew<cr>    " To create a new tab.
map <leader>to :tabonly<cr>     " To close all other tabs (show only the current tab).
map <leader>tc :tabclose<cr>    " To close the current tab.
map <leader>tm :tabmove<cr>     " To move the current tab to next position.
map <leader>tn :tabn<cr>        " To swtich to next tab.
map <leader>tp :tabp<cr>        " To switch to previous tab.


" Line Numbers & Indentation
set backspace=indent,eol,start  " To make backscape work in all conditions.
set ma                          " To set mark a at current cursor location.
set number                      " To switch the line numbers on.
set expandtab                   " To enter spaces when tab is pressed.
set smarttab                    " To use smart tabs.
set autoindent                  " To copy indentation from current line 
                                " when starting a new line.
set si                          " To switch on smart indentation.
set softtabstop=2
set tabstop=2
set shiftwidth=2


" Search
set ignorecase                  " To ignore case when searching.
set smartcase                   " When searching try to be smart about cases.
set hlsearch                    " To highlight search results.
set incsearch                   " To make search act like search in modern browsers.
set magic                       " For regular expressions turn magic on.


" Brackets
set showmatch                   " To show matching brackets when text indicator 
                                " is over them.
set mat=2                       " How many tenths of a second to blink 
                                " when matching brackets.


" Errors
set noerrorbells                " No annoying sound on errors.


" Color & Fonts
syntax enable                   " Enable syntax highlighting.
set encoding=utf8                " Set utf8 as standard encoding and 
                                 " en_US as the standard language.

" Enable 256 colors palette in Gnome Terminal.
if $COLORTERM == 'truecolor'
    set t_Co=256
endif

" try
"    colorscheme desert
" catch
" endtry

" Tmux
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

" Files & Backup
set nobackup                     " Turn off backup.
set nowb                         " Don't backup before overwriting a file.
set noswapfile                   " Don't create a swap file.
set ffs=unix,dos,mac             " Use Unix as the standard file type.


" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>







i
