-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--vim.g.user_emmet_leader_key = "<Tab>"
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "go one line down", silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "go one line up", silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move one block down", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move one block up", silent = true })

--vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Nueva línea abajo (modo normal)" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Nueva línea arriba (modo normal)" })
--vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "last buffer" })
