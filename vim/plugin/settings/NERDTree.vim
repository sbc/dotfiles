
"" NERDTree
if has("gui_macvim") && has("gui_running")
  :map <D-\> :NERDTreeToggle<CR>
  :imap <D-\> <Esc>:NERDTreeToggle<CR>i
else
  :map <leader>\ :NERDTreeToggle<CR>
  :imap <leader>\ <Esc>:NERDTreeToggle<CR>i
endif

" Auto open nerd tree on startup
"let g:nerdtree_tabs_open_on_gui_startup = 1
" Focus in the main content window
"let g:nerdtree_tabs_focus_on_files = 1

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

autocmd VimEnter * wincmd w
