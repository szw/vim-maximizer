vim-maximizer
=============

Maximizes and restores the current window in Vim.


Installation
------------

Place in *~/.vim/plugin/maximizer.vim* or in case of Pathogen:

    cd ~/.vim/bundle
    git clone https://github.com/szw/vim-maximizer.git


About
-----

Maximizer lets you maximize split windows and restore them automatically. It is very useful if you
like to have many split windows per tab. And also, if the text you are working with does not
[_...subscribe to the ridiculous Church of 80-character
Lines..._](http://37signals.com/svn/posts/3250-clarity-over-brevity-in-variable-and-method-names).
It means, while working with Ruby on Rails code. ;) Or just with lengthy HTML files.

Usage
-----

Maximizer has only one command:

    :MaximizerToggle

It is meant to be mapped in many ways by the user himself. See [Configuration](#configuration) to
get some examples.

When the current window is not in maximized state, Vim-Maximizer saves dimensions and positions of
all windows in the current tab, and then it performs maximization of the active window. The second
time the command is invoked, Maximizer restores all windows to the previously saved positions.

<div id="configuration"></div>
Configuration
-------------

Maximizer is extremely handy with command mappings. The mappings can be defined for normal, insert,
and visual modes. Here is the example of the `<F3>` key usage. You can paste it directly into your
.vimrc file.

    nnoremap <silent><F3> :MaximizerToggle<CR>
    vnoremap <silent><F3> :MaximizerToggle<CR>gv
    inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

With these mappings you can hit `<F3>` any time, not only in normal mode. Other handy situations may
include typing some text while you don't fit the current split window or selecting some long lines
in the visual mode. Just try it yourself.

Maximizer respects minimal allowed window size, both vertically and horizontally. By default the
minimal window height and width are set to 1.  You can change those values by tweaking
`'winminheight'` (`'wmh'`) and `'winminwidth'` (`'wmw'`) settings in your .vimrc.


Author and License
------------------

Maximizer was written by Szymon Wrozynski and
[Contributors](https://github.com/szw/vim-maximizer/commits/master). It is licensed under the same
terms as Vim itself.

Copyright &copy; 2012 Szymon Wrozynski. See `:help license`
