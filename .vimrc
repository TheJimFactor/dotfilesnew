"L: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"			   newbie, basing your first .vimrc on this file is a good choice.
"			   If you're a more advanced user, building your own .vimrc based
"			   on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" temp disable/enable plugins area
"let loaded_tcomment=1

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
" pathogen install
execute pathogen#infect()

" filetype plugin on
"dunno if this is a good idea or not
filetype plugin indent on 

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" filetype indent plugin on
" filetype indent plugin on
" set ofu=syntaxcomplete#Complete

" Close tag script for HTML tags. Bound to Ctrl-] currently.
:au Filetype html,xml,xsl,php source ~/.vim/scripts/closetag.vim
au BufNewFile,BufRead *.less set filetype=less
" django snipmate stuff may break normal python snippets
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html.javascript " For SnipMate
autocmd FileType javascript set ft=javascriptnode.javascript " For SnipMate
" autocmd FileType javascript set ft=javascript.node " For SnipMate
" JSX enabled for js files
let g:jsx_ext_required = 0

" save folds and reload them - http://stackoverflow.com/a/15958534/2701322
" prevent gofmt of .go files from making things reformat
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
"python autocomplete dict
" let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_location = '~/.vim/vimfiles/ftplugin/pydiction/complete-dict'

" load pydiction's complete-dict this is for workign with supertab
" let &dictionary = '~/.vim/vimfiles/ftplugin/pydiction//complete-dict'
" set dict+=~/.vim/vimfiles/ftplugin/pydiction/pydiction-1.2/complete-dict
setlocal omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
" omnicomplete/supertab settings
" let g:SuperTabDefaultCompletionType="context"
" let g:SuperTabContextDefaultCompletionType="<c-x><c-k>"
" let g:SuperTabLongestHighlight = 1
" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&dictfunc']
" let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-n>", "&dictfunc:<c-x><c-k>"]
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
" let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
":set dictionary="/usr/dict/words"

" Enable syntax highlighting
syntax on
set background=dark
" Folding settings
set foldmethod=indent
set foldnestmax=1
nnoremap <space> za
" new shortcuts
let mapleader = ","
:nmap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>#
:vmap <leader>z :<C-U>%s/\<<c-r>*\>/
" quick save
noremap <Leader>w :update<CR>
" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC
" goes to the middle of a line
:nmap <Leader>m :call cursor(0, len(getline('.'))/2)<cr>


noremap ' `
noremap ` '
":colorscheme twilight256
" :colorscheme elflord
:colorscheme elflord
" :colorscheme midnight
"syntax on " syntax highlighting
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden
set history=1000
" stores marks in a viminfo file for up to 1000 files
set viminfo='1000

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" fucking dunno
set fo+=r
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
" set modeline
" set ls=2

" crazy syntax code
" adds to statusline
set statusline=%f- 
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

" a little more informative version of the above

" What is the current syntax highlighting group?
map <C-S-P> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") . " BG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#")<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
"nmap <C-S-P> :call <SID>SynStack()<CR>
"
"function! <SID>SynStack()
"	 if !exists("*synstack")
"		 return
"	 endif
"	 echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set title
set smartcase
" When you scroll off the screen, this will keep X rows below your cursor
set scrolloff=3
" jumps to search word as you type (annoying but excellent)
:set incsearch
:set wildignore=*.o,*.obj,*.bak,*.exe

"Tabbed support
"map <C-t><up> :tabr<cr> 
"map <C-t><down> :tabl<cr> 
"map <C-t><left> :tabp<cr> 
set pastetoggle=<F2>
"map <C-t><right> :tabn<cr>
map T :TaskList<CR>
map P :TlistToggle<CR>
map <ESC>[D :tabp<cr>
map <ESC>[A :tabr<cr>
map <ESC>[C :tabn<cr>
map <ESC>[B :tabl<cr>
map <C-J> :tabp<cr>
map <C-K> :tabn<cr>
" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" paste above / below
nmap <leader>p o<Esc>p==
nmap <leader>P O<Esc>p==

function! Tab_Or_Complete()
   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
	   return "\<C-N>"
   else
	   return "\<Tab>"
   endif
endfunction
:inoremap <c-j> <C-R>=Tab_Or_Complete()<CR>
:inoremap <c-l> <c-x><c-l>
":set dictionary="/usr/dict/words"

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Sets wordwrap without inserting a linebreak
:set wrap
:set linebreak
:set nolist  " list disables linebreak
:set textwidth=0
:set wrapmargin=0

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.	If visualbell is set, and
" this line is also included, vim will neither flash nor beep.	If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number
" map f3 to toggle number
nnoremap <F3> :set nonumber!<CR>

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=2
"set softtabstop=2
"set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set noexpandtab
:%retab!





"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>



