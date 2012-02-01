Installation
============

*Get a copy:*

> git clone git://github.com/jgueytat/dotvim.git ~/.vim

*Update plugins to their latest version:*

> cd ~/.vim
>
> git submodule init
>
> git submodule update

*Create symlinks:*

> mv ~/.vimrc ~/vimrc.original
>
> ln -s ~/.vim/vimrc ~/.vimrc

Update
======

> cd ~/.vim

*Update your copy:*

> git pull origin master

*Update all plugins:*

> git submodule update

Learn more
==========

### vimtutor

Go through this tutorial. This is the only place to begin with Vim.

### :help cmd

In Vim type **:help cmd** to know more about the "cmd" command.

[motion.txt](http://vimdoc.sourceforge.net/htmldoc/motion.html "Vim documentation: motion")

- [text-obect](http://vimdoc.sourceforge.net/htmldoc/motion.html#text-objects): use to specify text selection
- [m](http://vimdoc.sourceforge.net/htmldoc/motion.html#mark): to mark to point of a file

[repeat.txt](http://vimdoc.sourceforge.net/htmldoc/repeat.html "Vim documentation: repeat")

- [q](http://vimdoc.sourceforge.net/htmldoc/repeat.html#complex-repeat): to register macros

[visual.txt](http://vimdoc.sourceforge.net/htmldoc/visual.html "Vim documentation: visual")

- [visual-operators](http://vimdoc.sourceforge.net/htmldoc/visual.html#visual-operators) : operators available in Visual mode


### Useful Links

- [Vimcasts.org](http://vimcasts.org/ "A few short videos to love Vim!")
- [Official documentation](http://vimdoc.sourceforge.net/htmldoc/ "This should be the equivalent of :help")

