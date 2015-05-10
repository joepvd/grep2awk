grep2awk: A small zsh/zle helper
================================


While trying to find the needle in a haystack, you find yourself recklessly grepping some log files.  Suddenly, it occurs to you that there might be a pattern in the data, and ``awk`` will be the fastest way to figure out if this pattern has any relevance or not.  You want to change your ``grep`` into an ``awk`` oneliner. 

This involves some mechanical work: Arrow up to get to the command line, move to the word ``grep`` and change it, forward to the start of the regular expression and add ``'/``. Move to the end of the regular expression, and type: ``/ {}'``.  Not a big deal, but mechanical work, which does add up if you're doing this eight times a day. 

For this slight inconvenience, the tool ``grep2awk`` was written. It finds the first occurrence of the word ``grep`` in the current command line, and tries to convert the options and the regular expression into a skeleton for an ``awk``-script.  Just press a key you have chosen yourself, and you're already past the point of potential distraction which the mechanical work can entail. 

How to use:
-----------

Clone the repository someplace:

.. code:: sh

   git clone 'https://github.com/joepvd/grep2awk.git'

Then put the file ``grep2awk`` somewhere in your ``$fpath``.  Make sure the file gets ``autoload``-ed, making the script known as a line editor (``zle``) script, and assigning a key binding to it: 

.. code:: sh

   autoload -Uz grep2awk
   zle -N grep2awk
   bindkey "^X^A" grep2awk

Now, pressing ``<CTRL-X>``-``<CTRL-A>`` will bring you goodies! 


The following grep options are supported: 
-----------------------------------------

``-v``
    inverse match
``-w``
    word match
``-x``
    line match
``-l``
    list matching files
``-L``
    list not matching files
``-H``
    include filename in result
``-n``
    include line number in result
``-c``
    count occurrences per file
``-i``
    case insensitive matching
``-E``
    Extended Regular Expressions
``-F``
    Fixed string matching


Development
-----------

If you ``source`` the file ``init.zsh``, the development version of ``grep2awk`` will be made available under key binding ``<CTRL-P>``. Handy for quick testing.

There is a testing library in the ``t``-directory, in which the testing framework from the `ZSH`-project has been adjusted to work with the currently installed shell.  Please run and update the tests when playing with the code. 


Bugs
----

There are some bugs.  The conversion from Basic Regular Expressions (which bare ``grep`` uses) to Extended Regular Expressions (which ``egrep`` and ``awk`` use) has not been implemented. The treatment of backslashes in the conversion from Fixed String to Extended Regular Expression is not working.  Furthermore, the context options (``-A``, ``-B``, ``-C``) are not implemented, as well as ``-o`` (only-matching). Some fuky stuff with snooping aliases and the (deprecated) environment variable ``GREP_OPTIONS`` is as of yet not implemented. Also, colorized output is not supported. 

Please let me know whether you like it, and what could be better to support your needs! 
