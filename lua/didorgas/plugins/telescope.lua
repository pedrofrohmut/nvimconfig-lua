vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<Enter>", {})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<Enter>", {})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<Enter>", {})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<Enter>", {})

require('telescope').setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                --["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }

        -- You dont need to set any of these options. These are the default ones. Only
        -- the loading is important
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }    -- please take a look at the readme of the extension you want to configure
    }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
