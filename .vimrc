" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set showmatch
set mat=5
set cursorline


set switchbuf=useopen
set winwidth=80

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Appearance ====================
"turn on syntax highlighting
set t_Co=256
syntax on
syntax enable

if has("gui_running")
  set background=dark
  "colorscheme monokai
  "colorscheme solarized
  colorscheme gruvbox
  set guioptions-=r
  set guioptions-=L
  set guioptions-=T
  set lines=60
  set columns=190
  "set guifont=Inconsolata\ XL:h15,Inconsolata:h18,Monaco:h15
else
  let g:rehash256 = 1
  "set automatically from .zshrc
  let base16colorspace=256
  colorscheme base16-default
  "colorscheme base16-greenscreen
endif

" Always have a status line
set laststatus=2

" Status line format - replace 0's with colors
set statusline=
set statusline+=%0*\[%n]                                  "buffernr
set statusline+=%0*\ %<%F\                                "File+path
set statusline+=%0*\ %y\                                  "FileType
set statusline+=%0*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%0*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%0*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%0*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%0*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%0*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
    if &hls
      return 'H'
    else
      return ''
    endif
endfunction
" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=spec/fixtures/cassettes**

set runtimepath^=~/.vim/Bundle/ctrlp.vim
let g:ctrlp_map = ',t' "noconflict with yankring
"nnoremap <silent> ,t :CtrlPMixed<CR>
nnoremap <silent> ,y :CtrlPBufTag<CR>
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Better % behavior
runtime macros/matchit.vim

" ================ Vundler ========================================
"#Set up Vundle https://github.com/gmarik/vundle to manage plugins
"loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
" =================================================================

"if filereadable(expand("~/.vim/vundles.vim"))
"  source ~/.vim/vundles.vim
"endif
set nocompatible              " be iMproved, required
filetype off "must be off before vundle, then turned on?

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'KevinGoodsell/vim-csexact'

Plugin 'tpope/vim-fugitive'
"Bundle 'airblade/vim-gitgutter'
Bundle 'thoughtbot/vim-rspec'
Bundle 'kien/ctrlp.vim'
Bundle 'thoughtbot/pick.vim'
Bundle 'jgdavey/tslime.vim'
Bundle 'jgdavey/vim-turbux'
let g:turbux_command_rspec = "rspec"
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-surround'
Bundle 'gmarik/hlmatch.vim'

Bundle 'yankring.vim'
Bundle 'majutsushi/tagbar'
Bundle 'ervandew/supertab'
Bundle 'andrewradev/splitjoin.vim'
Bundle 'stefandtw/quickfix-reflector.vim'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'itspriddle/vim-jquery'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'tomtom/tcomment_vim'

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'
Bundle 'godlygeek/tabular'

Bundle 'scrooloose/nerdtree.git'
Bundle 'terryma/vim-multiple-cursors'


"close vim if its the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:nerdtreetype") && b:nerdtreetype == "primary") | q | endif

" all of your plugins must be added before the following line
call vundle#end()            " required

"set clipboard=unnamed

" =================================================
" some important custom keymappings
" =================================================
" old vim rspec setup
"let g:rspec_command = "Dispatch rspec {spec}"
"let g:rspec_runner = "os_x_iterm"
"map <leader>sf :call RunCurrentSpecFile()<cr>
"map <leader>s :call RunNearestSpec()<cr>
"map <leader>l :call RunLastSpec()<cr>
"map <leader>a :call RunAllSpecs()<cr>
"

let mapleader=","
imap jk <esc>
imap kj <esc>

"let SelectaIgnore = [".git/", "bin", "./spec/fixtures/cassettes", "./chef"]

let g:ctrlp_map = ',,t'
"nnoremap <silent> ,,t :CtrlPMixed<CR>
"" Open a file
 ""nnoremap <leader>t :SelectaFile<cr>

"" As above, but will open in a :vsplit
 "nnoremap <leader>v :SelectaVsplit<cr>

"" Find all buffers that have been opened.
"" Fuzzy select one of those. Open the selected file with :b.
"nnoremap <leader>b :SelectaBuffer<cr>
""
"" " Find previously run commands.
"" " Fuzzy select one of those. Run that command with :
"nnoremap <leader>h :SelectaHistoryCommand<cr>

nnoremap <Leader>t :call PickFile()<CR>
nnoremap <Leader>s :call PickFileSplit()<CR>
nnoremap <Leader>v :call PickFileVerticalSplit()<CR>
"nnoremap <Leader>t :call PickFileTab()<CR>
nnoremap <Leader>b :call PickBuffer()<CR>


map <leader><esc> :noh<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>m :NERDTreeFind<CR>
map <leader>g :!ctags -R .<CR>
"map <leader>b :CtrlPBuffer<cr>
map <leader>a :Tabularize /
"" fix indentation for whole file
map <leader>i mzgg=G`z
"map <leader>ah :Tabularize /:\zs/r1c0l0<cr>
nmap sj :splitjoinsplit<cr>
nmap sk :splitjoinjoin<cr>
nmap <f8> :TagbarToggle<cr>
nnoremap <silent> K :Ag <cword><CR>
" nnoremap <leader>c :TComment
nnoremap <leader>src :source ~/.vimrc<cr>

"gitgrep - open up a git grep line, with a quote started for the search
nnoremap ,gg :GitGrep ""<left>
nnoremap ,ga :Ag ""<left>
""GitGrep Current Partial
nnoremap ,gcp :GitGrepCurrentPartial<CR>
"GitGrep Current File
nnoremap ,gcf :call GitGrep(expand("%:t:r"))<CR>

let g:no_turbux_mappings = 1
map <leader>r <Plug>SendTestToTmux
map <leader>s <Plug>SendFocusedTestToTmux

command! Q q " Bind :Q to :q
command! W w
command! Wq wq
command! Qall qall

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

" ,) or ,( Surround a word with (parens)
"  The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

map ,c "+y

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" EASIER SPLIT NAVIGATION CTRL+J instead of CTRL+W J
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

 " ,' Surround a word with 'single quotes'
map ,' ysiw'

" MORE NATURAL SPILT CREATION
set splitbelow
set splitright

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden = 1
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

if has("autocmd")
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" ================ Rename Current File ========================================
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>nm :call RenameFile()<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  if len(filenames) > 0
    exec "edit " . filenames[0]
    for filename in filenames[1:]
      exec "sp " . filename
    endfor
  end
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

nnoremap ,ocf :OpenChangedFiles<CR>

" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,f <C-]>

" Jump to tag with awareness of ruby bang! methods (in vertical split)
nnoremap <silent> ,,F :vsp<cr> :wincmd w<cr> :call JumpToRubyMethod()<CR>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
" ================ Go to file stuff ========================================

" Automatically jump to a file at the correct line number
" i.e. if your cursor is over /some/path.rb:50 then using 'gf' on it will take
" you to that line

" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf   :vertical botright wincmd F<CR>
nnoremap <silent> <C-F> :vertical botright wincmd F<CR>

" ================ White spaze Killahz========================================
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

" ================ Switch between test and prod code ========================================
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<policies\>') != -1 || match(current_file, '\<presenters\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader><Space> :call OpenTestAlternate()<cr>

au BufRead,BufNewFile *.hamlc set ft=haml
