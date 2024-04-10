read https://github.com/neovim/neovim/blob/master/INSTALL.md#linux
install neovim

After cloning this repos with  
`git clone git@github.com:TR0N-ZEN/nvim_config.git ~/.config/nvim`
to `~/.config` so you have `~/.config/nvim`

read https://github.com/wbthomason/packer.nvim
which at the moment stated to execute:
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

open `~/.config/nvim/lua/ego/packer.lua` with `nvim`  
press colon (`:`) type `so` and hit enter

close nvim and open it up again

press colon, type `PackerSync`, hit enter

now everything should be set up

Mason might have problems because some installations require packages such as

+ python3.10-venv
+ npm
