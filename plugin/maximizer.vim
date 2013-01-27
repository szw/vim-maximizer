" vim-maximizer - Maximizes and restores the current window
" Maintainer:   Szymon Wrozynski
" Version:      1.0.3
"
" Installation:
" Place in ~/.vim/plugin/maximizer.vim or in case of Pathogen:
"
"     cd ~/.vim/bundle
"     git clone https://github.com/szw/vim-maximizer.git
"
" License:
" Copyright (c) 2012 Szymon Wrozynski and Contributors.
" Distributed under the same terms as Vim itself.
" See :help license
"
" Usage:
" https://github.com/szw/vim-maximizer/blob/master/README.md
"

if exists('g:loaded_vim_maximizer') || &cp || v:version < 700
    finish
endif

let g:loaded_vim_maximizer = 1

command! -bang -nargs=0 -range MaximizerToggle :call s:maximizer_toggle(<bang>0)

fun! s:maximizer_toggle(force)
    if exists('t:maximizer_sizes') && (a:force || (t:maximizer_sizes.after == winrestcmd()))
        silent! exe t:maximizer_sizes.before
        if t:maximizer_sizes.before != winrestcmd()
            wincmd =
        endif
        unlet t:maximizer_sizes
    elseif winnr('$') > 1
        let t:maximizer_sizes = { 'before': winrestcmd() }
        vert resize | resize
        let t:maximizer_sizes.after = winrestcmd()
    endif
    normal! ze
endfun
