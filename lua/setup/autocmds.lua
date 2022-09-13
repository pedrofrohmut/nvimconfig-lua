local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove auto insert comments next line
autocmd("FileType", { pattern = "*", command = "setlocal formatoptions-=cro" })

-- Only show the cursor line in the active buffer.
augroup("CursorLine", { clear = true })
-- CursorLine Begin
autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
    group = "CursorLine", pattern = "*", command = "setlocal cursorline" })
autocmd("WinLeave", {
    group = "CursorLine", pattern = "*", command = "setlocal nocursorline" })
-- CursorLine End