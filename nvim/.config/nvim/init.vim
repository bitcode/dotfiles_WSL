" - Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" Initialize plugin system
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'VundleVim/Vundle.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'git://git.wincent.com/command-t.git'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'blackrush/vim-gocode'
Plug 'sebdah/vim-delve'
Plug 'shougo/vimshell.vim'
Plug 'shougo/vimproc.vim'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'roxma/vim-tmux-clipboard'
call plug#end()
filetype plugin indent on    " required

" ------------ Settings ------------------

language en_US.UTF8
syntax enable
syntax on
colorscheme gruvbox
set showmatch mat=2
set background=dark
set cursorline
set encoding=utf8
set backspace=indent,eol,start
set number
set wildmenu
set wildignore=*.o,*~,*/.git/*,*/target/*
set mouse=a
set clipboard=unnamedplus
set laststatus=2
set guifont=Iosevka\ Regular:h16

" ------- 256 ColorTerm -----------------

{% if editor.name == "vim" %}
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
  {% endif %}

" -------- UI Settings ---------

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
let g:onedark_terminal_italics = 1
let g:rainbow_active = 1

" ----- Go Plugin Settings highlighting --------

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
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"

"---- NERDtree plugin settings -------------

let NERDTreeShowHidden = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" ----- Rust Plugin Settings ----------

let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let g:racer_insert_paren = 1

" ----- Typescript Plugin Settings -----

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"let g:typescript_ignore_browserwords

" ------ JSX Pretty Plugin Settings -----

let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

" vim-racer enables C-x-C-o to search for completion
" Example Mappings

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

" ----- Remap yank & paste -------------

vnoremap <C-c> "+y
map <C-p> "+P

" --- Fix Lines on Scroll -----

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" ------ NERDtree auto open w/ no args --------

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp() 
