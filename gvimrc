set guioptions-=T                " hide the GVim/MacVim toolbar
set guioptions-=r                " hide the scrollbar

"" Appearance ----------------------------------------------------------------

set lines=48 columns=100         " default window height.

set guifont=Menlo:h14 " font and size
set linespace=0                  " line heights

autocmd VimResized * wincmd =    " automatically resize splits when
                                 " resizing MacVim window

" Highlight lines longer than 78 characters.
highlight OverLength ctermbg=red ctermfg=white guibg=grey
autocmd BufNewFile,BufReadPost * match OverLength /\%79v.\+/

"" Mappings ------------------------------------------------------------------

if has("gui_macvim")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Command-T OS-X Menu remapping.
  macmenu &File.New\ Tab key=<nop>

  " Command-T quick toggle
  nmap <D-t> :CommandT<CR>

  " NERDTree quick toggle button
  nmap <D-e> :NERDTreeToggle<CR>

  " Let MacVim open in full screen (http://amix.dk/blog/post/19403)
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i
endif

"" Settings --------------------------------------------------------------

let g:CommandTMaxHeight=10
