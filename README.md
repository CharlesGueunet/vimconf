
This project is configuration for the Vim text editor.
It is aimed to keep vim light and efficient and should be
usable for anyone who know how to use this editor.
It should not confilct with your habits if you are fammiliar with Vim.

This project use pathogen to keep each plugin in a separate folder (bundle).
Plugins are include as submodules and so stay under responsibility of their creators.

Copyright (C) 2016 Charles Gueunet

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

INSTALL
-------

##*Once you have backed up your old .vim and .vimrc* :

```bash
  cd ~
  git clone --recursive https://github.com/CharlesGueunet/vimconf.git .vim
  ln -sf .vim/.vimrc .
```

If you have already cloned this repo without the --recursive you can use :

```bash
  git submodule update --init
```

To install ctags (or choose your distribution version if you can):
```bash
   cd ctags
   ./configure
   make
   sudo make install
```
by default ctags use zsh if it is installed (or bash otherwise)
change syntastic shell to your convenient if needed in the vimrc file.

For Python users, the [flake8-vim](https://github.com/andviro/flake8-vim)
plugin might require the [flake8](https://pypi.python.org/pypi/flake8) Python
package. To install it, you can use :

```bash
   pip install --user flake8
```


CONFIG
------

###Templates :

* [c.vim](https://github.com/vim-scripts/c.vim) :
    Edit the file bundle/c.vim/c-support/template/Templates with your informations

* snippets completion:
    Files are in bundle/vim-snippets/snippets
    Each file is on the form : extension.snippets

* doc:
    You can add the doc of the wanted plugins with :
```vim
  :helptags ~/.vim/bundle/PLUNGIN/doc
```

Where PLUGIN is the wanted plugin.

USE
---

 * We assume you know how to use vim
 * The leader key is ","

## Navigation

 *(try to use buffer navigation, cool with [nerdTree](https://github.com/vim-scripts/c.vim) ((Leader n))*

 * (Leader v) to vertical split
 * (Leader h) to horizontal split
 * (Leader left or right) to go to the dezired buffer
 * (Leader bottom) to list buffers
 * (Leader top) to change buffer
 * (Leader &lt; or &gt;) to go to desired windows
 * (CTRL+ w  arrow) to go to the dezired windows (split)
 * (Leader o) to maximize/unmaximizer current windows among splitted
 * (Leader b) open ctags menu, allow travel btw functions & variables

## Files navigation
 * (Leader n) open NerdTree : file navigator menu
 * (Leader f) open NerdTree on current location

## Words
 * Fast travel with (Leader Leader w)
 * cs'" to change 'test' in "test" ( **c**hange **s**urround
   using [vim-surround](https://github.com/tpope/vim-surround) )
 * in Visual selection : maj+S allow to put surround mark arround the selected block :
     maj+S  {  will sourround the block with {}
 * Interactively replace word under cursor using (Leader r)
 * Interactive substitute (%s) using (Leader s)

## Indent
  * (Leader ig) to have [indentation guides](https://github.com/nathanaelkane/vim-indent-guides)
  * C and C++ can be indented with (Ctrl d) (current line / selection)
    this indentation use [clang formatter](http://clang.llvm.org/docs/ClangFormat.html#vim-integration).
    to personalise put a ".clang-format" file in the project root (one is given in example in the git)
  * To align ([tabular](https://github.com/godlygeek/tabular)) text on a given char : :Tab/\<char\>
  * Shorcut exist for = and : with (Leader a= (or :a)).
  * You can fold your current scope ('{ ... }') by pressing (Leader -)

## Tips
 * (Leader p) show your current regiser, allowing you to retrieve old pasted lines ("0p for example)
 * you can add [bookmark](https://github.com/MattesGroeger/vim-bookmarks) to a line with "mm" and  navigate through bookmarks with mp and mn
 * Add text to your bookmark with "mi"
 * Using git, you can show a diff of the changes under cursor with (Leader hp)
 * (Leader u) show a pane with the undo-tree ( (maj D) on this pane to show diff with current)
 * mouse enabled, use maj when selecting text to allow ctrl-maj-c

## Completion
 * The completion use JetBrain style : Ctrl-Space.
 * You can use snippets with tab (example : inc<tab> -> #include <| >)
    reminder snippets are in bundle/vim-snippets/snippets
 * Bracket, char string... are auto-closed automatically
 * to insert c function with c.vim : \if, \im ... cf :h csupport

## Code tips
 * (Leader s) to deactivate / reactivate syntax verification on save ([Syntastic](https://github.com/scrooloose/syntastic))
 * (Leader c space) to comment
 * (Leader c u)     to uncomment
 * on command mode : maj K give you the doc of the function under cursor
 * (Leader b) to open [tagbar](https://github.com/majutsushi/tagbar) (containing class, functions, fields ...)
 * + and _ allows to select and expand / shrink the current [region](https://github.com/terryma/vim-expand-region)
 * XML autocomplete juste write the body and then tab : p TAB -> \<p\>\</p\>
     Custom tag autocomplete when created : \<toto\> -\> \<toto\>| \</toto\>

### [Syntastic](https://github.com/scrooloose/syntastic)
 * You can force a silent check with (Leader c) and make the error windows appear with (Leader e)
 * for syntastic to work properly in your project you may need to indicate some files to include or some flags for the compiler.
A sample file for C++ is include here : .syntastic\_cpp\_config.
This file should be next to the source file opened in vim.

INSPIRATION
-----------

This configuration have started by a look at
[spf13](https://github.com/spf13/spf13-vim), another vim distribution.
spf13 is great but heavy so I decided to make my own configuration much lighter.  
For the navigation and some highlight, I used advices of 
[this post](http://nvie.com/posts/how-i-boosted-my-vim/)  
Lots of idea where taken from the
[jetbrains ide](https://www.jetbrains.com/) wich are among the best ones.  
For those hwo want to use space as the leader key,
[this](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
website could be usefull.  
For later, build tools and shortcut might come from [this conf](https://github.com/xmementoit/vim-ide.git).  
Another great website about vim plugins is [vimawesome](http://vimawesome.com/).


CONTRIBUTE
----------

### Adding plugins
For consistency, plugins needs to be added as submodule: in bundle

 ```bash
  git submodule add [git-url]
 ```

GIT
---

This git is maintained by **Charles Gueunet** \<charles.gueunet+vimconf@gmail.com\>

