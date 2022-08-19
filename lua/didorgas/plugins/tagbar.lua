local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<C-f>", "<cmd>TagbarOpenAutoClose<Enter>", opts)
map("n", "<C-b>", "<cmd>TagbarToggle<Enter>", opts)

map("n", "<C-p>", "<cmd>TagbarJumpPrev<Enter>", opts)
map("n", "<C-n>", "<cmd>TagbarJumpNext<Enter>", opts)
