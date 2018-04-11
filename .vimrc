" ================================================================
"                       Henry's Vim Config
" ================================================================

" Important values
set t_Co=256
:let mapleader = " "

" ================================================================
" REQUIRED VUNDLE - START AREA (beginning)
" ================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ================================================================
" REQUIRED VUNDLE - START AREA (end)
" ================================================================

" ====================================== 
" --------------------------------------
" General plugins:
" --------------------------------------

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-repeat'
"Plugin 'honza/vim-snippets'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'danro/rename.vim'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'

" Fuzzy finder
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

"Plugin 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe

Plugin 'terryma/vim-smooth-scroll'
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
" (Not used; glyph glitches with NERDTree)
"Plugin 'ryanoasis/vim-devicons'

" --------
" Themes:
" --------

" Probably my favorite theme
Plugin 'tomasiser/vim-code-dark'

Plugin 'nightsense/stellarized'
"colorscheme stellarized_dark

Plugin 'skielbasa/vim-material-monokai'
"set background=dark
"set termguicolors
"colorscheme material-monokai

"Plugin 'altercation/solarized'
"syntax enable
"set background=dark
"colorscheme solarized

Plugin 'jdkanani/vim-material-theme'
"syntax enable
"set background=dark
"colorscheme material-theme

" Note: Liteline and Airline theme support
Plugin 'joshdick/onedark.vim'
"syntax on
"colorscheme onedark

Plugin 'mhartington/oceanic-next'
"colorscheme OceanicNext

"Plugin 'rakr/vim-one'
"colorscheme one
"set background=dark
"let g:airline_theme='one'

Plugin 'marcopaganini/termschool-vim-theme'
"colorscheme termschool


" --------------------------------- "
" Airline, lightline, etc.        "
" (Only have one active at a time!) "
" --------------------------------- "

"Plugin 'itchyny/lightline.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'


" ================================================================
" REQUIRED VUNDLE - END AREA (beginning)
" ================================================================

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ================================================================
" REQUIRED VUNDLE - END AREA (end)
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
" Plugin settings
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
" Extra plugin values:
" --------------------------------------

" Auto-opens NERDTree in new Vim instance
"autocmd vimenter * NERDTree

" Lightline
"let g:lightline = {
"  \     'active': {
"  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
"  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
"  \     }
"  \ }



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

