set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype off              " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'

call vundle#end() 
filetype plugin indent on           " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256                        " enable 256-color mode.
syntax enable                       " enable syntax highlighting (previously syntax on).
colorscheme Tomorrow-Night-Eighties " set colorscheme
set number                          " show line numbers
set laststatus=2                    " last window always has a statusline
filetype indent on                  " activates indenting for files
set nohlsearch                      " Don't continue to highlight searched phrases.
set incsearch                       " But do highlight as you type your search.
set ignorecase                      " Make searches case-insensitive.
set ruler                           " Always show info along bottom.
set autoindent                      " auto-indent
set tabstop=2                       " tab spacing
set softtabstop=2                   " unify
set shiftwidth=2                    " indent/outdent by 4 columns
set shiftround                      " always indent/outdent to the nearest tabstop
set expandtab                       " use spaces instead of tabs
set smarttab                        " use tabs at the start of a line, spaces elsewhere
set nowrap                          " don't wrap text
set noshowmode                      " Remove vim status line at bottom

" NERDTree Settings "
autocmd vimenter * NERDTree                                                                           " open a NERDTree automatically when vim starts up
map <C-n> :NERDTreeToggle<CR>                                                                         " map a specific key or shortcut to open NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close vim if the only window left open is a NERDTree

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
