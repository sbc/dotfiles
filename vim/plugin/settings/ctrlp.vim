"------------------------------------------------------------
" CtrlP
"------------------------------------------------------------
" Set the max files
let g:ctrlp_max_files = 10000

" Optimize file searching
if has("unix")
    let g:ctrlp_user_command = {
                \   'types': {
                \       1: ['.git/', 'cd %s && git ls-files']
                \   },
                \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
                \ }
endif

nnoremap <silent><D-t> :CtrlP<CR>
let g:ctrlp_map = '<D-t>'
"let g:ctrlp_custom_ignore = '\.git/*\|\.hg/*\|\.svn/*\|tmp/*\|public/assets/*\|*\.png\|*\.gif\|*\.jpg'
let g:ctrlp_use_caching = 0
let g:ctrlp_mruf_exclude = 'tmp/.*\|temp/.*\|.*swp' " MacOSX/Linux
let g:ctrlp_dotfiles = 0

