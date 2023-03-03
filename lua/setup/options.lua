--[[
    VIM OPTIONS   :help options
]]
local options = {
    -- Indentation and tabing
    expandtab   = true,
    shiftwidth  = 4,
    softtabstop = 4,
    tabstop     = 4,

    -- Searching
    incsearch = true,
    hlsearch  = false,

    -- Appearance
    signcolumn     = "yes:1",
    colorcolumn    = { "81", "101" },
    cmdheight      = 1,
    termguicolors  = true,
    showmode       = false,
    number         = true,
    relativenumber = true,
    wildmenu       = true,

    -- Behavior
    splitright    = true,
    splitbelow    = true,
    sidescrolloff = 8,
    --scrolloff     = 8, --Breaks Sneak 'S'
    cursorline    = true,
    mouse         = "a",
    updatetime    = 250,
    wrap          = false,

    -- Files
    fileformat  = "unix",
    backup      = false,
    writebackup = false,
    autoread    = true,

    -- CMP
    completeopt = { "menu", "menuone", "noselect" }
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd [[ set path=$PWD/** ]]
