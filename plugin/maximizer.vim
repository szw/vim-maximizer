" vim-maximizer - Maximizes and restores the current window
" Maintainer:   Szymon Wrozynski
" Version:      1.0.1
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

if exists('g:loaded_vim_maximizer') || &cp || v:version < 700
    finish
endif

let g:loaded_vim_maximizer = 1

command! -nargs=0 -range MaximizerToggle :call s:maximizer_toggle()

fun! s:others_minimized()
    for w in range(1, winnr('$'))
        if w != winnr() && winheight(w) > &winminheight && winwidth(w) > &winminwidth
            return 0
        endif
    endfor
    return 1
endfun
fun! s:maximizer_toggle()
    if exists('t:maximizer_sizes') && s:others_minimized()
        silent! exe t:maximizer_sizes
        if t:maximizer_sizes != winrestcmd()
            wincmd =
        endif
        unlet t:maximizer_sizes
    elseif winnr('$') > 1
        let t:maximizer_sizes = winrestcmd()
        vert resize | resize
    endif
    normal! ze
endfun
