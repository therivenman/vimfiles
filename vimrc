set nobackup
set noswapfile
set ignorecase

set nocompatible " get out of horrible vi-compatible mode
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ericbn/vim-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-dispatch'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'steffanc/cscopemaps.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 't9md/vim-quickhl'
Plugin 'vim-scripts/a.vim'
Plugin 'lyuts/vim-rtags'
Plugin 'dbakker/vim-projectroot'
Plugin 'EinfachToll/DidYouMean'
Plugin 'tpope/vim-unimpaired'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()

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
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
set autochdir " Automatically change working directory to file that is being edited
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
set textwidth=1000 " allow long lines

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
nnoremap <leader>g :ProjectRootExe Ag!<space><C-r><C-w>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" pico build
nmap <leader>bb :wa<CR>:call Build(1)<CR>
nmap <leader>bh :wa<CR>:call Build(2)<CR>
nmap <leader>br :wa<CR>:call Build(3)<CR>
nmap <leader>ba :wa<CR>:call Build(4)<CR>
nmap <leader>bt :call Build(5)<CR>
nmap <leader>bc :wa<CR>:call Build(6)<CR>
nmap <leader>rt :call RunTest()<CR>

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
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%:hidden', '?')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

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

" ProjectRoo
let g:rootmarkers = ['.pico_project','.projectroot','.git','.hg','.svn','.bzr','_darcs','build.xml']

" ack
if executable('ag')
  let g:ackprg = 'ag'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

function! PicoBuild(type, path, blade, host)
    let picoPath = a:path
    let bladePath = picoPath."/".a:blade
    let hostPath = picoPath."/".a:host

    " First close the quickfix window to prevent a segfault?
    exec "cclose"

    let current_directory = getcwd()
    if a:type == "1"
        " build blade
        exec "cd ".bladePath
    elseif a:type == "2"
        " build host
        exec "cd ".hostPath
    elseif a:type == "3"
        " rootfs
        exec "Dispatch sudo ".picoPath."/blade/fs/buildfs.sh"
        return
    elseif a:type == "4"
        " buildall
        exec "Dispatch cd ".picoPath."/scripts/; ./buildall.sh -kdbip"
        return
    elseif a:type == "5"
        " taggen
        let tagScript = picoPath."/scripts/taggen.sh"
        if !filereadable(tagScript)
            return
        endif
        exec "silent !".tagScript
        exec "silent cs reset"
        return
    elseif a:type == "6"
        " "clean" build
        exec "Dispatch cd ".picoPath."/scripts/; ./buildall.sh -kdb"
        return
    else
        echom "Error: Bad build type"
        return
    endif

    " Now Build
    exec "Dispatch make ".PicoProjectName(current_directory)

    " Return home
    exec "cd ".current_directory
endfunction

function! SmartboxProjectDir(dir)
    let directory = split(a:dir, "/")

    let c = 0
    let dir = directory[c]

    while dir != "smartbox"
        let c -= 1
        let dir = directory[c]

        if dir == "home"
            return "error"
        endif
    endwhile

    let finalDir = ""

    while c != -1
        let c += 1

        if directory[c] == "src"
            return finalDir
        elseif directory[c] == "include"
            return finalDir
        endif

        let finalDir = finalDir . directory[c] . "/"
    endwhile

    return finalDir

endfunction

function! SmartboxBuild(type)
    let picoPath = "~/work/smartbox/"
    let bladePath = picoPath."build/blade/"
    let hostPath = picoPath."build/host/"

    let currentDirectory = getcwd()

    " First close the quickfix window to prevent a segfault
    exec "cclose"

    let buildDir = SmartboxProjectDir(currentDirectory)

    if buildDir == "error"
        echom "Error getting build dir"
        return
    endif

    if a:type == "1"
        let buildDir = bladePath.buildDir
    elseif a:type == "2"
        let buildDir = hostPath.buildDir
    else
        echom "Error: Bad build type"
        return
    endif

    " Change directory
    exec "cd ".buildDir

    " Now build
    exec "Dispatch make -j$(nproc)"

    " Return home
    exec "cd ".currentDirectory

endfunction

function! FindBuildType()
    let directory = split(getcwd(), "/")

    let c = -1
    let dir = directory[c]

    while dir != "home"
        if file

        let c -= 1
        let dir = directory[c]
    endwhile

    return "none"

endfunction

function! Build(type)

    " read project config
    let config = findfile(".pico_project", ".;")

    if empty(config)
        echo "No .pico_project file found in path"
        return
    endif

    let configStrings = readfile(config)
    let projectRoot = ""
    let bladeDir = ""
    let hostDir = ""
    let buildFs = ""
    let tagGen = ""
    let buildProject = ""

    for i in range(0, len(configStrings) - 1)
        let string = split(configStrings[i], "=")
        let key = string[0]
        let value = string[1]

        if key == "ROOT"
            let projectRoot = value
        elseif key == "BLADE"
            let bladeDir = value
        elseif key == "HOST"
            let hostDir = value
        elseif key == "BUILDFS"
            let buildFs = value
        elseif key == "TAGGEN"
            let tagGen = value
        elseif key == "BUILD"
            let buildProject = value
        endif
    endfor

    if buildProject == "clifford"
        call PicoBuild(a:type, projectRoot, bladeDir, hostDir)
    elseif buildProject == "smartbox"
        call SmartboxBuild(a:type)
    else
        echom "Unknown build project"
    endif

endfunction

function! RunTest()
    let testName = expand('%:t:r')

    let testPath = "~/work/smartbox/build/host/".SmartboxProjectDir(getcwd())

    execute "!".testPath.testName
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au BufNewFile,BufRead *.tpp :set ft=cpp " damn tpps
au BufNewFile,BufFilePre,BufRead *.md :set ft=markdown
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd BufWritePost *.cpp,*.h,*.c,*.hpp :call Build(5)

let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux"
    let s:display = system("echo -n \"$DISPLAY\"")
    if !empty(s:display) " Ensure we have a gnome session
        au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
          au InsertEnter,InsertChange *
            \ if v:insertmode == 'i' |
            \   silent execute '!echo -ne "\e[5 q"' | redraw! |
            \ elseif v:insertmode == 'r' |
            \   silent execute '!echo -ne "\e[3 q"' | redraw! |
            \ endif
          au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
    endif
else
    " Change cursor shape between insert and normal mode in iTerm2.app
    if $TERM_PROGRAM =~ "iTerm"
        if exists('$TMUX')
            let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
            let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
        else
            let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
            let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
        endif
    endif
endif
" C/C++ specific settings
autocmd FileType c,cpp,cc  setlocal cindent comments-=:// comments+=f:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,h1s,p2,t0,+2,(2,)20,*30
autocmd FileType gitcommit setlocal comments=

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
