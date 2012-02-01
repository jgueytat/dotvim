### Installation

1. *Get a copy:*

> git clone git://github.com/jgueytat/dotvim.git ~/.vim

2. *Update plugins to their latest version:*

> cd ~/.vim
>
> git submodule init
>
> git submodule update

3. *Create symlinks:*

> mv ~/.vimrc ~/vimrc.original
>
> ln -s ~/.vim/vimrc ~/.vimrc

### Update

> cd ~/.vim
>
> git pull origin master
>
> git submodule update

### Help

*Use **:help cmd** to know more about the "cmd" command:*

- Motions

- [text-obect](http://vimdoc.sourceforge.net/htmldoc/motion.html#text-objects): use to specify text selection
- [m](http://vimdoc.sourceforge.net/htmldoc/motion.html#mark): to mark to point of a file

- Repeat

- [q](http://vimdoc.sourceforge.net/htmldoc/repeat.html#complex-repeat): to register macros

- Visual

- [visual-operators](http://vimdoc.sourceforge.net/htmldoc/visual.html#visual-operators) : ...

