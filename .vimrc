" Solarized is installed with pathogen
execute pathogen#infect()

" Enable syntax processing
syntax enable

" Solarized colorscheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Spaces and tabs
set tabstop=2
set softtabstop=2
set expandtab

" Line numbers and highlighting
set number
set cursorline
set showmatch

" Indentation
filetype indent on

" This should speed up some macros
set lazyredraw

" Searching
set incsearch
set hlsearch

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" <space> opens/closes folds
nnoremap <space> za

" vim-airline stuff
set laststatus=2
set noshowmode
let g:airline_powerline_fonts=1

" Language-specific stuff
augroup configgroup
  " Clear whatever auto-commands are lying around      
  autocmd!

  " Turn off expandtab for Makefile
  autocmd BufEnter Makefile setlocal noexpandtab

augroup END
