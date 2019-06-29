VimMic is well-documented vim configuration along with a set of plugins for the
Vim text editor. It stand for Vim Make It Clever and is aimed to keep this
editor light and efficient.

__CHANGELOG__
--------------

* Automatically `build/compile_commands.json` is found
* No more `.vimmic_config`

__Key Features__
----------------

This configuration is not intrusive and should not confict with Vim default use.

By default, leader is defined on coma.
* Mnemonic shortcuts with gui (press leader three times to see them)
* Clever completion (Ctrl-Space to trigger/navigate) and Syntax checking (asynchronous)
* Fast travel (file/buffers/tags...) and new operator/scopes
* Fully customizable
* Lazy / Conditionally load plugins
* ...

__Install__
-----------

Note we highly recommend to backup your previous `.vimrc` if not already done
as we are going to erase it through the installation process.

### Dependencies

We highly recommend having a Vim build supporting Python. To check if Python
is supported, run: `vim --version | grep python` and see if `+python[...]` is
present.

Dependencies listed here are recommended but not required for all plugins:

* [flake8][flake8] is used by the plugin for Python
  [flake8-vim][plugin-flake8]. Install it through [pip][pip]:
  `pip install --user flake8`.
* [ctags][ctags] installed for better completion / code search support.
  Consider using [Universal Ctags][uni-ctags] which is more up-to-date.

### Install and update

Quick installation script:

```bash
VIMMIC_DIR=".vimmic"
cd ~
git clone https://github.com/CharlesGueunet/vimmic.git "${VIMMIC_DIR}"
ln -sf "${VIMMIC_DIR}"/.vimrc .
```

Notice you can use whatever you want in `$VIMMIC_DIR` (including inside `.config`),
as long as you do not modify the directory path afterward (as it may break the
symbolic link).

To update this distribution, you can simply `git pull`.
To update all plugins, use the command `:Update`

### Windows

For windows, clone this repository wherever you want. As symlink are not managed
in a Unix-like way, juste create a *_vimrc* file in your home containing the following:

```vim
let $MYVIMRC='Path to the .vimrc file in vimmic'
source $MYVIMRC
```

### Neovim

For those who would like to try with [neovim][neovim], use the following
snippet to link your vim configuration with your neovim configuration,
change the `$VIMMIC_DIR` accordingly:

```bash
VIMMIC_DIR="~/.vimmic"
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ${VIMMIC_DIR} $XDG_CONFIG_HOME/nvim
# ln -sf ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
# not required in this conf
```

Note: you may need to run `:Update` afterward if you have already installed the plugins
with Vim.

__How to use__
--------------

* The default Leader Key is `,` (you can change it easily).
* You can press `;` instead of `:`
* If you want persistant undo (survive vim restart) create a
  `.undodir/` folder in the Vimmic installation folder.
* If you want to display saved session at Vim startup, save them in
  `.sessions/` folder in the Vimmic installation folder using `:mksession`.
* You can see the Vimmic keymap with a gui by pressing 3 times leader.

You may need to restart Vim for your changes to the configuration to apply.

Please read the Vimmic's help ( `:help vimmic` ) as it is well documented
and provide many tips and tricks!

### Enabling / disabling plugins

As described in the *vimmic-config* help, if you want to add / remove
plugins, you can use the `${VIMMIC_DIR}/custom.toml` or `${VIMMIC_DIR}/disable.toml`
files (simple syntax) to manage the list of plugins.

Do not forget to restart your Vim afterward,
the editor will ask you to call `:Update` if needed.

__Structure__
--------------

All plugins are configured in their own files in `config/plugins/`.
Other files do not affect them (the *.vimrc* load them)

    ${VIMMIC_DIR}/         # Vimmic install directory
      .vimrc               # Loads Vimmic environment, configuration and plugins
      default.toml         # Default plugins list
      default_ft.toml      # Plugins loaded only on specific file types
      config/
        editor.vim         # Behaviour config (files, buffers, search...)
        shortcuts.vim      # Defines some shortcuts on the original vim functionalities
        functions.vim      # Some cool functions to update all plugins, fold, debug...
        plugins/*          # per-plugin related configuration. Files should use the following sections:
                           #   Settings: Plugin related settings and variable
                           #   Shortcuts: Mapping for this plugin
                           #   Theme: Colors configuration for this plugin

For personnal configuration, you can ceate two files:

* `${VIMMIC_DIR}/.vimrc.preconf`: tweak vimmic by changing the leader key, colors,
  disabling part of the configuration...
* `${VIMMIC_DIR}/.vimrc.postconf`: override plugins configuration / themes, add
  your own features...

Examples of those files in the `extra/` folder and the help *vimmic-config* gives some details.

__Gallery__
-----------

![Vimmic default config](http://charles.gueunet.fr/doc/vim/Vimmic_low_colors.png)
Default configuration on a low color terminal. On the left we see the NerdTree pane to navigate in the
project. The *Install* word is highlighted by the search.

![Vimmic quantum](http://charles.gueunet.fr/doc/vim/Vimmic_quantum.png)
The configuration using true-colors colorscheme as explained in the sample
*.vimrc.preconf* and *.vimrc.postconf* of the `extra/` folder. Here, we see on the
left the Nerd Tree with the project files, the Undo Tree with the historic of
the current file modifications and on the right the Tag bar with the current
function highlighted. Moreover, Git information are shown on the left of the
text.

![Vimmic Visual Shortcuts](http://charles.gueunet.fr/doc/vim/Vimmic_shortcuts.png)
To learn Vimmic, the help pages are your firends, but you can also use the
Visual Shortcut panel. (Summon by pressin three times `{leader}`)

![Vimmic code](http://charles.gueunet.fr/doc/vim/Vimmic_completion.png)
For code development, the left window shows an error (`v` is not printable) reported on the editor
line 15. The right window shows the clever completion (Ctrl-x x or Ctrl-space).


__Inspiration__
----------------

This configuration have started by a look at
[spf13](https://github.com/spf13/spf13-vim), another vim distribution.
spf13 is great but heavy so I decided to make my own configuration much lighter.

Another great distribution is [SpaceVim](https://github.com/SpaceVim/SpaceVim), but here
again this configuration is really complexe and most of the configuration should be made using
their own defined functions.

For the navigation and some highlight, we used
[this post](http://nvie.com/posts/how-i-boosted-my-vim/)

Lots of idea where taken from the
[jetbrains ide](https://www.jetbrains.com/) which is among the best ones.

For those who want to use space as the leader key,
[this website](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
can be usefull.

For later, build tools and shortcut might come from [this conf](https://github.com/xmementoit/vim-ide.git).

Another great website about vim plugins is [vimawesome](http://vimawesome.com/).

Some tricks about buffer and viml evaluation come from
[this dotfile](https://github.com/thirtythreeforty/dotfiles/blob/cb464b7ef00534aa06247e67f4e55c701022571f/vim/config/mappings.vim#L20-31).

__Plugins__
-----------

Plugins and configurations included by default (lots of them are lazily/conditionally loaded):

['Shougo/dein.vim'](https://github.com/Shougo/dein.vim)
['scrooloose/nerdtree'](https://github.com/scrooloose/nerdtree)
['liuchengxu/vista.vim'](https://github.com/liuchengxu/vista.vim)
['kshenoy/vim-signature'](https://github.com/kshenoy/vim-signature)
['mbbill/undotree'](https://github.com/mbbill/undotree)
['mhinz/vim-startify'](https://github.com/mhinz/vim-startify)
['myusuf3/numbers.vim'](https://github.com/myusuf3/numbers.vim)
['junegunn/vim-peekaboo'](https://github.com/junegunn/vim-peekaboo)
['CharlesGueunet/quickmenu.vim'](https://github.com/CharlesGueunet/quickmenu.vim)
['tpope/vim-dispatch'](https://github.com/tpope/vim-dispatch)
['andymass/vim-tradewinds'](https://github.com/andymass/vim-tradewinds)
['t9md/vim-choosewin'](https://github.com/t9md/vim-choosewin)
['simeji/winresizer'](https://github.com/simeji/winresizer)
['airblade/vim-gitgutter'](https://github.com/airblade/vim-gitgutter)
['zivyangll/git-blame.vim'](https://github.com/zivyangll/git-blame.vim)
['tpope/vim-fugitive'](https://github.com/tpope/vim-fugitive)
['rhysd/committia.vim'](https://github.com/rhysd/committia.vim)
['machakann/vim-highlightedyank'](https://github.com/machakann/vim-highlightedyank)
['inkarkat/vim-mark'](https://github.com/inkarkat/vim-mark)
['luochen1990/rainbow'](https://github.com/luochen1990/rainbow)
['Raimondi/delimitMate'](https://github.com/Raimondi/delimitMate)
['kana/vim-textobj-user'](https://github.com/kana/vim-textobj-user)
['sgur/vim-textobj-parameter'](https://github.com/sgur/vim-textobj-parameter)
['glts/vim-textobj-comment'](https://github.com/glts/vim-textobj-comment)
['kana/vim-textobj-indent'](https://github.com/kana/vim-textobj-indent)
['kana/vim-textobj-entire'](https://github.com/kana/vim-textobj-entire)
['tpope/vim-commentary'](https://github.com/tpope/vim-commentary)
['tpope/vim-surround'](https://github.com/tpope/vim-surround)
['andymass/vim-matchup'](https://github.com/andymass/vim-matchup)
['ctrlpvim/ctrlp.vim'](https://github.com/ctrlpvim/ctrlp.vim)
['Lokaltog/vim-easymotion'](https://github.com/Lokaltog/vim-easymotion)
['markonm/traces.vim'](https://github.com/markonm/traces.vim)
['google/vim-searchindex'](https://github.com/google/vim-searchindex)
['eugen0329/vim-esearch'](https://github.com/eugen0329/vim-esearch)
['tommcdo/vim-lion'](https://github.com/tommcdo/vim-lion)
['AndrewRadev/switch.vim'](https://github.com/AndrewRadev/switch.vim)
['joereynolds/place.vim'](https://github.com/joereynolds/place.vim)
['vim-scripts/YankRing.vim'](https://github.com/vim-scripts/YankRing.vim)
['tommcdo/vim-exchange'](https://github.com/tommcdo/vim-exchange)
['neoclide/coc.nvim'](https://github.com/neoclide/coc.nvim)
['w0rp/ale'](https://github.com/w0rp/ale)
['tpope/vim-repeat'](https://github.com/tpope/vim-repeat)
['SirVer/ultisnips'](https://github.com/SirVer/ultisnips)
['honza/vim-snippets'](https://github.com/honza/vim-snippets)
['inkarkat/vim-ingo-library'](https://github.com/inkarkat/vim-ingo-library)
['ilyachur/cmake4vim'](https://github.com/ilyachur/cmake4vim)
['octol/vim-cpp-enhanced-highlight'](https://github.com/octol/vim-cpp-enhanced-highlight)
['neoclide/coc-python'](https://github.com/neoclide/coc-python)
['fatih/vim-go'](https://github.com/fatih/vim-go)
['prettier/vim-prettier'](https://github.com/prettier/vim-prettier)
['sukima/xmledit'](https://github.com/sukima/xmledit)
['lervag/vimtex'](https://github.com/lervag/vimtex)
['neoclide/coc-vimtex'](https://github.com/neoclide/coc-vimtex)
['plasticboy/vim-markdown'](https://github.com/plasticboy/vim-markdown)
['cespare/vim-toml'](https://github.com/cespare/vim-toml)
['richq/vim-cmake-completion'](https://github.com/richq/vim-cmake-completion)
['nickhutchinson/vim-cmake-syntax'](https://github.com/nickhutchinson/vim-cmake-syntax)


__Copyright__
-------------

This git is maintained by **Charles Gueunet** \<charles.gueunet+vimmic@gmail.com\>

Copyright (C) 2016 Charles Gueunet
All rights reserved.

Redistribution and use in source and binary forms are permitted
provided that the above copyright notice and this paragraph are
duplicated in all such forms and that any documentation,
advertising materials, and other materials related to such
distribution and use acknowledge that the software was developed
by Charles Gueunet. The name of Charles Gueunet
may not be used to endorse or promote products derived
from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED ''AS IS'' AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

