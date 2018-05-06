" ================================================================
"                       Henry's Vim Config
" ================================================================

" Important values
set encoding=UTF-8
let mapleader = " "
filetype plugin on

" Installs Vim Plug if it's not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Starts Vim Plug
call plug#begin('~/.vim/vim_plugs')


" =-=-=-=-=-=-=-=-=-=
" PLUGINS:
" =-=-=-=-=-=-=-=-=-=

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " Only start loading when first called
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
"Plug 'terryma/vim-multiple-cursors'
Plug 'danro/rename.vim', { 'on':  'Rename' }
Plug 'editorconfig/editorconfig-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-commentary' " Shortcut is gc (gcc for a line, gcap for a paragraph)
Plug 'gabrielelana/vim-markdown' " Shortcut is gc (gcc for a line, gcap for a paragraph)
Plug 'xolox/vim-notes' " Easy note-taking
Plug 'xolox/vim-misc' " Required for note-taking plugin
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
"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif
  "let g:deoplete#enable_at_startup = 1
"Plug 'chrisbra/Colorizer' " Allows hex values to show their color representation visually
"Plug 'nathanaelkane/vim-indent-guides' " Indent Guides (thicker/more colorful)
  "let g:indent_guides_enable_on_vim_startup = 1
Plug 'yggdroot/indentline'
  autocmd FileType markdown let g:indentLine_enabled=0 " Disable this plugin when viewing markdown files (the conceal feature becomes annoying, otherwise).
  let g:indentLine_char = '¦' " Replace the symbol; good choices include: ¦ ┆ │ ⎸ ▏
  "let g:indentLine_color_gui = '#17161c'
  "let g:indentLine_bgcolor_gui = '#1f1e24'
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
if (has("termguicolors"))
  set termguicolors
endif
syntax on
set background=dark
set cursorline
set encoding=UTF-8
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
" <TAB> related
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab
set autoindent
retab
" Unclutters the working directory
set backupdir=/tmp
set directory=/tmp

set matchpairs+=<:>,":",':',(:),{:}
set showmatch

let &path.="src/include,/usr/include" " Useful when using the 'gf' command ontop of a filename
let g:elite_mode=1 " Enable 'Elite mode' (no arrows!)

" Changes the 80th+ column's chars to a color of choice
match OverLength /\%81v.\+/
"highlight OverLength ctermbg=red ctermfg=white guibg=#110f17


" =-=-=-=-=-=-=-=-=-=
" KEY BINDINGS:
" =-=-=-=-=-=-=-=-=-=

" (NOTE THAT <Leader> WAS SET TO <Space>)

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>term :terminal<CR>:echo "Opening terminal"<CR>
" Clears the current search highlight
nnoremap <Leader>cs :noh<CR>:echo "Cleared search string"<CR>
" Makes adding new lines a bit more user-friendly
nnoremap o o<Esc>
nnoremap O O<Esc>
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
" Updates the .vimrc source file
nnoremap <Leader>rs :source $MYVIMRC<CR>:echo "Reloaded the source file."<CR>
" Tab and Shift+tab controls indentation like most IDEs
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Inserts a space after two <SPACE> presses when in normal mode
nnoremap <Leader><Leader> i <Esc>
" Move to the first or last character within a line, without entering Insert Mode
nnoremap <Leader>h 0
nnoremap <Leader>l $


" =-=-=-=-=-=-=-=-=-=
" EXTRAS
" =-=-=-=-=-=-=-=-=-=

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

