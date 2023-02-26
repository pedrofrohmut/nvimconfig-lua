local map = vim.keymap.set

map("n", "f", "<Plug>Sneak_f", { silent = true })
map("n", "F", "<Plug>Sneak_F", { silent = true })
map("n", "t", "<Plug>Sneak_t", { silent = true })
map("n", "T", "<Plug>Sneak_T", { silent = true })

map("n", "s", "H0<Plug>SneakLabel_s")
