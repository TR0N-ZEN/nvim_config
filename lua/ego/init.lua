print("loading ~/.config/nvim/lua/ego/init.lua")

-- show linenumber of line with cursor
-- and others with relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- no line wrapping
vim.opt.wrap = false

-- save tabs as vim.opt.tabstop many spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- visual block mode does not end block at line ending
vim.opt.virtualedit = "block"

-- the register named plus, which is the system register is used as clipboard
-- enables using copy paste from and to nvim
vim.opt.clipboard = "unnamedplus"

-- keep cursor in the middle
vim.opt.scrolloff = 999

-- behaviour if opening multiple windows in nvim
vim.opt.splitright = true
vim.opt.splitbelow = true

-- ignore command names capitalization
vim.opt.ignorecase = true

--vim.cmd.colorscheme('black')

-- terminal can use more colors
vim.opt.termguicolors = true

require("ego.remap") -- loads ~/.config/nvim/lua/ego/remap.lua
require("ego.packer") -- loads ~/.config/nvim/lua/ego/packer.lua

print("loaded ~/.config/nvim/lua/ego/init.lua")




