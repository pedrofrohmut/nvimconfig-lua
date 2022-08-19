-- VIM OPTIONS   :help options
local options = {
    -- Indentation and tabing
    autoindent = true,
    smartindent = true,
    expandtab = true,
    shiftwidth = 4,
    softtabstop = 4,
    tabstop = 4,

    -- Searching
    incsearch = true,
    hlsearch = false,

    -- Appearance
    signcolumn = "yes:1",
    colorcolumn = "81,101",
    cmdheight = 1,
    termguicolors = true,
    wrap = false,
    showmode = false,
    number = true,
    relativenumber = true,
    wildmenu = true,

    -- Behavior
    splitright = true,
    splitbelow = true,
    sidescrolloff = 8,
    cursorline = true,
    mouse = "a",
    updatetime = 250,

    -- Files
    fileformat = "unix",
    backup = false,
    writebackup = false,

    -- CMP
    completeopt = "menu,menuone,noselect"
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

-- Remove auto insert comments next line
vim.cmd [[ autocmd FileType * setlocal formatoptions-=cro ]]
vim.cmd [[ set path=$PWD/** ]]
