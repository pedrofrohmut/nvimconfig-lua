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
    map("n", "gh", vim.lsp.buf.implementation, bufopts)
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

-- local path_to_csharp_ls = vim.fn.expand("~/.dotnet/tools/csharp-ls")
-- lsp["csharp_ls"].setup(coq.lsp_ensure_capabilities({
--     cmd = { path_to_csharp_ls },
--     on_attach = on_attach,
-- }))

local omnisharp_path = vim.fn.expand("~/software/omnisharp/OmniSharp")
lsp["omnisharp"].setup(coq.lsp_ensure_capabilities({
    cmd = { omnisharp_path },
    on_attach = on_attach,
}))

local elixir_ls_path = vim.fn.expand("~/software/elixir-ls/language_server.sh")
lsp["elixirls"].setup(coq.lsp_ensure_capabilities({
    cmd = { elixir_ls_path },
    on_attach = on_attach,
}))

local clangd_path = vim.fn.expand("~/software/clangd_14.0.3/bin/clangd")
lsp["clangd"].setup {
    cmd = { clangd_path },
    on_attach = on_attach,
}

local sumneko_path = vim.fn.expand("~/software/lua-language-server/bin/lua-language-server")
lsp["sumneko_lua"].setup {
    cmd = { sumneko_path },
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" }
            }
        }
    }
}
