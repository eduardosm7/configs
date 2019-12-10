" ===========================
" => External Dependencies <=
" ===========================
" Python's Neovim Lib
"   $ pip3 install neovim --user
"
" The Silver Searcher
"   $ sudo apt-get install silversearcher-ag
"
" Powerline Fonts
"   $ sudo apt-get install fonts-powerline
" ===========================

" =============
" => Plugins <=
" =============
"
" After loading this config file, :PlugInstall<cr> to install the plugins
"
call plug#begin()
Plug 'morhetz/gruvbox'                 " Gruvbox theme
Plug 'terryma/vim-multiple-cursors'    " Press CTRL-N to select multiple cursors
Plug 'sheerun/vim-polyglot'            " Better syntax highlight
Plug 'tpope/vim-surround'              " Deal with surroundings
Plug 'tommcdo/vim-exchange'            " Text exchange
Plug 'dylanaraps/root.vim'             " Changes current directory to repository root
Plug 'w0rp/ale'                        " Linter
Plug 'jiangmiao/auto-pairs'            " Automatically adds a pair to chars like { ( [
Plug 'vim-airline/vim-airline'         " Better bar on bottom
Plug 'vim-airline/vim-airline-themes'  " Themes for vim-airline
Plug 'tpope/vim-fugitive'              " Git wrapper
Plug 'scrooloose/nerdtree'             " File manager
Plug 'machakann/vim-highlightedyank'   " Highlight yank command
Plug 'andymass/vim-matchup'            " Match blocks
Plug 'tpope/vim-commentary'            " Handle commentaries

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " Install fzf
Plug 'junegunn/fzf.vim'                                            " Install fzf vim plugin

" Autocomplete
Plug 'ncm2/ncm2'          " Autocomplete
Plug 'ncm2/ncm2-bufword'  " Autocomplete from words in buffer
Plug 'ncm2/ncm2-path'     " Autocomplete path
Plug 'roxma/nvim-yarp'    " Make vim scripts with python -> pip3 install neovim --user -> ncm2 dependency

call plug#end()
" =============

" ===========================
" => Plugin Configurations <=
" ===========================
" ncm2
"   enable autocomplete words from all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
"   :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone

" vim-airline
"   display buffers
let g:airline#extensions#tabline#enabled = 1
"   set airline theme
let g:airline_theme='minimalist'
"   airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"     unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"     airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

" nerdtree
"   show hidden files
let g:NERDTreeShowHidden=1
" ===========================

" ===========
" => Theme <=
" ===========
colorscheme gruvbox
set background=dark
" ===========

" ===========================
" => Editor Configurations <=
" ===========================
filetype plugin indent on   " Turns on 'detection', 'plugin' and 'indent'
set hidden                  " Allows edit other files without the need to save the current
set number                  " Shows line numbers on the left
set relativenumber          " Shows line relative numbers on the left
set inccommand=split        " Allows better search and replace visualization
set tabstop=4               " Shows existing tab with 4 spaces width
set shiftwidth=4            " When indenting with '>', use 4 spaces width
set expandtab               " On pressing tab, insert 4 spaces
set cursorline              " Highlights current cursor line
set clipboard+=unnamedplus  " Highlights current cursor line
" ===========================

" =====================
" => Leader Commands <=
" =====================
" Set Leader to the space character [SPACE]
let mapleader="\<space>"

" Add ; at the end of line [LEADER ;]
nnoremap <leader>; A;<esc>

" Buffer switching
"   change to last buffer [LEADER LEADER]
nnoremap <leader><leader> <c-^>
"   change to specific buffer [LEADER <1-9>]
"   TODO: Refactor
nnoremap <leader>1 :b1<cr>
nnoremap <leader>2 :b2<cr>
nnoremap <leader>3 :b3<cr>
nnoremap <leader>4 :b4<cr>
nnoremap <leader>5 :b5<cr>
nnoremap <leader>6 :b6<cr>
nnoremap <leader>7 :b7<cr>
nnoremap <leader>8 :b8<cr>
nnoremap <leader>9 :b9<cr>
"   close buffer [LEADER ww]
nnoremap <leader>ww :bw<cr>
"   next buffer [LEADER l]
nnoremap <leader>l :bn<cr>
"   previous buffer [LEADER h]
nnoremap <leader>h :bp<cr>

" Copy to clipboard
vnoremap <leader>y "+y

" Nvim config
"   open nvim config file [LEARDER ev]
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
"   load nvim config file [LEARDER sv]
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
"   install plugins [LEARDER iv]
nnoremap <leader>iv :PlugInstall<cr>

" NERDTree
"   toggle nerdtree [LEADER b]
nnoremap <leader>b :NERDTreeToggle<cr>
" =====================

" ======================
" => General Commands <=
" ======================
" Make W always w in command mode
cnoremap W w

" Fuzzy search
"   on files [CTRL-P]
nnoremap <c-p> :Files<cr>
"   on file contents [CTRL-F] -> the_silver_searcher must be installed
nnoremap <c-f> :Ag<cr>
" ======================
