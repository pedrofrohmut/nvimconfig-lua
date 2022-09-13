vim.g.NERDTreeIgnore = { 
    'node_modules', 
    'deps', 
    'obj', 
    'bin', 
    'target', 
    '__pycache__', 
    '.git', 
    '.dist', 
    '.next', 
    'dist',
}

vim.g.NERDTreeWinSize     = 36

vim.g.NERDTreeHijackNetrw = 1

vim.g.NERDTreeShowHidden  = 1

vim.g.NERDTreeMinimalUI   = 1

vim.g.NERDTreeMinimalMenu = 1

vim.keymap.set("n", "<leader>ft", "<cmd>NERDTreeFind<Enter>")
vim.keymap.set("n", "<C-b>",      "<cmd>NERDTreeToggle<Enter>")
