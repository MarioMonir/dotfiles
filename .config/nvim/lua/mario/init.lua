require("mario.packer")
require("mario.remap")

-- Wrap
vim.wo.wrap = false
vim.wo.linebreak = false
vim.wo.list = false

-- Identation, Spaces and Tabs
vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting

-- Disable Swap
vim.opt.swapfile = false
