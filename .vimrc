" ================================================================
"                       Henry's Vim Config
" ================================================================

" Important values
set t_Co=256
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe

Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


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

" Probably my favorite theme
Plug 'tomasiser/vim-code-dark'

Plug 'nightsense/stellarized'
"colorscheme stellarized_dark

Plug 'skielbasa/vim-material-monokai'
"set background=dark
"set termguicolors
"colorscheme material-monokai

"Plug 'altercation/solarized'
"syntax enable
"set background=dark
"colorscheme solarized

Plug 'jdkanani/vim-material-theme'
"syntax enable
"set background=dark
"colorscheme material-theme

" Note: Liteline and Airline theme support
Plug 'joshdick/onedark.vim'
"syntax on
"colorscheme onedark

Plug 'mhartington/oceanic-next'
"colorscheme OceanicNext

"Plug 'rakr/vim-one'
"colorscheme one
"set background=dark
"let g:airline_theme='one'

Plug 'marcopaganini/termschool-vim-theme'
"colorscheme termschool


" --------------------------------- "
" Airline, lightline, etc.        "
" (Only have one active at a time!) "
" --------------------------------- "

"Plug 'itchyny/lightline.vim'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'


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

syntax on
set nowrap
set encoding=UTF-8
set showcmd

" Turns off the beep sound
set visualbell

set number
set relativenumber
set ruler
set cursorline

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


" ====================================== 
" --------------------------------------
" Plug settings
" --------------------------------------

colorscheme codedark

" Changes the 80th column's chars to a color of choice
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='angr' " Preferred
"let g:airline_theme='onedark'
"let g:airline_theme='oceanicnext'


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

:imap ;; <Esc>
map <C-o> :NERDTreeToggle<CR>
"map <Leader>f :NERDTreeToggle<CR>

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

