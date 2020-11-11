fun! maximizer#maximize()
    let t:maximizer_sizes = { 'before': winrestcmd() }
    vert resize | resize
    let t:maximizer_sizes.after = winrestcmd()
    normal! ze
endfun

fun! maximizer#restore()
    if exists('t:maximizer_sizes')
        silent! exe t:maximizer_sizes.before
        if t:maximizer_sizes.before != winrestcmd()
            wincmd =
        endif
        unlet t:maximizer_sizes
        normal! ze
    end
endfun

fun! maximizer#toggle(force)
    if exists('t:maximizer_sizes') && (a:force || (t:maximizer_sizes.after == winrestcmd()))
        call maximizer#restore()
    elseif winnr('$') > 1
        call maximizer#maximize()
    endif
endfun
