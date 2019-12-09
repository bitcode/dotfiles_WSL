set nocompatible              " be iMproved, required
filetype off                  " required                                        
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bash-support.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdtree'
Plugin 'nginx.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim'
Plugin 'blackrush/vim-gocode'
Plugin 'sebdah/vim-delve'
Plugin 'shougo/vimshell.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'roxma/vim-tmux-clipboard'
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
syntax on
set background=dark
set cursorline
colorscheme onedark
set term=xterm-256color
set encoding=utf-8
set backspace=indent,eol,start
set number
set guifont=DroidSansMono\ Nerd\ Font\ 12
set mouse=a
set clipboard=unnamedplus
set laststatus=2
let NERDTreeShowHidden = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let python_highlight_all = 1
let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
let g:onedark_terminal_italics = 1
let g:rainbow_active = 1
" golang syntax highlighting 
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
" golang settings
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
" NERDtree plugin settings
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
vnoremap <C-c> "+y
map <C-p> "+P
" NERDtree auto open w/ no args
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()
