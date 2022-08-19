vim.keymap.set("n", "<leader>ft", "<cmd>NERDTreeFind<Enter>", {})
vim.keymap.set("n", "<F8>", "<cmd>NERDTreeToggle<Enter>", {})

vim.cmd [[ let NERDTreeIgnore = [ 'node_modules', 'deps', 'obj', 'bin', 'target', '__pycache__', '.git', '.dist', '.next', 'dist' ] ]]

vim.cmd [[ let NERDTreeWinSize = 40 ]]
