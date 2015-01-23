set path=~/work/clifford/blade/**,~/work/clifford/common/**
set path+=/opt/poky/current/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/include/**

set nobackup
set noswapfile
set ignorecase

set nocompatible " get out of horrible vi-compatible mode
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-dispatch'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'steffanc/cscopemaps.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 't9md/vim-quickhl'
Plugin 'vim-scripts/a.vim'

call vundle#end()

set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " get out of horrible vi-compatible mode
filetype on " detect the type of file
filetype plugin on " detect the type of file
filetype indent on    " Enable filetype-specific indenting
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs=unix,dos,mac " support all three, in this order
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
set autochdir " Automatically change working directory to file that is being edited
set autoread
set showcmd


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set background=dark

if has('gui_running')
	set guifont=Anonymous\ Pro\ for\ Powerline\ 12
	set background=dark
	set t_Co=256          " 256 color mode
else
	" terminal mode
endif

set cursorline        " highlight current line
highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none

color solarized             " Load a colorscheme

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
let g:airline_section_x="%{airline#util#wrap(TickNum(),0)}"
let g:airline_section_y="%{airline#util#wrap(FiletypeFf(),0)}"
set noshowmode " Hide modeline

function! FiletypeFf()
  return printf('%s%s', &filetype, strlen(&ff) > 0 ? '['.&ff.']' : '')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set wildmode=list:longest,full
set ruler " Always show current positions along the bottom
set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
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
set textwidth=1000 " allow long lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set novisualbell " don't blink
set noerrorbells " no noises

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set expandtab

function! TickNum()
    if exists("g:pico_ticket")
        return g:pico_ticket
    else
        return ''
    endif
endfunction

"}

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" toggle paste mode
nmap <leader>lp :set paste!<BAR>set paste?<CR>

" toggle line numbers
nmap <leader>ln :set invnumber<CR>

" remap * to stay put
nnoremap * *N

" fast substitue
nmap <leader>lr :%s//<C-r><C-w>/gc

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" pico build
nmap <leader>bb :wa<CR>:call PicoBuild(1)<CR>
nmap <leader>bh :wa<CR>:call PicoBuild(2)<CR>
nmap <leader>br :wa<CR>:Dispatch sudo ~/work/clifford/blade/fs/buildfs.sh cmakebuild<CR>
nmap <leader>ba :wa<CR>:Dispatch cd ~/work/clifford/scripts/; ./buildall.sh -kdb<CR>
nmap <leader>bt :!taggen.sh<CR>:cs reset<CR>
nmap <leader>bc :Dispatch clean-repo.sh<CR>

" fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>ga :Gcommit -v --amend<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gw :Gwrite<CR>

" quickhl
nmap <leader>hw <Plug>(quickhl-manual-this)
xmap <leader>hw <Plug>(quickhl-manual-this)
nmap <leader>hc <Plug>(quickhl-manual-reset)
xmap <leader>hc <Plug>(quickhl-manual-reset)

" NERD tree
map <leader>lt :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""
" Plugin Configurations
"""""""""""""""""""""""""""""""""

" git gutter
let g:gitgutter_realtime=0
let g:gitgutter_sign_column_always=1
highlight clear SignColumn
highlight SignColumn ctermbg=8
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" YouCompleteMe
let g:ycm_complete_in_comments=1
let g:ycm_extra_conf_globlist = ['~/work/*']
let g:ycm_filetype_specific_completion_to_disable = {
        \ 'gitcommit': 1
        \}

" Ctags
set tags=./tags,tags;

" Better whitespace
let g:better_whitespace_filetypes_blacklist=['gitcommit']

" NERDTree
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1

"Ctrl-P
let g:ctrlp_root_markers = ['.ycm_extra_conf.py']

"""""""""""""""""""""""""""""""""
" Custom Functions
"""""""""""""""""""""""""""""""""

function! PicoProjectName(dir)
	let directory = split(a:dir, "/")
	let basename = directory[-1]
	if basename == "include"
		let basename = directory[-2]
    elseif basename == "UnitTests"
        let basename = directory[-2]
	endif
	return basename
endfunction

function! PicoBuild(type)
	let picoPath = "~/work/clifford/"
	let bladePath = picoPath."build_blade_debug/"
	let hostPath = picoPath."build_host_debug/"

	let current_directory = getcwd()
	if a:type == "1"
		exec "cd ".bladePath
	elseif a:type == "2"
		exec "cd ".hostPath
	else
		echom "Error: Bad build type"
	endif

	" Now Build
    exec "Dispatch make ".PicoProjectName(current_directory)

	" Return home
	exec "cd ".current_directory
endfunction

function! SetTicket(number)
    if a:number == "0"
        unlet g:pico_ticket
    else
        let g:pico_ticket = a:number
    endif
endfunction

command! -nargs=1 SetTicket call SetTicket(<args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au BufNewFile,BufRead *.asp :set ft=aspjscript " all my .asp files ARE jscript
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
au BufNewFile,BufRead *.hta :set ft=html " all my .tpl files ARE html
au BufNewFile,BufRead *.tac :set ft=python " all my .tpl files ARE html
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Tabs (Windows)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabpagemax=15


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set mouse=nv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comments
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal comments=s1:/*,mb:*,ex:*/,f://,fb:#,:%,:XCOMM,n:>,fb:-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear Search / Window Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off all highlighting
nnoremap <silent> <C-x> :nohl<CR>
" Switch between splits with the TAB key
nnoremap <silent> <Tab> <C-W>w
" Write to file quickly
nnoremap <silent> <leader>w :w<CR>
" Close window quickly
nnoremap <silent> <leader>c <C-W>c
" Open horiztonal split and switch to it
nnoremap <silent> <leader>s
	\ :wincmd s <Bar>
	\ :wincmd w<CR>

"Copy-Paste remapping
nnoremap <leader>y "cy
vnoremap <leader>y "cy
nnoremap <leader>p "cp
vnoremap <leader>p "cp
nnoremap <leader>P "cP
vnoremap <leader>P "cP

nnoremap <silent> <Leader>ll
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
      \ endif<CR>

"""""""""""""""""""""""""
" Toggle Whitespace
"
set listchars=tab:>-,trail:�,eol:$
nmap <silent> <leader>ls :set nolist!<CR>
nmap <silent> <leader>lw :ToggleWhitespace<CR>

