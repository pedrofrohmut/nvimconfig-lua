local options = { noremap = true, silent = true }
local term_options = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- File Explorer
keymap("n", "<leader>ff", ":find ", { noremap = true })
keymap("n", "<leader>fe", ":Ex<CR>", options)
keymap("n", "<leader>fs", ":Lex 20<cr>", options)

-- Closer del
keymap("i", "<C-l>", "<Del>", options)

-- Insert lines in Normal Mode
keymap("n", "<CR>", "i<CR><Esc>", options)
keymap("n", "<C-j>", "o<Esc>k", options)
keymap("n", "<C-k>", "O<Esc>j", options)

-- Scrolling (Needed on Windows/WSL)
keymap("n", "<A-j>", "<C-e>", options)
keymap("n", "<A-k>", "<C-y>", options)

-- Move Text
keymap("v", "<C-j>", ":move '>+1<CR>gv-gv", options)
keymap("v", "<C-k>", ":move '<-2<CR>gv-gv", options)

-- Easy Register Copy/Cut to x
keymap("v", "<A-y>", "\"xy", options)
keymap("v", "<A-d>", "\"xd", options)
keymap("n", "<A-p>", "\"xp", options)

-- Function Utils
keymap("n", "<F4>", ":bufdo bd", { noremap = true }) -- Buffer Delete to all buffers / Reset
keymap("n", "<F11>", ":%s/\\s\\+$//g<CR>", { noremap = true }) -- Remove trailing spaces
keymap("n", "<F12>", ":source ~/.config/nvim/init.lua<CR>", { noremap = true }) -- Resource config

-- Closing character on Enter
keymap("i", "(<CR>", "(<CR>)<Esc>ko", options)
keymap("i", "[<CR>", "[<CR>]<Esc>ko", options)
keymap("i", "{<CR>", "{<CR>}<Esc>ko", options)
keymap("i", "({<CR>", "({<CR>})<Esc>ko", options)
keymap("i", "`<CR>",  "<CR>`<Esc>ko<Tab>", options)
keymap("i", "(`<CR>", "(``)<Esc>hi<CR><Esc>ko<Tab>", options)

-- ### Buffers #################################################################

-- Next
keymap("n", "<leader>bn", ":bnext<CR>", options)
keymap("n", "<leader>bl", ":bnext<CR>", options)
keymap("n", "<C-n>",      ":bnext<CR>", options)

-- Previous
keymap("n", "<leader>bp", ":bprevious<CR>", options)
keymap("n", "<leader>bh", ":bprevious<CR>", options)
keymap("n", "<C-p>",      ":bprevious<CR>", options)

-- Utils
keymap("n", "<leader>bb", ":buffers<CR>", options)
keymap("n", "<leader>bx", ":buffers<CR>:b", { noremap = true })
keymap("n", "<leader>bd", ":bdelete<CR>", options)
keymap("n", "<leader>ba", ":bufdo bd", { noremap = true })

-- ### Tabs ####################################################################

-- New Tab
keymap("n", "<leader>tc", ":tabnew<CR>", options)

-- Close Tabs
keymap("n", "<leader>tq", ":tabclose<CR>", options)
keymap("n", "<leader>to", ":tabonly<CR>", options)

-- Move Tabs - Left/Right
keymap("n", "<leader>th", ":-tabmove<CR>", options)
keymap("n", "<leader>tl", ":+tabmove<CR>", options)

-- Go To - Next/Prev
keymap("n", "<leader>tn", ":tabnext<CR>", options)
keymap("n", "<C-L>", ":tabnext<CR>", options)
keymap("n", "<leader>tp", ":tabprevious<CR>", options)
keymap("n", "<C-H>", ":tabprevious<CR>", options)

-- ### Windows #################################################################

-- Resize Horizontal
keymap("n", "<Up>", ":resize +5<CR>", options)
keymap("n", "<Down>", ":resize -5<CR>", options)

-- Resize Vertical
keymap("n", "<Left>", ":vertical resize -5<CR>", options)
keymap("n", "<Right>", ":vertical resize +5<CR>", options)
