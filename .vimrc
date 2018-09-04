set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
"
" My bundles here:
"
" autocompletion
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'justmao945/vim-clang'
" helpers
Plugin 'fidian/hexmode.git'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
"Plugin 'junegunn/fzf',  { 'dir': '~/.fzf',  'do': './install --all' }
"Plugin 'mbbill/undotree'
"Plugin 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dyng/ctrlsf.vim'
" git support
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
" coding
Plugin 'tpope/vim-abolish.git'
Plugin 'jiangmiao/auto-pairs'
Plugin 'godlygeek/tabular'
Plugin 'fedorov7/vim-uefi'
Plugin 'fedorov7/ksslint'
Plugin 'vim-flake8'
Plugin 'rhysd/vim-clang-format'
Plugin 'fatih/vim-go'
" colors
Plugin 'lilydjwg/colorizer'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nanotech/jellybeans.vim'
"Plugin 'sheerun/vim-polyglot'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elzr/vim-json'
Plugin 'kergoth/vim-bitbake'
Plugin 'pearofducks/ansible-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vimwiki/vimwiki'

" Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'dracula/vim'
" Plugin 'mhinz/vim-startify'
" Plugin 'vim-scripts/Conque-GDB'
" Plugin 'chikamichi/mediawiki.vim'
" Plugin 'Lokaltog/powerline',  {'rtp':  'powerline/bindings/vim'}
" Plugin 'davidhalter/jedi-vim'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'editorconfig/editorconfig-vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'jeaye/color_coded'

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"

" vim-go plugin options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-go mappings
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Only trailing spaces visually for go
autocmd FileType go set nolist

" let g:go_fmt_command = "goimports"
" let g:go_fmt_options = '-w'
" let g:go_fmt_autosave = 0

" color paranthesis
let g:rbpt_colorpairs = [
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkred',     'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['brown',       'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

set encoding=utf8
let g:airline_powerline_fonts = 1

" make YCM compatible with UltiSnips (using supertab)

" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" let g:ycm_key_invoke_completion = '<C-Space>'
" let g:ycm_auto_trigger = 0
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_complete_in_comments = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_seed_identifiers_with_syntax = 1

" autocmd FileType gitcommit let g:ycm_collect_identifiers_from_comments_and_strings = 1
" autocmd FileType gitcommit let g:ycm_collect_identifiers_from_tags_files = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" let g:ycm_autoclose_preview_window_after_completion=1

" Ycm bindings
" au FileType c,cpp,python nnoremap <Leader>h :YcmCompleter GoToDeclaration<CR>
" au FileType c,cpp,python nnoremap <Leader>d :YcmCompleter GoToDefinition<CR>
" au FileType c,cpp,python nnoremap <Leader>g :YcmCompleter GoTo<CR>
" au FileType c,cpp nnoremap <Leader>i :YcmCompleter GoToImprecise<CR>
" au FileType c,cpp nnoremap <Leader>p :YcmCompleter GetParent<CR>
" au FileType c,cpp nnoremap <Leader>cl :YcmCompleter ClearCompilationFlagCache<CR>
" au FileType c,cpp nnoremap <F2> :YcmCompleter GetType<CR>
" au FileType c,cpp nnoremap <F3> :YcmCompleter FixIt<CR>
" au FileType c,cpp nnoremap <F8> :YcmShowDetailedDiagnostic<CR>
" au FileType c,cpp nnoremap <F9> :YcmDiags<CR>

"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax    on
"
" Using a backupdir under UNIX/Linux: you may want to include a line similar to
"   find  $HOME/.vim.backupdir -name "*" -type f -mtime +60 -exec rm -f {} \;
" in one of your shell startup files (e.g. $HOME/.profile)
"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
"set complete+=k                " scan the files given with the 'dictionary' option
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
"set history=50                 " keep 50 lines of command line history
set history=1000                " Store lots of :cmdline history
"set gcr=a:blinkon0             " Disable cursor blink
set mouse=r                     " enable the use of the mouse
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmode                    " Show current mode down the bottom
"set visualbell                 " visual bell instead of beeping
set nojoinspaces                " prevents inserting two spaces after punctuation on a join
set lazyredraw                  " will not redraw the screen while running macros (goes faster)
set virtualedit=block           " let cursor move past the last char in <C-V> mode
set nostartofline               " avoid moving cursor to BOL when jumping around

set cryptmethod=blowfish        " use (much) stronger blowfish encryption

" don't select first item, follow typing in autocomplete
" set completeopt=longest,menuone,preview

" This makes vim act like all other editors,  buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" ================ Indentation ======================
set autoindent                  " copy indent from current line
set smartindent                 " smart autoindenting when starting a new line
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=8
set expandtab                   " tabs are replaced with spacing

function! TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=2
    set softtabstop=2
    set expandtab
  endif
endfunction

nmap <F5> mz:execute TabToggle()<CR>


" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" Display tabs and trailing spaces visually
if has("X11")
  set list listchars=tab:\ \ ,trail:· " strings to use in 'list' mode
else
  set list listchars=tab:\ \ ,trail:. " strings to use in 'list' mode
endif

set wrap                      " Don't wrap lines
set linebreak                   " Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=marker           " fold based on marker
set foldnestmax=3               " deepest fold is 3 levels
set nofoldenable                " dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                    " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set laststatus=2
set t_Co=256

" set more! " very tricky for long list command output

"
"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
inoremap  ,  ,<Space>

"-------------------------------------------------------------------------------
" System clipboard support
"-------------------------------------------------------------------------------
vmap <C-c> "+y<CR>
nmap <C-p> "+p<CR>

"-------------------------------------------------------------------------------
" CtrlSF plugin key bindings
"-------------------------------------------------------------------------------
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

"
"-------------------------------------------------------------------------------
" CScope
" ------------------------------------------------------------------------------
"
if has("cscope")
        " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
        set cscopetag

        " check cscope for definition of a symbol before checking ctags: set to 1
        " if you want the reverse search order.
        "set csto=1

        " show msg when any other cscope db added
        set nocscopeverbose

        " add any cscope database in current directory
        if filereadable("cscope.out")
                cs add cscope.out
                " else add the database pointed to by environment variable
        elseif $CSCOPE_DB != ""
                cs add $CSCOPE_DB
        endif

        """"""""""""" My cscope/vim key mappings
        "
        " The following maps all invoke one of the following cscope search types:
        "
        "   's'   symbol: find all references to the token under cursor
        "   'g'   global: find global definition(s) of the token under cursor
        "   'c'   calls:  find all calls to the function name under cursor
        "   't'   text:   find all instances of the text under cursor
        "   'e'   egrep:  egrep search for the word under cursor
        "   'f'   file:   open the filename under cursor
        "   'i'   includes: find files that include the filename under cursor
        "   'd'   called: find functions that function under cursor calls
        "
        " Below are three sets of the maps: one set that just jumps to your
        " search result, one that splits the existing vim window horizontally and
        " diplays your search result in the new window, and one that does the same
        " thing, but does a vertical split instead (vim 6 only).
        "
        " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
        " unlikely that you need their default mappings (CTRL-\'s default use is
        " as part of CTRL-\ CTRL-N typemap, which basically just does the same
        " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
        " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
        " of these maps to use other keys.  One likely candidate is 'CTRL-_'
        " (which also maps to CTRL-/, which is easier to type).  By default it is
        " used to switch between Hebrew and English keyboard mode.
        "
        " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
        " that searches over '#include <time.h>" return only references to
        " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
        " files that contain 'time.h' as part of their name).


        " To do the first type of search, hit 'CTRL-\', followed by one of the
        " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
        " search will be displayed in the current window.  You can use CTRL-T to
        " go back to where you were before the search.
        "

        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


        " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
        " makes the vim window split horizontally, with search result displayed in
        " the new window.
        "
        " (Note: earlier versions of vim may not have the :scs command, but it
        " can be simulated roughly via:
        "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

        nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


        " Hitting CTRL-space *twice* before the search type does a vertical
        " split instead of a horizontal one (vim 6 and up only)
        "
        " (Note: you may wish to put a 'set splitright' in your .vimrc
        " if you prefer the new window on the right instead of the left

        nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


        """"""""""""" key map timeouts
        "
        " By default Vim will only wait 1 second for each keystroke in a mapping.
        " You may find that too short with the above typemaps.  If so, you should
        " either turn off mapping timeouts via 'notimeout'.
        "
        "set notimeout
        "
        " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
        " with your own personal favorite value (in milliseconds):
        "
        "set timeoutlen=4000
        "
        " Either way, since mapping timeout settings by default also set the
        " timeouts for multicharacter 'keys codes' (like <F1>), you should also
        " set ttimeout and ttimeoutlen: otherwise, you will experience strange
        " delays as vim waits for a keystroke after you hit ESC (it will be
        " waiting to see if the ESC is actually part of a key code like <F1>).
        "
        "set ttimeout
        "
        " personally, I find a tenth of a second to work well for key code
        " timeouts. If you experience problems and have a slow terminal or network
        " connection, set it higher.  If you don't set ttimeoutlen, the value for
        " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
        "
        "set ttimeoutlen=100

endif

augroup python_improvements
    autocmd BufNewFile,BufRead *.py set ft=python
    autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
    autocmd FileType python map <buffer> <F7> :call Flake8()<CR>
    " autocmd BufWritePost *.py call Flake8()
augroup END

augroup rainbow_parentheses
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
augroup END

if has("X11")
  set fillchars=vert:\│
else
  set fillchars=vert:\|
endif

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

if has("X11")
  let g:NERDTreeDirArrows=1
else
  let g:NERDTreeDirArrows=0
endif

" Use .clang-format config for style
let g:clang_format#detect_style_file=1

colors jellybeans
