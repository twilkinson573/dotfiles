"" Vundle Setup
set nocompatible                " choose no compatibility with legacy vi
filetype off                    " required by Vindle
set shell=/bin/zsh

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Langauges
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-git'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'taq/vim-rspec'
Bundle 'vim-ruby/vim-ruby'
Bundle 'avakhov/vim-yaml'
" Bundle 'vim-scripts/VimClojure'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'

" Tools
" Bundle 'wincent/Command-T'
Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'sickill/vim-pasta'
Bundle 'rosenfeld/conque-term'
Bundle 'mbbill/undotree'

" Colours
Bundle 'wgibbs/vim-irblack'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'kien/rainbow_parentheses.vim'

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

let mapleader=","               " leader is , instead of \

set splitright                  " vsplits go to the right

set clipboard=unnamed           " use OS clipboard

"" Whitespace ----------------------------------------------------------------

set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching -----------------------------------------------------------------

set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital
                                " letter

"" Appearance ----------------------------------------------------------------

set ruler                       " line and column number.
set list                        " show invisble characters.
set background=dark
" colorscheme jellybeans
colorscheme base16-default

set cc=81                       " show right margin at 80 characters.

set number

" List chars
set listchars=""                " Reset the listchars
set listchars=tab:\ \           " a tab should display as "  "
set listchars+=trail:.          " show trailing spaces as dots
set listchars+=extends:>        " The character to show in the last column
                                " when wrap is off and the line continues
                                " beyond the right of the screen
set listchars+=precedes:<       " The character to show in the last column
                                " when wrap is off and the line continues
                                " beyond the right of the screen

" Always keep at least five lines visible when at the bottom of a file.
set scrolloff=5

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Yanking a block returns to the last cursor position, not the top.
:vmap y ygv<Esc>

" Remap EasyMotion.
let g:EasyMotion_leader_key = ';'

" Map GUndo
nnoremap <leader>u :UndotreeToggle<CR>

" Yanking a block returns to the last cursor position, not the top.
:vmap y ygv<Esc>

" Indent by four spaces in JS / Python.
au BufNewFile,BufReadPost *.{js,py} set sw=4 ts=4 et

" Discourage using cursor keys.
" map <Up> <nop>
" map <Down> <nop>
" map <Right> <nop>
" map <Left> <nop>
" imap <Up> <nop>
" imap <Down> <nop>
" imap <Left> <nop>
" imap <Right> <nop>

" No wrapping by default, thx.
au BufRead,BufNewFile * set nowrap

"" Ignores -------------------------------------------------------------------

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle/*,.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Additional ignores for Command-T lists.
set wildignore+=doc/**,documentation/**,public/doc/**
set wildignore+=webrat.log,coverage
set wildignore+=*.png,*.jpg,*.git,*.sassc,tmp/**

"" Backup and Swap -----------------------------------------------------------

set backupdir=~/.vim/_backup//  " where to put backup files.
set directory=~/.vim/_temp//    " where to put swap files.

if has("persistent_undo")
  set undodir=~/.vim/_temp//
  set undofile
endif

"" Status Line ---------------------------------------------------------------

set laststatus=2  " always show the status bar

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Start the status line.
set statusline=%f\ %m\ %r

" Add fugitive.
set statusline+=%{fugitive#statusline()}

" Finish the statusline
set statusline+=Line:%l/%L\ (%p%%)
set statusline+=\ Col:%v

if has("gui")
  let g:airline_powerline_fonts = 1
else
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
endif

let g:airline_theme = 'base16'
let g:airline#extensions#whitespace#show_message = 0

" Remove the LN symbol from the line info section.
let g:airline_section_z = '%3p%% %3l:%2c'

"" Useful Helpers ------------------------------------------------------------

" Toggle line numbers from absolute to relative with <leader>l.
map <silent> <leader>l :if &relativenumber == 1 <Bar>
    \set norelativenumber <Bar>
      \else <Bar>
    \set relativenumber <Bar>
      \endif<CR>

" Function which removes all trailing whitespace in the current buffer.
function! RemoveTrailingWhiteSpace()
  %s/\s\+$//
endfunction

" Leader, Shift-2 removes all trailing whitespace.
map <Leader>@ :call RemoveTrailingWhiteSpace()<CR>

" Fill rest of line with characters.
function! FillLine( str )
  " set tw to the desired total length
  let tw = &textwidth

  if tw==0 | let tw = 80 | endif

  " strip trailing spaces first
  .s/[[:space:]]*$//

  " calculate total number of 'str's to insert
  let reps = (tw - col("$")) / len(a:str)

  " insert them, if there's room, removing trailing spaces (though forcing
  " there to be one)
  if reps > 0
    .s/$/\=(' '.repeat(a:str, reps))/
  endif
endfunction

" Maps comment-line completion to <Leader>, Shift+3 on UK keyboards.
map <Leader># :call FillLine( '-' )<CR>
map <Leader>£ :call FillLine( '-' )<CR>

" Indent Clojure doc-strings.
let g:clojure_align_multiline_strings = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^lazy-']
