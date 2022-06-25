set tabstop=4 softtabstop=4 " sets <Tab> to 4 spaces instead of default 8
set number " shows line numbers
set shiftwidth=4
set expandtab
set smartindent
set scrolloff=8	" window centers on cursor after 8 lines

" vim-plug section to specify VIM plug-ins.
" I've installed junegunn's Plug! package manager, which is different than
"   vim's official plugin install method.
" Read Plug!'s Github README for instructions on adding a plugin.
"   Summary:
"   - Add "Plug 'tpope/vim-surround'" from github URL https://github.com/tpope/vim-surround
"   - Reload this file and run :PlugInstall to install 
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
call plug#end()

syntax on
colorscheme desert

" mapleader is a common key used in many VIM plugins and stuff. This sets it to space.
let mapleader = " "
" maps ' pv' to the command ':Vex', which opens a vertical window for file explorer
" 'pv' stands for 'project view'
noremap <leader>pv :Vex<CR> 
" maps ' <Enter>' to reload .vimrc from any file so it reflects any changes to .vimrc
noremap <leader><CR> :so ~/.vimrc<CR>
" Shortcut to quit VIM
noremap <leader>q :q<CR>
" Shortcut to save file 
noremap <leader>w :w<CR>

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

