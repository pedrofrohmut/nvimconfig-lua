-- VIM OPTIONS   :help options
local options = {
    -- Indentation and tabing
    autoindent = true,
    smartindent = true,
    expandtab = true,
    shiftwidth = 2,
    softtabstop = 2,
    tabstop = 2,
    
    -- Searching
    incsearch = true,
    hlsearch = false,

    -- Appearance
    signcolumn = "yes:1",
    colorcolumn = "81,121",
    cmdheight = 1,
    termguicolors = true,
    wrap = false,
    showmode = false,
    number = true,
    relativenumber = true,
    
    -- Behavior
    splitright = true,
    splitbelow = true,
    scrolloff = 8,
    sidescrolloff = 8,
    cursorline = true,
    mouse = nv,

    -- Files
    fileformat = "unix",
    
    -- Coc May remove
    updatetime = 500,
    backup = false,
    writebackup = false,
    hidden = true
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

-- Remove auto insert comments next line
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]
