local options = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "f", "<Plug>Sneak_f", options)
map("n", "F", "<Plug>Sneak_F", options)
map("n", "t", "<Plug>Sneak_t", options)
map("n", "T", "<Plug>Sneak_T", options)

map("n", "s", "H0<Plug>SneakLabel_s", { noremap = true })
map("n", "S", "H0<Plug>SneakLabel_s", { noremap = true })
