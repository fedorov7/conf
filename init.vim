call plug#begin('~/.local/share/nvim/plugged')

" autocompletion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', {'do': 'python3 ~/.local/share/nvim/plugged/YouCompleteMe/install.py --clang-completer --go-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" helpers
Plug 'fidian/hexmode'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
" git
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
" coding
Plug 'tpope/vim-abolish'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'fedorov7/vim-uefi'
Plug 'fedorov7/ksslint'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', {'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'vivien/vim-linux-coding-style'
" colors
Plug 'lilydjwg/colorizer'
Plug 'kien/rainbow_parentheses.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'kergoth/vim-bitbake'
Plug 'pearofducks/ansible-vim'
Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()

syntax on
colors jellybeans

" Various settings
set encoding=utf8
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set showcmd                     " display incomplete commands
set showmode                    " Show current mode down the bottom
set nojoinspaces                " prevents inserting two spaces after punctuation on a join
set lazyredraw                  " will not redraw the screen while running macros (goes faster)
set virtualedit=block           " let cursor move past the last char in <C-V> mode
set nostartofline               " avoid moving cursor to BOL when jumping around
set hidden
set wrap                      	" Don't wrap lines
set linebreak                   " Wrap lines at convenient points
" Folds
set foldmethod=marker           " fold based on marker
set foldnestmax=3               " deepest fold is 3 levels
set nofoldenable                " dont fold by default

" Indentation
set autoindent                  " copy indent from current line
set smartindent                 " smart autoindenting when starting a new line
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=8
set expandtab                   " tabs are replaced with spacing

" Turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup

" Display tabs and trailing spaces visually
if has('X11') || has('nvim')
  set list listchars=tab:\ \ ,trail:· " strings to use in 'list' mode
  set fillchars=vert:\│
  let g:NERDTreeDirArrows=1
else
  set list listchars=tab:\ \ ,trail:. " strings to use in 'list' mode
  set fillchars=vert:\|
  let g:NERDTreeDirArrows=0
endif

let mapleader=','
let g:airline_powerline_fonts = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:clang_format#detect_style_file=1
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

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace', 'clang-format', 'uncrustify'],
\   'javascript': ['eslint'],
\}

let g:linuxsty_patterns = [ '/usr/src/', '/linux' ]

" vim-go plugin options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

augroup go_improvemnets
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
augroup END

augroup python_improvements
    autocmd BufNewFile,BufRead *.py set ft=python
    autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
augroup END

augroup rainbow_parentheses
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
augroup END

" System clipboard support
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

"-------------------------------------------------------------------------------
" CScope
" ------------------------------------------------------------------------------
"
if has('cscope')
        " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
        set cscopetag

        " check cscope for definition of a symbol before checking ctags: set to 1
        " if you want the reverse search order.
        "set csto=1

        " show msg when any other cscope db added
        set nocscopeverbose

        " add any cscope database in current directory
        if filereadable('cscope.out')
                cs add cscope.out
                " else add the database pointed to by environment variable
        elseif $CSCOPE_DB !=# ''
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
