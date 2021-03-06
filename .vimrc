" ================================================================
"                       Henry's Vim Config
" ================================================================

" Important values
set encoding=UTF-8
let mapleader = " "
filetype plugin on

" Detect OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" Installs Vim Plug if it's not found
if g:os == "Windows"
    if empty(glob('~\vimfiles\autoload\plug.vim'))
        md ~\vimfiles\autoload
        $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        (New-Object Net.WebClient).DownloadFile(
          $uri,
          $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
            "~\vimfiles\autoload\plug.vim"
          )
        )
    endif
    " Starts Vim Plug
    call plug#begin('~\vimfiles\vim_plugs')
elseif g:os == "Linux"
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    " Starts Vim Plug
    call plug#begin('~/.vim/vim_plugs')
endif


" =-=-=-=-=-=-=-=-=-=
" PLUGINS:
" =-=-=-=-=-=-=-=-=-=

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " Only start loading when first called
  " Close Vim if NERDTree is the only window open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let NERDTreeQuitOnOpen = 1
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
"Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
"Plug 'terryma/vim-multiple-cursors'
Plug 'danro/rename.vim', { 'on':  'Rename' }
Plug 'editorconfig/editorconfig-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-commentary' " Shortcut is gc (gcc for a line, gcap for a paragraph)
Plug 'gabrielelana/vim-markdown' " Shortcut is gc (gcc for a line, gcap for a paragraph)
Plug 'xolox/vim-notes' " Easy note-taking
Plug 'xolox/vim-misc' " Required for note-taking plugin
Plug 'nvie/vim-flake8' " Python syntax and style checker
Plug 'mhinz/vim-startify'
"Plug 'tpope/vim-obsession'
"Plug 'terryma/vim-smooth-scroll'
  "noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  "noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  "noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  "noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
Plug 'alvan/vim-closetag'
  " filenames like *.xml, *.html, *.xhtml, ...
  " These are the file extensions where this plugin is enabled.
  let g:closetag_filenames = '*.html,*.htm'
  " integer value [0|1]
  " This will make the list of non-closing tags case-sensitive
  " (e.g. `<Link>` will be closed while `<link>` won't.)
  let g:closetag_emptyTags_caseSensitive = 1
  " Shortcut for closing tags, default is '>'
  let g:closetag_shortcut = '>'
  " Add > at current position without closing the current tag, default is ''
  let g:closetag_close_shortcut = '<leader>>'
" Auto-completion framework
"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif
  "let g:deoplete#enable_at_startup = 1
Plug 'chrisbra/Colorizer' " Allows hex values to show their color representation visually
  nnoremap <Leader>hc :ColorToggle<CR>
  nnoremap <Leader>ht :RGB2Term #
" A color selector
Plug 'KabbAmine/vCoolor.vim'
  let g:vcoolor_lowercase = 1
  "let g:vcoolor_disable_mappings = 1
  "let g:vcoolor_map = '<Leader>c'
  nnoremap <Leader>c :VCoolor<CR>
  inoremap <C-c> <Esc>:VCoolor<CR>i
"Plug 'nathanaelkane/vim-indent-guides' " Indent Guides (thicker/more colorful)
  "let g:indent_guides_enable_on_vim_startup = 1
Plug 'yggdroot/indentline'
  autocmd FileType markdown let g:indentLine_enabled=0 " Disable this plugin when viewing markdown files (the conceal feature becomes annoying, otherwise).
  let g:indentLine_char = '¦' " Replace the symbol; good choices include: ¦ ┆ │ ⎸ ▏
Plug 'junegunn/goyo.vim' " Adds extra padding for a zen-like experience
  nnoremap <Leader>zen :Goyo<CR>
" Fuzzy finder (PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " This is the default extra key bindings
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
  " Default fzf layout
  " - down / up / left / right
  let g:fzf_layout = { 'down': '~40%' }
  " In Neovim, you can set up fzf window using a Vim command
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_layout = { 'window': '-tabnew' }
  let g:fzf_layout = { 'window': '10split enew' }
  " Customize fzf colors to match your color scheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
  " Enable per-command history.
  " CTRL-N and CTRL-P will be automatically bound to next-history and
  " previous-history instead of down and up. If you don't like the change,
  " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)
  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

" =-=-=-=-=-=-=-=-=-=
" THEMES:
" =-=-=-=-=-=-=-=-=-=

Plug 'ryanoasis/vim-devicons'
"Plug 'mhartington/oceanic-next'
Plug 'tomasiser/vim-code-dark' " One of my favorite themes
"Plug 'joshdick/onedark.vim' " Note: Also has Liteline and Airline theme support
  "colorscheme onedark
"Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
"Plug 'nightsense/stellarized'
  "colorscheme stellarized_dark
"Plug 'altercation/solarized'
  "colorscheme solarized
"Plug 'nanotech/jellybeans.vim' " VSCode-like
Plug 'jacoborus/tender.vim' " Even more VSCode-like; includes airline and lightline themes
"Plug 'junegunn/seoul256.vim'
  "colorscheme seoul256

" My custom themes:
Plug 'HenryNewcomer/vim-theme-papaya'
"Plug 'HenryNewcomer/vim-theme-mutenight-scene'
"Plug 'HenryNewcomer/vim-theme-underflow'

" Airline & lightline
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_powerline_fonts = 1
  let g:airline_theme='tender'
  "let g:airline_theme='angr'
  "let g:airline_theme='onedark'
  "let g:airline_theme='oceanicnext'

" Ends Vim Plug
call plug#end()


" =-=-=-=-=-=-=-=-=-=
" SETTINGS:
" =-=-=-=-=-=-=-=-=-=

colorscheme papaya
let g:papaya_gui_color='blue'

" Changes the 80th+ column's chars to a color of choice
match OverLength /\%81v.\+/

if (has("termguicolors"))
  set termguicolors
endif
set background=dark
set cursorline
set encoding=UTF-8
set ignorecase smartcase
set nowrap
set textwidth=0 wrapmargin=0
set visualbell " Turns off the beep sound
set number
set relativenumber
set ruler
set showcmd
set splitright
set splitbelow
set laststatus=2 " Always display the status line
set matchpairs+=<:>,":",':',(:),{:}
set showmatch
set wildignore=*.pyc,.o
let &path.="src/include,/usr/include" " Useful when using the 'gf' command ontop of a filename
let g:elite_mode=1 " Enable 'Elite mode' (no arrows!)
" Visible indicators
set list
if g:os == "Linux"
    set list listchars=trail:␣,nbsp:~,precedes:←,extends:→
    set showbreak=↪\ " When word wrapping is enabled
elseif g:os == "Windows"
    set list listchars=trail:!,nbsp:~,precedes:←,extends:→
    set showbreak=!\ " When word wrapping is enabled
endif
" <TAB> related
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set modifiable " This was added to get retab to work on my Windows OS
retab
" Cursor config
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait0
" Improved backup, swap, and undo storage
set history=1000
set noswapfile
set backup
set undofile
if g:os == "Linux"
  set backupdir=~/.vim/dirs/backup
    if !isdirectory(&backupdir)
      call mkdir(&backupdir, "p")
    endif
  set undodir=~/.vim/dirs/undo
    if !isdirectory(&undodir)
      call mkdir(&undodir, "p")
    endif
  "set directory=/tmp " TODO: Do I need this?
elseif g:os == "Windows"
    set backupdir=C:\WINDOWS\Temp
    set backupskip=C:\WINDOWS\Temp\*
    set directory=C:\WINDOWS\Temp
    set undodir=C:\WINDOWS\Temp
    set writebackup
endif
set breakindent     " TODO: Testing to see if I want this setting

if has("gui_running")
  " GUI: Force larger window"
  set lines=999 columns=999
  set guioptions-=m " Removes the menu bar
  set guioptions-=T " Removes the toolbar
  set guioptions-=r " Removes the right-hand scroll bar
  set guioptions-=L " Removes left-hand scroll bar
  if g:os == "Windows"
    set guifont=Lucida_Console:h10:cANSI
  endif
else
  " Console
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif


" =-=-=-=-=-=-=-=-=-=
" KEY BINDINGS:
" =-=-=-=-=-=-=-=-=-=

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>tty :terminal<CR>
" Deletes the current search highlight
nnoremap <silent> <Leader>ds :noh<CR>:echo "Cleared search string"<CR>
" Don't automatically enter Insert Mode when using o / O
nnoremap o o<Esc>
nnoremap O O<Esc>
" Toggle word wrapping
nnoremap <silent> <Leader>ww :call ToggleWrap()<CR>
" Toggle truecolors/256 colors
nnoremap <silent> <Leader>tg :call ToggleTermGuiColors()<CR>
" Output highlight groups while using the current theme
nnoremap <silent> <Leader>hg :so $VIMRUNTIME/syntax/hitest.vim<CR>:set nolist<CR>
" Add mappings if capital letters were accidentally used
cabbrev Q! q!
cabbrev Q quit
cabbrev W write
" Trim (trailing) whitespace
nnoremap <silent> <Leader>tw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:echo "Trimmed trailing whitespace."<CR>
" Easier split navigation
nnoremap <Leader>nh :new<CR>
nnoremap <Leader>sh :split<CR>
nnoremap <Leader>nv :vnew<CR>
nnoremap <Leader>sv :vsplit<CR>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
" Allows vim to easily open a split and edit the .vimrc file
nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<CR>:echo "Opening .vimrc file"<CR>
" Updates the .vimrc source file
nnoremap <silent> <Leader>rv :source $MYVIMRC<CR>:echo "Reloaded the source file."<CR>
" Tab and Shift+tab controls indentation like most IDEs
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Inserts a space after two <SPACE> presses when in normal mode
nnoremap <Leader><Leader> i <Esc>
" Move to the first or last character within a line
nnoremap <Leader>h ^
nnoremap <Leader>l $
" Find & Replace
nnoremap <Leader>fr :%s//g<Left><Left>
vnoremap <Leader>fr :s//g<Left><Left>
" Easier system copy & paste
nnoremap <Leader>y "*y
nnoremap <Leader>Y "*Y
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
" Filter through command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Creates a more user-friendly, IDE-like completion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<C-g>u<CR>"
" When there are suggestions, keep one highlighted
inoremap <expr> <C-p> pumvisible() ? "<C-p>" : '<C-p><C-R>=pumvisible() ? "\<lt>Up>" : ""<CR>'
inoremap <expr> <C-n> pumvisible() ? "<C-n>" : '<C-n><C-R>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" =-=-=-=-=-=-=-=-=-=
" FILETYPE SPECIfICS
" =-=-=-=-=-=-=-=-=-=

" Tabs
autocmd FileType vim set tabstop=2 softtabstop=0 shiftwidth=2
autocmd FileType sh  set tabstop=2 softtabstop=0 shiftwidth=2
autocmd FileType css set tabstop=2 softtabstop=0 shiftwidth=2

" =-=-=-=-=-=-=-=-=-=
" EXTRAS
" =-=-=-=-=-=-=-=-=-=

" Uses a keybind to easily toggle word-wrapping
function! ToggleWrap()
  if &wrap
    set nowrap
    echo "Disabled word wrapping."
  else
    set wrap
    echo "Enabled word wrapping."
  endif
endfunction

function! ToggleTermGuiColors()
  if &termguicolors
    set notermguicolors
    echo "Disabled 24-bit truecolors. Now using 256 colors."
  else
    set termguicolors
    echo "Enabled 24-bit truecolors"
  endif
endfunction

" Disable arrow movement, resize splits instead.
" Think of these as increasing/decreasing the height/width of the focused split
if get(g:, 'elite_mode')
    nnoremap <Up>    :res             +5<CR>
    nnoremap <Down>  :res             -5<CR>
    nnoremap <Left>  :vertical resize -5<CR>
    nnoremap <Right> :vertical resize +5<CR>
endif

" Show syntax highlighting groups for word under cursor
" (Useful for developing themes)
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Use Ag as default grep if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m
  command! -nargs=+ -bang Ag silent! grep <args> | redraw! | botright copen
endif

" Generate help tags for plugins
packloadall
silent! helptags ALL

" EoF