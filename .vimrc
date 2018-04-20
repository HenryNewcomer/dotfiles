" ================================================================
"                       Henry's Vim Config
" ================================================================

" Important values
set encoding=UTF-8
let mapleader = " "
filetype plugin on

" ================================================================
" REQUIRED VIM PLUG  - START AREA (beginning)
" ================================================================

" Installs Vim Plug if it's not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Starts Vim Plug
call plug#begin('~/.vim/vim_plugs')

" ================================================================
" REQUIRED VIM PLUG - START AREA (end)
" ================================================================

" ======================================
" --------------------------------------
" `Plugins:
" --------------------------------------

Plug 'scrooloose/nerdtree'
" Only start loading when first called
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
"Plug 'honza/vim-snippets'
"Plug 'terryma/vim-multiple-cursors'
Plug 'danro/rename.vim', { 'on':  'Rename' }
Plug 'editorconfig/editorconfig-vim'
Plug 'octol/vim-cpp-enhanced-highlight'

" Fuzzy finder
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Shortcut is gc (gcc for a line, gcap for a paragraph)
Plug 'tpope/vim-commentary'

" Markdown syntax highlighting
Plug 'gabrielelana/vim-markdown'

" Easy note-taking
Plug 'xolox/vim-notes'
" Required for note-taking plugin
Plug 'xolox/vim-misc'

"Plug 'tpope/vim-obsession'

Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

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
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Allows hex values to show their color representation visually
Plug 'chrisbra/Colorizer'


" Indentation
" -----------

" Indent Guides - thicker/more colorful
"Plug 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup = 1

" Indentline - ASCII themed/more subtle
" Note that this requires VIM's "conceal" to be enabled (it does this itself)
Plug 'yggdroot/indentline'
" Replace the symbol; good choices include: ¦ ┆ │ ⎸ ▏
let g:indentLine_char = '¦'
let g:indentLine_color_gui = '#17161c'
let g:indentLine_bgcolor_gui = '#1f1e24'

" Adds extra padding for a zen-like experience
" If I decide that these key bindings are too long, switch to F11/S+F11 (like fullscreen)
Plug 'junegunn/goyo.vim'
nnoremap <Leader>zen :Goyo<CR>


" ======================================
" --------------------------------------
" Themes, icons, etc:
" --------------------------------------

" --------
" Icons:
" --------
" (Not used; glyph glitches with current font)
Plug 'ryanoasis/vim-devicons'

" --------
" Themes:
" --------

"Plug 'mhartington/oceanic-next'

" One of my favorite themes
Plug 'tomasiser/vim-code-dark'

" Note: Also has Liteline and Airline theme support
"Plug 'joshdick/onedark.vim'
"colorscheme onedark

"Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }

" Large selection of themes
"Plug 'flazz/vim-colorschemes'

"Plug 'nightsense/stellarized'
"colorscheme stellarized_dark

"Plug 'altercation/solarized'
"colorscheme solarized

" VSCode-like
"Plug 'nanotech/jellybeans.vim'

" Even more VSCode-like
" Includes airline and lightline themes
Plug 'jacoborus/tender.vim'

Plug 'junegunn/seoul256.vim'
"colorscheme seoul256


" My custom themes
" ----------------------------------------------
Plug 'HenryNewcomer/vim-theme-underflow'
Plug 'HenryNewcomer/vim-theme-mutenight-scene'
Plug 'HenryNewcomer/vim-theme-papaya'


" Alternate between themes
" ------------------------

" Allows you to preview colors on a working/open file
" Easy implementation of http://vim.wikia.com/wiki/Switch_color_schemes#Script
Plug 'felixhummel/setcolors.vim'
" Changes the shortcuts
nnoremap <F8> :call NextColor(1)<CR>
nnoremap <F7> :call NextColor(-1)<CR>
nnoremap <F6> :call NextColor(0)<CR>


" --------------------------------- "
" Airline, lightline, etc.          "
" (Only have one active at a time!) "
" --------------------------------- "

"Plug 'itchyny/lightline.vim'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='tender'
"let g:airline_theme='angr'
"let g:airline_theme='onedark'
"let g:airline_theme='oceanicnext'


" ================================================================
" REQUIRED VIM PLUG - END AREA (beginning)
" ================================================================

call plug#end()

" ================================================================
" REQUIRED VIM PLUG - END AREA (end)
" ================================================================

"               +++++++++++++++++++++++++++++++++++
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"               +++++++++++++++++++++++++++++++++++

" ======================================
" --------------------------------------
" `Settings:
" (Custom values)
" --------------------------------------

" Current Vim theme
colorscheme papaya
"colors mutenight_scene
set background=dark
set cursorline

if (has("termguicolors"))
  set termguicolors
endif

syntax on
set encoding=UTF-8
set nowrap
set textwidth=0 wrapmargin=0

" Turns off the beep sound
set visualbell

set number
set relativenumber
set ruler
set showcmd

" <TAB> related
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab
set autoindent
retab

" Makes splits appear in the directions I prefer
set splitright
set splitbelow

" Always display the status line
set laststatus=2


" TODO: I haven't tested this yet, so I don't know if it works
set matchpairs+=<:>,":",':',(:),{:}
set showmatch

" Useful when using the 'gf' command ontop of a filename
let &path.="src/include,/usr/include"

" Unclutters the working directory
set backupdir=/tmp
set directory=/tmp

" Changes the 80th+ column's chars to a color of choice
highlight OverLength ctermbg=red ctermfg=white guibg=#1b1a1f
" TODO: Only change the 80th column as opposed to everything after it
match OverLength /\%81v.\+/

" Enable "Elite mode" (no arrows!)
let g:elite_mode=1


" ======================================
" --------------------------------------
" Extra plugin settings
" --------------------------------------


" FZF
" ---
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


" ======================================
" --------------------------------------
" `Key bindings:
" --------------------------------------

" Note that <Leader> is set to <Space>

" Bind Ctrl+e to Esc while in Insert mode
" Disabling this to get into the habit of pressing Caps Lock instead
" imap <C-e> <Esc>

nnoremap <Leader>o :NERDTreeToggle<CR>

" Makes adding new lines a bit more user-friendly
nnoremap o o<Esc>
nnoremap O O<Esc>
"nnoremap <Leader>o o
"nnoremap <Leader>O O

" If I feel like being lazy
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" Add mappings if capital letters were accidentally used
cabbrev Q! q!
cabbrev Q quit
cabbrev W write

" Trim (trailing) whitespace
nnoremap <Leader>tw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:echo "Trimmed trailing whitespace."<CR>

" Easier split navigation
" Note that CTRL+h/j/k/l is reserved for Tmux unless <Leader> is used
nnoremap <Leader>sv :vnew<CR>
nnoremap <Leader>sh :new<CR>
nnoremap <Leader><C-h> <C-w><C-h>
nnoremap <Leader><C-j> <C-w><C-j>
nnoremap <Leader><C-k> <C-w><C-k>
nnoremap <Leader><C-l> <C-w><C-l>

" Allows vim to easily open a split and edit the .vimrc file
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>:echo "Opening .vimrc file"<CR>
" Update the .vimrc source file
nnoremap <Leader>rs :source $MYVIMRC<CR>:echo "Reloaded the source file."<CR>

" TODO: Change this shortcut depending on how much I decide to use it over Tmux
nnoremap <Leader>term :terminal<CR>:echo "Opening terminal"<CR>

" Tab and Shift+tab controls indentation like most IDEs
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <Tab> <C-t> 
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" ----                           TODO: Add commands that get sent to Tmux via <Leader>t and then a
"  letter

" Inserts a space after two <SPACE> presses, when in normal mode
nnoremap <Leader><Leader> i <Esc>

" Move to the first or last character within a line, without entering Insert
" Mode
nnoremap <Leader>h 0
nnoremap <Leader>l $
"
" Easier than typing ":PlugInstall" all the time
nnoremap <Leader>pi :PlugInstall<CR>


" =====================================
" --------------------------------------
" `Extra stuff
" --------------------------------------

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    <Nop>
    nnoremap <Down>  <Nop>
    nnoremap <Left>  <Nop>
    nnoremap <Right> <Nop>
endif

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

