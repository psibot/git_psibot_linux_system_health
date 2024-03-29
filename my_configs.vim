set nocompatible              " be iMproved, required
filetype off                  " required
" ls -l /usr/share/vim/vim80/colors
colorscheme torte
set paste
set ruler

" basic settings for yaml and python files
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab number autoindent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab autoindent

" folding can help troubleshoot indentation syntax
set foldenable
set foldlevelstart=20
set foldmethod=indent
nnoremap <space> za
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'chiel92/vim-autoformat'
Plugin 'dag/vim-fish'
Plugin 'chase/vim-ansible-yaml'
Plugin 'sjl/gundo.vim'
Plugin 'junegunn/fzf'
Plugin 'thinca/vim-quickrun'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'shougo/unite.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'stephpy/vim-yaml'
Plugin 'Einenlum/yaml-revealer'
Plugin 'Yggdroot/indentLine'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'dense-analysis/ale'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
