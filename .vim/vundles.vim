filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" Experimental
Bundle 'rcyrus/snipmate-snippets-rubymotion'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Language specific
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'itspriddle/vim-jquery'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'

" Git
Bundle 'tpope/vim-fugitive'

" Search
Bundle 'tjennings/git-grep-vim'
Bundle 'mileszs/ack.vim'

" File stuff
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree.git'

" Utility
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-dispatch'
Bundle 'briandoll/change-inside-surroundings.vim.git'
Bundle 'kana/vim-arpeggio'
Bundle 'tomtom/tcomment_vim'
Bundle 'ervandew/supertab'
Bundle 'YankRing.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'godlygeek/tabular'

" Filetype plugin indent on is required by vundle
filetype plugin indent on
