Tags
====

**System tags**

You may have one **system-$(hostname).tags** file per operating system you use. 
Note that those files are huge. They have to be ignored.

If the file ~/.vim/tags/system-$(hostname).tags doesn't exist please generate one if you want to use system tags.

*You can use the following command:*

> ctags -R -f ~/.vim/tags/system-$(hostname).tags /usr/include /usr/local/include

This command may take a while.

**Library tags**

 - **Qt.tags:** Qt library
 - **cpp.tags:** STL library
