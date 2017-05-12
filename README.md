# ![dotvim](http://upload.wikimedia.org/wikipedia/commons/4/4f/Icon-Vim.svg)

This repository is the content of my **.vim** directory. Basically I'm only playing with existing plugins. I just add them as submodule and configure them in my **.vimrc** file.
You can already do everything with Vim. Plugins can add new mapings to learn. You should first ask if you can do an action without the plugin you're about to install.

## Play with the Vim plugins

### Installation

1. **Clone the repository :**
  ```Bash
  git clone git://github.com/jgueytat/dotvim.git ~/.vim
  ```

2. **Clone the submodules to get the plugins :**

  ```Bash
  cd ~/.vim &&
  git submodule init &&
  git submodule update
  ```

3. **Create symlinks :**

  ```Bash
  ln -s ~/.vim/vimrc ~/.vimrc
  ```

### Enable / disable a plugin

Don't forget to replace **{{PLUGIN_NAME}}**!!!

```Bash
export PLUGIN_NAME={{PLUGIN_NAME}}
```
  
#### Enable a plugin

**Create the link in the directory plugins-enabled :**

```Bash
cd ~/.vim/plugins-enabled
ln -s ../plugins-available/${PLUGIN_NAME} .
```

#### Disable a plugin

**Remove the link in the directory plugins-enabled :**

```Bash
rm ~/.vim/plugins-enabled/${PLUGIN_NAME}
```


### Update

1. **Update your repository :**

  ```Bash
  cd ~/.vim &&
  git pull origin master
  ```

2. **Update all plugins :**

  ```Bash
  git submodule foreach git pull origin master
  ```

### Add/ remove  a plugin

#### Add a plugin

1. **Set the GIT_URL_REPOSITORY and PLUGIN_NAME variables :**

  Don't forget to replace **{{GIT_URL_REPOSITORY}}** and **{{PLUGIN_NAME}}**!!!

  ```Bash
  export GIT_URL_REPOSITORY={{GIT_URL_REPOSITORY}} &&
  export PLUGIN_NAME={{PLUGIN_NAME}}
  ```
2. **Add the plugin as a submodule :**

  ```Bash
  cd ~/.vim
  git submodule add ${GIT_URL_REPOSITORY} plugins-available/${PLUGIN_NAME}
  git commit -m "The plugin ${PLUGIN_NAME} has been added."
  ```

### Remove a plugin

1. **Set the PLUGIN_NAME variable :**

  Don't forget to replace **{{PLUGIN_NAME}}**!!!

  ```Bash
  export PLUGIN_NAME={{PLUGIN_NAME}}
  ```
  
2. **Remove the plugin from Git :**

  ```Bash
  cd ~/.vim &&
  mv .git/config .git/config-old; cat .git/config-old | grep -v ${PLUGIN_NAME} > .git/config; rm .git/config-old &&
  mv .gitmodules .gitmodules-old; cat .gitmodules-old | grep -v ${PLUGIN_NAME} > .gitmodules; rm .gitmodules-old &&
  git add .gitmodules &&
  git rm --cached plugins-available/${PLUGIN_NAME} &&
  git rm plugins-enabled/${PLUGIN_NAME} &&
  git commit -m "The plugin ${PLUGIN_NAME} has been removed."
  ```

3. **Remove the plugin from the file system :**

  ```Bash
  rm -rf ~/.vim/plugins-available/${PLUGIN_NAME}
  ```

## Learn more about Vim

* **vimtutor :** Go through this tutorial. This is the only place to begin with Vim.

* **:help cmd :** In Vim type **:help cmd** to know more about the "cmd" command.

    + [motion.txt](http://vimdoc.sourceforge.net/htmldoc/motion.html "Vim documentation: motion") : Learn to move fast.

        - [text-obect](http://vimdoc.sourceforge.net/htmldoc/motion.html#text-objects): use to specify text selection
        - [m](http://vimdoc.sourceforge.net/htmldoc/motion.html#mark): to mark a point in a file

    + [repeat.txt](http://vimdoc.sourceforge.net/htmldoc/repeat.html "Vim documentation: repeat") : Do not repeat yourself.

        - [q](http://vimdoc.sourceforge.net/htmldoc/repeat.html#complex-repeat): to register macros

    + [visual.txt](http://vimdoc.sourceforge.net/htmldoc/visual.html "Vim documentation: visual") : Useful visual commands to register macro.

        - [visual-operators](http://vimdoc.sourceforge.net/htmldoc/visual.html#visual-operators) : operators available in Visual mode


* **Useful Links :**

    + [Vimcasts.org](http://vimcasts.org/): A few short screencasts to love Vim!
    + [VimGolf](http://vimgolf.com/): "Real Vim ninjas count every keystroke - do you?" Learn Vim by playing!
    + [Official documentation](http://vimdoc.sourceforge.net/htmldoc/): This should be the equivalent of :help

* **Plugins to try out :**

    + https://github.com/Valloric/YouCompleteMe
    + https://github.com/vim-syntastic/syntastic

