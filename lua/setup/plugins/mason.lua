require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",        -- C/C++
        "elixirls",      -- Elixir
        "omnisharp",     -- CSharp
        "pyright",       -- Python
        "rust_analyzer", -- Rust
        "lua_ls",        -- Lua
        "tsserver",      -- Typescript/Javascript
    }
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
