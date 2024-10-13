local fzf = require('fzf-lua')

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf Files" })

vim.keymap.set("n", "<leader>b", fzf.buffers)

-- Git 
vim.keymap.set("n", "<leader>gg", fzf.git_files)
vim.keymap.set("n", "<leader>gb", fzf.git_branches)
vim.keymap.set("n", "<leader>gs", fzf.git_status)

-- Search
vim.keymap.set("n", "<leader>fs", fzf.grep_visual)
vim.keymap.set("n", "<leader>s", fzf.grep_curbuf)
