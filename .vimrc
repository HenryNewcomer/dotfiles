" ================================================================
"                       Henry's Vim Config
" ================================================================

" Important values
set t_Co=256
set encoding=UTF-8
:let mapleader = " "

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
" General plugins:
" --------------------------------------

Plug 'scrooloose/nerdtree'
" Only start loading when first called
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
"Plug 'honza/vim-snippets'
"Plug 'terryma/vim-multiple-cursors'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'

" Fuzzy finder
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Shortcut is gc (gcc for a line, gcap for a paragraph)
Plug 'tpope/vim-commentary'

"Plug 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe

"Plug 'tpope/vim-obsession'

Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

Plug 'Valloric/YouCompleteMe'

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

" Indent Guides - thicker/more colorful
"Plug 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup = 1

" Indentline - ASCII themed/more subtle
" Note that this requires VIM's "conceal" to be enabled (it does this itself)
Plug 'yggdroot/indentline'
" Replace the symbol; good choices include: ¦ ┆ │ ⎸ ▏
let g:indentLine_char = '¦'
let g:indentLine_color_gui = '#324754'

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

"Plug 'chriskempson/base16-vim'

" Allows you to preview colors on a working/open file
" Easy implementation of http://vim.wikia.com/wiki/Switch_color_schemes#Script
Plug 'felixhummel/setcolors.vim'
" Changes the shortcuts
nnoremap <F8> :call NextColor(1)<CR>
nnoremap <F7> :call NextColor(-1)<CR>
nnoremap <F6> :call NextColor(0)<CR>

" Attempt to add theme colors to GUI Vim (which I don't use)
if (has("termguicolors"))
  set termguicolors
endif

" My custom theme
Plug 'HenryNewcomer/vim-theme-underflow'


" --------------------------------- "
" Airline, lightline, etc.        "
" (Only have one active at a time!) "
" --------------------------------- "

"Plug 'itchyny/lightline.vim'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='angr' " Preferred
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
" Custom values:
" --------------------------------------

colorscheme mutenight_scene
" Current Vim theme
set background=dark
set cursorline

syntax on
set nowrap
set encoding=UTF-8
set showcmd

" Turns off the beep sound
set visualbell

set number
set relativenumber
set ruler
"""set cursorline

" Tabs to spaces
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab
retab

" Always display the status line
set laststatus=2

" Enable "Elite mode" (no arrows!)
let g:elite_mode=1

" Sets the 80th column to an alt color
"set colorcolumn=80
"highlight ColorColumn ctermbg=darkgray

" Useful when using the 'gf' command ontop of a filename
let &path.="src/include,/usr/include"

" Unclutters the working directory
set backupdir=/tmp
set directory=.,/tmp

" Changes the 80th column's chars to a color of choice
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

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
" Key bindings
" --------------------------------------

" Note that <Leader> is set to <Space>

" Bind Ctrl+e to Esc while in Insert mode
:imap <C-e> <Esc>
map <C-o> :NERDTreeToggle<CR>

nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap <Leader>o o
nnoremap <Leader>O O

" Inserts a space when in normal mode
nnoremap <Leader><Leader> i <Esc>

" ======================================
" --------------------------------------
" Extra stuff
" --------------------------------------

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize -2<CR>
    nnoremap <Down>  :resize +2<CR>
    nnoremap <Left>  :resize -2<CR>
    nnoremap <Right> :resize +2<CR>
endif

