" In this file,lines start with '"' are comments.
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

"This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" hight todo
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

set nu
set bg=dark
set autoindent
set noswapfile
set hlsearch
set ignorecase
set incsearch
set foldmethod=indent
set foldlevel=99

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
"
"
" set leader
let mapleader = ","


" set the remap of some keys
inoremap jk <ESC>
nnoremap <leader>s <ESC>:w!<Cr>
nnoremap <leader>a <ESC>ggvG$<Cr>
nnoremap <leader><leader>f <Plug>(coc-fix-current)
nnoremap <C-g> :GFiles<Cr>
nnoremap <space> za
inoremap <leader>; <C-x><C-o>
nnoremap <leader>f <ESC>:FZF<Cr> 

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
" test annotati



" nnoremap <C-O> :NERDTreeToggle<Cr>
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')     
execute "set rtp+=" . g:opamshare . "/merlin/vim"

set laststatus=2

"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',  'for': ['c', 'cpp'] }

" vundle vim plugin manager setting

set nocompatible              " be iMproved, required
filetype off                  " required







" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" copilot


"code tree directory
Plugin 'scrooloose/nerdtree'

"indent line
Plugin 'Yggdroot/indentLine'

"fast search
Plugin 'junegunn/fzf', {'do':{->fzf#install()}}
Plugin 'junegunn/fzf.vim'

" markdown

"vim status highlight 
" Plugin 'itchyny/lightline.vim'

" code static check
" Plugin 'w0rp/ale'

"surround plugin
Plugin 'tpope/vim-surround'


" Markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'instant-markdown/vim-instant-markdown'

"comment file
Plugin 'tpope/vim-commentary'

"the simple fold extension
Plugin 'tmhedberg/SimpylFold'

"the git plugin
Plugin 'tpope/vim-fugitive'

" the json plugin
Plugin 'elzr/vim-json'

"the python auto-complete
" Plugin 'davidhalter/jedi-vim'
" Use release branch (recommend)
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" python venv support
Plugin 'sansyrox/vim-python-virtualenv'


"back to where you were when you open a new file
Plugin 'farmergreg/vim-lastplace.git'

"toml syntax support
Plugin 'cespare/vim-toml'

"cppman
Plugin 'gauteh/vim-cppman'


"auto pair
Plugin 'jiangmiao/auto-pairs'

" airline the status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"rainbow plugin
let g:rainbow_active = 1
Plugin 'frazrepo/vim-rainbow'

" plugin from http://vim-scripts.org/vim/scripts.html

"the function search plugin
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" tags
Plugin 'majutsushi/tagbar'

" themes 
Plugin 'tomasiser/vim-code-dark'

" icons
Plugin 'ryanoasis/vim-devicons'

" code runner
Plugin 'skywind3000/asynctasks.vim'
Plugin 'skywind3000/asyncrun.vim'


" Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
" Plug 'w0rp/ale'
call vundle#end()            " required

syntax enable
filetype plugin indent on    " required

let g:ale_linters = {
\  'rust': ['analyzer'],
\}

" configure the asyncrunner terminal width
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']

" \  'python':['flake8']
let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }

" Optional, configure as-you-type completions
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:rustfmt_autosave = 1

" some ale configuration
" keep the sign gutter open
" let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'
let g:ale_set_hignlights = 0
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
" let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

" " Fix Python files with autopep8 and yapf.
" let b:ale_fixers = [ 'yapf']

" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

" show errors or warnings in my statusline
" let g:airline#extensions#ale#enabled = 1

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
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

" Enable the merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" set the cppman as the dictionary
autocmd FileType cpp set keywordprg=cppman

" some auto cmd

" open and exit nerd automatically
" autocmd VimEnter * NERDTree|wincmd p
" autocmd VimEnter * wincmd p
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ==============================================
" some skelton

" ==============================================


" ==============================================
" xshell 


" ==============================================
" venv support
" python with virtualenv support


" =============================================
" code runner
" =============================================
map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

func! CompileRun()
exec "w"
exec "!clear"
if &filetype == 'c'
    exec "!gcc % -o %< && !time ./%<; rm ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -g -o %< && !time ./%<; rm ./%<"
elseif &filetype == 'java'
    exec "!javac % && !time java %; rm ./%<"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!google-chrome % &"
elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
elseif &filetype == 'matlab'
    exec "!time octave %"
elseif &filetype == 'rust'
	exec "!cargo r"
elseif &filetype == 'javascript'
        exec "!node %"
endif
endfunc


" =============================================
" indent
" =============================================
set autoindent 
set shiftwidth=4
set expandtab
set tabstop=4
    
" =============================================
" copy and paste from tty
" vim-gtk supported
" =============================================
set clipboard=unnamed
set mouse=a


" =============================================
" color schema
" =============================================
colorschem codedark
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" =============================================
" set the airline
" =============================================
let g:airline_powerline_fonts = 1
let t_Co = 256

" =============================================
" coc configuration
" =============================================
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" =============================================
" // coc configuration
" =============================================
nmap <leader><leader>f  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

" =============================================
" // coc file explorer
" =============================================
nmap <leader>e <Cmd>CocCommand explorer<CR>

" =============================================
" // coc file explorer
" =============================================
nmap <leader>5 <Cmd>AsyncTask file-build<CR>
nmap <leader>9 <Cmd>AsyncTask file-run<CR>

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" =============================================
" change the auto complete backgroud color
" =============================================
hi Pmenu        ctermfg=white ctermbg=black gui=NONE guifg=white guibg=black
hi PmenuSel     ctermfg=white ctermbg=blue gui=bold guifg=white guibg=purple



" =============================================
" fix the backspace and completion confilt
" =============================================
set backspace=indent,eol,start


" =============================================
" color schema
" =============================================

" =============================================
" color schema
" =============================================
