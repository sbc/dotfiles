
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

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
