# ![dotvim](http://upload.wikimedia.org/wikipedia/commons/4/4f/Icon-Vim.svg)

This repository is the content of my **.vim** directory. Basically I'm only playing with existing plugins. I just add them as submodule and configure them in my **.vimrc** file.

## Play with the Vim plugins

### Installation

**Clone the repository:**

```Bash
git clone git://github.com/jgueytat/dotvim.git ~/.vim
```

**Get the plugins:**

```Bash
cd ~/.vim  
git submodule init  
git submodule update  
```

**Create symlinks:**

```Bash
ln -s ~/.vim/vimrc ~/.vimrc
```

### Update

**Update your repository:**

```Bash
cd ~/.vim  
git pull origin master
```

**Update all plugins:**

```Bash
git submodule foreach git pull origin master
```

### Add a plugin

```Bash
cd ~/.vim  
git submodule add GIT_URL_REPOSITORY plugins-available/PLUGIN_NAME
```

### Remove a plugin

**From FileSystem:**

```Bash
rm -rf ~/.vim/plugins-available/PLUGIN_NAME  
rm -f ~/.vim/plugins-enabled/PLUGIN_NAME
```
**From Git:**

```Bash
cd ~/.vim  
git rm plugins-available/PLUGIN_NAME  
mv .gitmodules .gitmodules-old; cat .gitmodules-old | grep -v Conque-Shell > .gitmodules; rm .gitmodules-old
```

### Enable a plugin

**Create the link in plugins-enabled:**

```Bash
cd ~/.vim/plugins-enabled
ln -sf ../plugins-available/PLUGIN_NAME .
```

### Disable a plugin

> rm ~/.vim/plugins-enabled/PLUGIN_NAME

## Learn more about Vim

### vimtutor

Go through this tutorial. This is the only place to begin with Vim.

### :help cmd

In Vim type **:help cmd** to know more about the "cmd" command.

[motion.txt](http://vimdoc.sourceforge.net/htmldoc/motion.html "Vim documentation: motion")

- [text-obect](http://vimdoc.sourceforge.net/htmldoc/motion.html#text-objects): use to specify text selection
- [m](http://vimdoc.sourceforge.net/htmldoc/motion.html#mark): to mark a point in a file

[repeat.txt](http://vimdoc.sourceforge.net/htmldoc/repeat.html "Vim documentation: repeat")

- [q](http://vimdoc.sourceforge.net/htmldoc/repeat.html#complex-repeat): to register macros

[visual.txt](http://vimdoc.sourceforge.net/htmldoc/visual.html "Vim documentation: visual")

- [visual-operators](http://vimdoc.sourceforge.net/htmldoc/visual.html#visual-operators) : operators available in Visual mode


### Useful Links

- [Vimcasts.org](http://vimcasts.org/ "A few short videos to love Vim!")
- [VimGolf](http://vimgolf.com/ "Real Vim ninjas count every keystroke - do you?")
- [Official documentation](http://vimdoc.sourceforge.net/htmldoc/ "This should be the equivalent of :help")
