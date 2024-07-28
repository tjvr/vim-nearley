# vim-nearley

Vim syntax highlighting for [nearley](https://github.com/kach/nearley).

The syntax determines whether to use Typescript or Javascript depending on, if it finds `^@preprocessor typescript`.

## Install

Using [vim-plug](https://github.com/junegunn/vim-plug) in vimscript
```vim
Plug 'tjvr/vim-nearley'
```

Using [vim-pathogen](https://github.com/tpope/vim-pathogen)

- Clone `tjvr/vim-nearley` into `.vim/bundle/`.

Using [lazy.nvim](https://github.com/folke/lazy.nvim) in lua
```lua
"tjvr/vim-nearley",
```

Using [packer](https://github.com/wbthomason/packer.nvim) in lua
```lua
use { "tjvr/vim-nearley" }
```

