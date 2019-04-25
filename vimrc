set nobackup
set noswapfile
set ignorecase

set nocompatible " get out of horrible vi-compatible mode
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'ericbn/vim-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-dispatch'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'justinmk/vim-syntax-extra'
Plug 'steffanc/cscopemaps.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 't9md/vim-quickhl'
Plug 'vim-scripts/a.vim'
Plug 'lyuts/vim-rtags'
Plug 'dbakker/vim-projectroot'
Plug 'EinfachToll/DidYouMean'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'mphe/grayout.vim'

call plug#end()

set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll bar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " get out of horrible vi-compatible mode
filetype on " detect the type of file
filetype plugin on " detect the type of file
filetype indent on    " Enable filetype-specific indenting
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard^=unnamed,unnamedplus " alias unamed register to the + register
set ffs=unix,dos,mac " support all three, in this order
set isk=@,48-57,_,192-255 " none of these should be word dividers, so make them not be
set autoread
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

if has("termguicolors")     " set true colors
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors
endif

set encoding=utf-8
set termencoding=utf-8

" git gutter
let g:gitgutter_realtime=0
set signcolumn=yes
let g:gitgutter_max_signs = 1000
highlight clear SignColumn
highlight SignColumn ctermbg=8
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

set cursorline " highlight current line
highlight CursorLine guibg=#003853 ctermbg=24  gui=none cterm=none

" highlight 80 characters column
let &colorcolumn="80,".join(range(800,999),",")

" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button=0
let g:airline_detect_spell=0
set noshowmode " Hide modeline

set background=dark
color solarized             " Load a colorscheme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set wildmode=list:longest,full
set ruler " Always show current positions along the bottom
set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
set relativenumber " turn of relative line numbers
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
set fillchars=vert:\ ,stl:\ ,stlnc:\  " make the splitters between windows be blank
set completeopt-=preview
set gcr=a:blinkon0
set winwidth=85
set textwidth=80 " limit lines to 80 chars

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set novisualbell " don't blink
set noerrorbells " no noises

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set expandtab

set viminfo='10,\"100,:100,%,n~/.viminfo
"           |   |     |   | +--- viminfo file path
"           |   |     |   +----- save/restore buffer lists
"           |   |     +--------- max number command history lines
"           |   +--------------- max number of lines saved for each register
"           +------------------- max number of files for which marks are remembered

" Restore cursor to file position in previous editing session
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
nmap <S-H> gT
" go to next tab
nmap <S-L> gt
" new tab
nmap <leader>t :tabnew<CR>

" move around buffers fast
" got prev buffer
nmap <C-H> :bprevious<CR>
" go to next buffer
nmap <C-L> :bnext<CR>
" close current buffer, select previous
nmap <leader>q :bp <BAR> bd #<CR>
" close all buffers quickly
nmap <leader>db :bufdo bd<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" toggle paste mode
nmap <leader>lp :set paste!<BAR>set paste?<CR>

" toggle line numbers
nmap <leader>ln :set invnumber<CR>

" toggle relative line numbers
nmap <leader>ll :set invrelativenumber<CR>

" remap * to stay put
nnoremap * *N

" fast substitue
nmap <leader>lr :%s//<C-r><C-w>/gc

" grep from root
nnoremap <leader>g :call Search("<C-r><C-w>")<cr>
nnoremap <leader>gg :call Search("<C-r>"")<cr>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" pico build
nmap <leader>ba :wa<CR>:call Build("buildall")<CR>
nmap <leader>bb :wa<CR>:call Build("make")<CR>
nmap <leader>bf :wa<CR>:call Build("flash")<CR>
nmap <leader>bq :wa<CR>:call Build("quick")<CR>

" fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>ga :Gcommit -v --amend<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gl :Glog -- %<CR>

" quickhl
nmap <leader>hw <Plug>(quickhl-manual-this)
xmap <leader>hw <Plug>(quickhl-manual-this)
nmap <leader>hc <Plug>(quickhl-manual-reset)
xmap <leader>hc <Plug>(quickhl-manual-reset)

" NERD tree
map <leader>lt :ProjectRootExe NERDTreeToggle<cr>

" YCM
nmap <leader>aa :YcmCompleter GoTo<CR>
nmap <leader>at :YcmCompleter GetType<CR>

" exit insert mode
imap jj <Esc>
imap jk <Esc>
imap <C-j> <Esc>
vmap <C-j> <Esc>

" fzf
nmap <C-p> :ProjectRootExe Files<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_complete_in_comments=1
let g:ycm_extra_conf_globlist = ['~/work/*']
let g:ycm_filetype_specific_completion_to_disable = {
        \ 'gitcommit': 1
        \}
let g:ycm_always_populate_location_list=1

" Ctags
set tags=./tags,tags;

" NERDTree
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1

" a.vim
let g:alternateSearchPath = 'sfr:..,sfr:../src,sfr:include'
let g:alternateNoDefaultAlternate = 1
let g:alternateRelativeFiles = 1

" ProjectRoot
let g:rootmarkers = ['invoke.yaml','.projectroot','.git','.hg','.svn','.bzr','_darcs','build.xml']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Search(query)
  exec "ProjectRootExe Grepper -tool rg -highlight -query ".a:query
  exec "copen"
  exec "normal \<C-W>p"
endfunction

function! Build(type)

    let buildTarget = $CONDA_DEFAULT_ENV

    if buildTarget == ""
        echom "Project not activated; building disabled"
        return
    endif

    echom "Build Target: ".buildTarget

    let projectPath = projectroot#get()

    if projectPath == ""
        echom "Empty project path"
        return
    endif

    " First close the quickfix window to prevent a segfault
    exec "cclose"
    exec "lclose"

    exec "cd ".projectPath

    if a:type == "buildall"
        exec "Dispatch make && inv flash"
    elseif a:type == "make"
        exec "Dispatch make"
    elseif a:type == "flash"
        exec "Dispatch inv flash"
    elseif a:type == "quick"
				exec "YcmDiags"
    endif

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au BufNewFile,BufFilePre,BufRead *.md :set ft=markdown
autocmd QuickFixCmdPost [^l]* nested cwindow

" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
" endif

if exists('$TMUX')
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[0 q"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" C/C++ specific settings
autocmd FileType c,cpp,cc  setlocal cindent tabstop=2 softtabstop=2 shiftwidth=2 comments-=:// comments+=f:// cino=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
autocmd FileType gitcommit setlocal comments=

" set pwd to project root at startup
autocmd VimEnter * :call ProjectRootCD()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Tabs (Windows)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabpagemax=15

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear Search / Window Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off all highlighting
nnoremap <silent> <C-x> :nohl<CR>
" Switch between splits with the TAB key
nnoremap <silent> <Tab> <C-W>w
" Write to file quickly
nnoremap <silent> <leader>w :w<CR>
" Reopen file quickly
nnoremap <silent> <leader>e :e<CR>
" Close window quickly
nnoremap <silent> <leader>c <C-W>c
" Open horiztonal split and switch to it
nnoremap <silent> <leader>s
    \ :wincmd s <Bar>
    \ :wincmd w<CR>

" Copy-Paste remapping
nnoremap <leader>y "cy
vnoremap <leader>y "cy
nnoremap <leader>p "cp
vnoremap <leader>p "cp
nnoremap <leader>P "cP
vnoremap <leader>P "cP

" Show hidden characters
set listchars=tab:>-,trail:á,eol:$
nmap <silent> <leader>ls :set nolist!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Trailing Whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
nnoremap <silent> <leader>lw
    \ :if exists('w:trailing_whitespace_match') <Bar>
    \   silent! call matchdelete(w:trailing_whitespace_match) <Bar>
    \   unlet w:trailing_whitespace_match <Bar>
    \   echo "Whitespace Highlighting: off" <Bar>
    \ else <Bar>
    \   let w:trailing_whitespace_match = matchadd('ExtraWhitespace', '\s\+\%#\@<!$', -1) <Bar>
    \   echo "Whitespace Highlighting: on" <Bar>
    \ endif<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell spelllang=en_us
highlight SpellBad None
highlight SpellCap None
highlight SpellLocal None
highlight SpellRare None
highlight SpellBad cterm=underline
highlight SpellCap cterm=underline
