" ------------------------------------------------------------
" Inspired by following blog:
" https://t.ly/X90t
" ------------------------------------------------------------

" ------------------------------------------------------------
" Load plugins
" ------------------------------------------------------------

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins will be downloaded under the specified directory
call vundle#begin('~/.vim/plugged')

" Setup Pathogen Runtime Path Manipulation
execute pathogen#infect()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax checking for languages (.cpp .py, .go, .js..)
Plugin 'scrooloose/syntastic'

" Syntax highlighting for languages (.cpp .py, .go, .js..)
Plugin 'sheerun/vim-polyglot'

" Insert pair brackets automatically
Plugin 'jiangmiao/auto-pairs'

" NERDTree file system explorer
Plugin 'preservim/nerdtree'

" Pull C++ prototypes into implementation file
Plugin 'derekwyatt/vim-protodef'

" Python linting
Plugin 'ambv/black'

" Autoformatting
Plugin 'Chiel92/vim-autoformat'

" Bottom bar
Plugin 'vim-airline/vim-airline'

" Colorscheme
Plugin 'morhetz/gruvbox'

" Make plugins visible
call vundle#end()
filetype plugin indent on


" ------------------------------------------------------------
" auto-pairs configuration
" ------------------------------------------------------------

let g:AutoPairsShortcutToggle = '<C-P>'

" ------------------------------------------------------------
" NERDTree configuration
" ------------------------------------------------------------

let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31
let NERDTreeChDirMode = 2

" Close NERDTree with last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ------------------------------------------------------------
" syntastic configuration
" ------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options = '--std=c++17'
let g:syntastic_cpp_checkers = ['clang_tidy']

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python3']

" ------------------------------------------------------------
" vim-autoformat configuration
" ------------------------------------------------------------

let g:formatters_python = ['black']

" ------------------------------------------------------------
" Vim configuration
" ------------------------------------------------------------

set nu                  " Enable line numbers
syntax on               " Enable synax highlighting
set incsearch           " Enable incremental search
set hlsearch            " Enable highlight search
set splitbelow          " Always split below"
set splitright          " Always split right"
set mouse=a             " Enable mouse drag on window splits
set tabstop=4           " How many columns of whitespace a \t is worth
set shiftwidth=4        " How many columns of whitespace a “level of indentation” is worth
set expandtab           " Use spaces when tabbing
set showtabline=2

" Uncomment this to set dark-mode depending on the time of the day
"let hours = strftime("%H")
"if hours > 8 && hours < 18
set background=dark
"else
"set background=light
"endif

" Set color scheme
colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

" Use autoformatter on saving file
au BufWrite * :Autoformat

" ------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------

" General
nmap        <C-B>     :buffers<CR>
nmap        <C-J>     :term<CR>

" NERDTree
nmap        <C-N>      :NERDTreeToggle<CR>

