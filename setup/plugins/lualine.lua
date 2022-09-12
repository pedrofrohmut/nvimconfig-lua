require("lualine").setup {
    options = {
        component_separators = { left = "|", right = "|"},
    },
    sections = {
        -- Left side a, b, c
        lualine_a = {},
        lualine_b = {
            {
                "filename",
                file_status = true,
                newfile_status = false,
                path = 1,
                shorting_target = 40,
                symbols = {
                    modified = "[+]",
                    readonly = "[-]",
                    unnamed = "[No Name]",
                    newfile = "[New]",
                }
            }
        },
        lualine_c = {},

        -- Right Side x, y, z
        lualine_x = {
            "filetype",
            {
                "fileformat",
                symbols = { unix = "UNIX", dos = "DOS", mac = "MAC" }
            },
            "encoding"
        },
        lualine_y = {"progress", "location"},
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                file_status = true,
                newfile_status = false,
                path = 1,
                shorting_target = 40,
                symbols = {
                    modified = "[+]",
                    readonly = "[-]",
                    unnamed = "[No Name]",
                    newfile = "[New]",
                }
            }
        },
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
}
