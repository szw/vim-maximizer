" vim-maximizer - Maximizes and restores the current window
" Maintainer:   Szymon Wrozynski
" Version:      1.0.0
"
" Installation:
" Place in ~/.vim/plugin/maximizer.vim or in case of Pathogen:
"
"     cd ~/.vim/bundle
"     git clone https://github.com/szw/vim-maximizer.git
"
" License:
" Copyright (c) 2012 Szymon Wrozynski. Distributed under the same terms as Vim itself.
" See :help license
"
" Usage:
" https://github.com/szw/vim-maximizer/blob/master/README.md
"

if exists("g:loaded_vim_maximizer") || &cp || v:version < 700
    finish
endif

let g:loaded_vim_maximizer = 1

command! -nargs=0 MaximizerToggle :call s:maximizer_toggle()
nnoremap <C-w>o :MaximizerToggle<CR>
nnoremap <C-w><C-o> :MaximizerToggle<CR>

let s:maximizer_sizes = {}
let s:maximizer_tabs_count = 0

fun! s:maximizer_toggle()
    let current_tab = tabpagenr()
    let current_window = tabpagewinnr(current_tab)
    if exists("t:maximizer_tab_id") && has_key(s:maximizer_sizes, t:maximizer_tab_id)
        let current_sizes = remove(s:maximizer_sizes, t:maximizer_tab_id)
        for win_nr in keys(current_sizes)
            silent! exe win_nr . "wincmd w"
            silent! exe current_sizes[win_nr]
        endfor
        silent! exe current_window . "wincmd w"
    else
        let current_sizes = {}
        for win_nr in range(tabpagewinnr(current_tab, '$'))
            silent! exe win_nr . "wincmd w"
            let current_sizes[win_nr] = winrestcmd()
        endfor
        if len(current_sizes) == 1
            echo "This window is maximized already!"
        else
            let t:maximizer_tab_id = "maximizer_tab_" . s:maximizer_tabs_count
            let s:maximizer_tabs_count += 1
            let s:maximizer_sizes[t:maximizer_tab_id] = current_sizes
            silent! exe current_window . "wincmd w"
            silent! exe "wincmd |"
            silent! exe "wincmd _"
        endif
    endif
endfun
