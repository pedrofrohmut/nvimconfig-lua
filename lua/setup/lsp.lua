local map = vim.keymap.set

-- Mappings --------------------------------------------------------------------

map("n", "<F11>",      "<cmd>LspRestart<Enter><cmd>echo 'LSP Restarted'<Enter>")
map("n", "<F12>",      "<cmd>LspInfo<Enter>",     { silent = true })
map("n", "<C-p>",      vim.diagnostic.goto_prev,  { silent = true })
map("n", "<C-n>",      vim.diagnostic.goto_next,  { silent = true })
map("n", "<leader>do", vim.diagnostic.open_float, { silent = true })
map("n", "<leader>dl", vim.diagnostic.setloclist, { silent = true })
map("n", "<leader>dd", vim.diagnostic.disable,    { silent = true })
map("n", "<leader>de", vim.diagnostic.enable,     { silent = true })
map("n", "<leader>cf", vim.lsp.buf.format)

-- Config ----------------------------------------------------------------------

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { silent = true, buffer = bufnr }
    map("n", "gd", vim.lsp.buf.definition, bufopts)
    map("n", "gh", vim.lsp.buf.implementation, bufopts) -- gi is too awesome not replace
    map("n", "gt", vim.lsp.buf.type_definition, bufopts)
    map("n", "gr", vim.lsp.buf.references, bufopts)

    map("n", "K", vim.lsp.buf.hover, bufopts)

    map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)

    map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end

-- Completion ------------------------------------------------------------------
vim.g.coq_settings = { auto_start = "shut-up" }

-- Servers ---------------------------------------------------------------------

local lsp = require "lspconfig"
local coq = require "coq"

-- C/C++
lsp.clangd.setup(coq.lsp_ensure_capabilities({
    cmd = { "clangd" },
    on_attach = on_attach,
}))

-- Elixir
lsp.elixirls.setup(coq.lsp_ensure_capabilities({
    cmd = { "elixir-ls" },
    on_attach = on_attach,
}))

-- CSharp
lsp.omnisharp.setup(coq.lsp_ensure_capabilities({
    cmd = { "omnisharp" },
    on_attach = on_attach,
}))

-- Python
lsp.pyright.setup(coq.lsp_ensure_capabilities({
    cmd = { "pyright-langserver" },
    on_attach = on_attach,
}))

-- -- Rust
lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({
    cmd = { "rust-analyzer" },
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {},
    },
}))

-- -- Lua
lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
    cmd = { "lua-language-server" },
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" }
            }
        }
    },
}))

-- Typescript/Javascript
lsp.tsserver.setup(coq.lsp_ensure_capabilities({
    cmd = { "typescript-language-server" },
    on_attach = on_attach,
}))
