"      _
"  _ _|_|_____ ___ ___
" | | | |     |  _|  _|
"  \_/|_|_|_|_|_| |___|


" Menu:
" 1...................Plugins
" 2....................Basics
" 3................Remappings
" 3.......................GUI
" 4................Statusline
" 5.....................Fonts
" 6....................Panels
" 7................MS Windows



" -----[ PLUGINS ]----- "

call plug#begin('~/.vim/plugged')
    Plug 'chriskempson/base16-vim'                          " Best Colors Ever!
    Plug 'tpope/vim-surround'                               " surround keybindings
    Plug 'junegunn/seoul256.vim'                            " seoul colorscheme
    Plug 'ctrlpvim/ctrlp.vim'                               " fuzzy finder for files/buffers ..
    Plug 'ervandew/supertab'                                " tabcompletion
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }  " latex compile and preview
    Plug 'junegunn/goyo.vim'                                " Goyo, distraction free writing for LaTeX
    Plug 'HansMartin/inline-python'                         " Inline Python exec.
call plug#end()



" -----[ BASICS ]----- "

" Color Settings
"let base16colorspace=256
"set t_Co=256
"colorscheme base16-dracula
colorscheme base16-tomorrow-night

" Encoding
set encoding=utf-8

" disable any (terminal-)bells
set noeb
set novb
set belloff=all

" Path settings
set backupdir=$HOME/.vim/backups
set noswapfile
set undodir=$HOME/.vim/undo

" Syntax and Lines
syntax enable
set number
set relativenumber
set cursorline

" Tab/Spacing settings
set expandtab               " use spaces instead of tabs
set shiftwidth=4            " number of columns when indenting with > or <
set softtabstop=4           " number of spaces when hitting tab
set autoindent              " set indentation from previous line

" searching...
set ignorecase              " case insensitive
set nohlsearch              " no search highlighting after the search is done
set noshowmatch             " disable that blinking bracket stuff
set wildmenu                " shows menu for tab completion
set incsearch               " search if you type the letters
set path+=**                " include all subdirs for finding files (eg. :find)
set backspace=2

set splitbelow splitright   " split windows occure on the right/bottom


" -----[ Remappings ]----- "

" mapping for fast buffer switching
nnoremap <leader>a :bp!<CR>
noremap <leader>s :bn!<CR>

" When selecting Text, keep the Block selected
vmap < <gv
vmap > >gv

" Map the Python Evaluation into the vim-expression command(Q)
nnoremap Q :EvalPython <CR>
let g:il_append=1
let g:il_use_nextline=0

" Remove Trailling Whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" auto execute xrdb when .Xresources is saved
autocmd BufWritePost ~/.Xresources !xrdb %


" use Ctr+C for Copy Pasterino into sys. clipboard
"vnoremap <C-c> "*y
vnoremap <C-c> "*y :let @+=@*<CR>
nnoremap <leader>c "+yy

" LaTeX Settings
let g:livepreview_previewer = 'zathura'


" Bind Goyo to shortcut
map <F3> <ESC>:Goyo <CR>

" Goyo configuration
let g:goyo_width=100
let g:goyo_height=100


" Markdown viewer script
map <F9> <ESC>:silent !md-viewer % <CR>


" --- LaTeX Mappings ---
"     stolen from Luke Smith's vimrc "

" Navigating with guides
autocmd FileType tex inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
autocmd FileType tex vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
autocmd FileType tex nnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l

" Compile document using xelatex:
autocmd FileType tex inoremap <F5> <Esc>:!pdflatex<space><c-r>%<Enter>a
autocmd FileType tex nnoremap <F5> :!pdflatex<space><c-r>%<Enter>


" Shortcuts
autocmd FileType tex inoremap ,em \emph{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<Space><++><Esc>T{i
autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ,it \textit{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA



" -----[ GUI ]----- "

" This hides the Toolbar, Menubar and left/right scrollbar in gvim
if has("gui_running")
    set guioptions -=T
    set guioptions -=m
    set guioptions -=r
    set guioptions -=L
endif


" -----[ Statusline ]----- "
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %p%%
set statusline+=\ %l:%c
set laststatus=2


" -----[ Fonts ]----- "
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Hack\ 9 elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Hack:h9:cANSI,Consolas:h11:cANSI
    endif
endif



" -----[ Panels ]----- "

" This remaps Ctrl+W +<direction> to Ctr+HJKL for changig the Panel in a
" splitted mode
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" This is to get Tabs by using the <leader> Key (Leader Key: '\')
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt



" -----[ MS Windows ]----- "

" Getting the Windows mswin behaviour
if has("win32")
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

