"
" A fairly good vimrc
" By Mahyar Abbas Pour
"

"----------------------------------------------------------------------------
" User Interface
"

" Enable syntax highlighting
syntax on

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=1

" Enhanced command-line completion.
set wildmenu

" Display the cursor position on the last line of the screen or in the status
" line of a window.
set ruler

" Show partial commands in the last line of the screen.
set showcmd

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Display line numbers on the left
set number

" Display fold indicator on the left
set foldcolumn=1

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Always display the status line, even if only one window is displayed
set laststatus=2

" Enable use of the mouse for all modes
" set mouse=a

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Do not show extra information about the currently selected 
" completion in the preview window.
set completeopt=longest,menu

" When on, splitting a window will put the new window right of the 
" current one.
set splitright


"----------------------------------------------------------------------------
" Search
"

" Highlight searches
set hlsearch

" While typing a search command, show where the pattern, as it was typed 
" so far, matches.
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When on, the :substitute flag 'g' is default on.  This means that
" all matches in a line are substituted instead of one.
set gdefault


"----------------------------------------------------------------------------
" Usability options
"

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" When on, :autocmd, shell and write commands are not allowed in .vimrc 
" and .exrc in the current directory and map commands are displayed.
set secure

" Enables the reading of .vimrc, .exrc and .gvimrc in the current directory.
" If you switch this option on you should also consider setting the 'secure'
" option.
set exrc

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" This option specifies how keyword completion |ins-completion| works when 
" CTRL-P or CTRL-N are used.
set complete=.,w,b,u,t,i,d,t


"------------------------------------------------------------
" Indentation options
"

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=4
"set softtabstop=4
"set expandtab

" Indentation settings for using hard tabs. Display tabs as four 
" characters wide.
set tabstop=4
set shiftwidth=4
set noexpandtab

" Switch case style for C
set cinoptions=:0,g0

" Python
let g:pyindent_open_paren='&sw'
let g:pyindent_continue='&sw'

"------------------------------------------------------------
" Mappings
"

" Map <leader> to space
nnoremap <Space> <nop>
let mapleader=" "

" Treat long lines as break lines (useful when moving around in them)
" map j gj
" map k gk

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Spell check
nnoremap <leader>s :set spell!<CR>

" Use <F4> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F4>

" Map BACKSPACE to disable search highlighting
nnoremap <silent><C-L> :nohlsearch<CR>

" Force to learn vim!
"noremap <left> <nop>
"noremap <right> <nop>
"noremap <up> <nop>
"noremap <down> <nop>

" Map CTRL-SPACE for autocompletion
inoremap <C-@> <C-N>

" Smart popup menu
inoremap <silent><expr> <C-@> pumvisible() ? '<C-n>' :
		\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Man page plugin map
nmap <leader>m <leader>K

" Buffer switch
inoremap <C-left> <esc>:bprev<CR>
inoremap <C-right> <esc>:bnext<CR>
nnoremap <C-right> :bnext<CR>
nnoremap <C-left> :bprev<CR>

" Short cut to edit vimrc
nnoremap <F3> :e ~/.vim/vimrc<CR>

" Use these abbreviations to prevent annoying typos in vim console.
cnoreabbrev W w
cnoreabbrev Q q


"------------------------------------------------------------
" Autocommands
"

autocmd Filetype python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html*  setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype text   setlocal spell     textwidth=79 
autocmd FileType help   setlocal nospell

autocmd BufNewFile,BufReadPost *.md set filetype=markdown


"------------------------------------------------------------
" User defined

" Color scheme
" colorscheme jellybeans
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Set terminal colors to 256 (MAX)
set t_Co=256

" Omnifunc
setlocal omnifunc=syntaxcomplete#Complete

" Pathogen
execute pathogen#infect()

" Add tags
" set tags=./tags;

" Map to open Taglist
nnoremap <silent> <leader>tl :TlistOpen<CR>

" NERDTree
let NERDTreeShowBookmarks = 1
" let NERDTreeChDirMode = 2
nnoremap <silent> <F2> :NERDTree<CR>

" NERDCommenter
imap <C-c> <plug>NERDCommenterInsert
let NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
	\ 'asm': { 'left': '#' },
	\ 'dosini': {'left': "#"},
\}

" Delimate
let delimitMate_expand_cr = 1
au FileType python let b:delimitMate_nesting_quotes = ['"']

" Syn
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': [''] }
let g:syntastic_python_python_exec = '/usr/bin/python3'
" let g:syntastic_python_checkers = ['pyflakes']

" Bufferline
let g:bufferline_show_bufnr = 0
let g:bufferline_modified = '*'
let g:bufferline_rotate = 2

" Ctrlp
let g:ctrlp_map = '<leader>p'

" YouCompleteMe
" let g:clang_library_path = "/usr/lib/llvm-3.4/lib"
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_min_num_of_chars_for_completion = 99
" let g:ycm_auto_trigger = 0
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

" Cscope
if has('cscope')
	set cscopetag cscopeverbose cscoperelative
	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif
endif

function! LoadCscope()
	let db = findfile("cscope.out", ".;../../..")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
autocmd BufEnter *.c call LoadCscope()

" ftplugin man.vim
runtime ftplugin/man.vim

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
