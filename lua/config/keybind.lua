vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "j", "k", { noremap = true })
vim.keymap.set("n", "k", "j", { noremap = true })
vim.keymap.set("v", "j", "k", { noremap = true })
vim.keymap.set("v", "k", "j", { noremap = true })
vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true })
