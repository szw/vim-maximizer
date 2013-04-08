" vim-maximizer - Maximizes and restores the current window
" Maintainer:   Szymon Wrozynski
" Version:      1.0.4
"
" Installation:
" Place in ~/.vim/plugin/maximizer.vim or in case of Pathogen:
"
"     cd ~/.vim/bundle
"     git clone https://github.com/szw/vim-maximizer.git
"
" License:
" Copyright (c) 2012-2013 Szymon Wrozynski and Contributors.
" Distributed under the same terms as Vim itself.
" See :help license
"
" Usage:
" See :help maximizer
" https://github.com/szw/vim-maximizer/blob/master/README.md

if exists('g:loaded_vim_maximizer') || &cp || v:version < 700
    finish
endif

let g:loaded_vim_maximizer = 1

if !exists('g:maximizer_set_default_mapping')
    let g:maximizer_set_default_mapping = 1
endif

if !exists('g:maximizer_set_mapping_with_bang')
    let g:maximizer_set_mapping_with_bang = 0
endif

if !exists('g:maximizer_default_mapping_key')
    let g:maximizer_default_mapping_key = '<F3>'
endif

command! -bang -nargs=0 -range MaximizerToggle :call s:maximizer_toggle(<bang>0)

if g:maximizer_set_default_mapping
    let command = ':MaximizerToggle'

    if g:maximizer_set_mapping_with_bang
        let command .= '!'
    endif

    silent! exe 'nnoremap <silent>' . g:maximizer_default_mapping_key . ' ' . command . '<CR>'
    silent! exe 'vnoremap <silent>' . g:maximizer_default_mapping_key . ' ' . command . '<CR>gv'
    silent! exe 'inoremap <silent>' . g:maximizer_default_mapping_key . ' <C-o>' . command . '<CR>'
endif

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
