local ok, actions = pcall(require, "telescope.actions")
if not ok then
    print "Could not require telescope actions. Check the config"
    return
end

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "bin/", "obj/", "%.o", "%.out", "node_modules/", ".git/", "target/"
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-s>"] = actions.file_split,
                ["<C-v>"] = actions.file_vsplit,
            },
            n = {
                ["<C-s>"] = actions.file_split,
            }
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
        }
    },
    extensions = {}
})

require("telescope").load_extension("fzf")



local M = {}

local no_preview = function()
    return require("telescope.themes").get_dropdown({
        borderchars = {
                      { "─",  "│", "─", "│", "┌", "┐", "┘", "└"},
            prompt  = { "─",  "│", " ", "│", "┌", "┐", "│", "│"},
            results = { "─",  "│", "─", "│", "├", "┤", "┘", "└"},
            preview = { "─",  "│", "─", "│", "┌", "┐", "┘", "└"},
        },
        width = 0.8,
        previewer = false,
        prompt_title = false
    })
end

M.find_in_file = function()
    return require("telescope.builtin").current_buffer_fuzzy_find(no_preview())
end

M.find_files = function()
    return require("telescope.builtin").find_files(no_preview())
end


vim.keymap.set("n", "<C-q>",
    "<cmd>lua require('setup.plugins.telescope').find_files()<Enter>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<Enter>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<Enter>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<Enter>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<Enter>")
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<Enter>")
vim.keymap.set("n", "<C-f>",
    "<cmd>lua require('setup.plugins.telescope').find_in_file()<Enter>")

return M
