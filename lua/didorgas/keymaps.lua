local options = { noremap = true, silent = true }

local term_options = { silent = true }

local keymap = vim.api.nvim_set_keymap

--keymap("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
--vim.g.maplocalleader = " "

keymap("n", "<leader>ff", ":Ex<CR>", options)
keymap("n", "<leader>e", ":Lex 20<cr>", options)

-- Closer del
keymap("i", "<C-L>", "<Del>", options)

-- Insert lines in Normal Mode
keymap("n", "<CR>", "i<CR><Esc>", options)
keymap("n", "<C-J>", "o<Esc>k", options)
keymap("n", "<C-K>", "O<Esc>j", options)
