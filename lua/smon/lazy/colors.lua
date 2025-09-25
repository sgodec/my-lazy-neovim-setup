vim.api.nvim_create_user_command("Tokyo", function()
    require("lazy").load({ plugins = { "tokyonight.nvim" } })
    vim.cmd("colorscheme tokyonight")
end, {})

vim.api.nvim_create_user_command("Rose", function()
    require("lazy").load({ plugins = { "rose-pine.nvim" } })
    vim.cmd("colorscheme rose-pine")
end, {})

vim.api.nvim_create_user_command("Dark", function()
    require("lazy").load({ plugins = { "onedark.nvim" } })
    vim.cmd("colorscheme onedark")
end, {})

vim.api.nvim_create_user_command("Cat", function()
    require("lazy").load({ plugins = { "catppuccin.nvim" } })
    vim.cmd("colorscheme catppuccin")
end, {})

return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = false, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        config = function()
            require('rose-pine').setup({
                variant = 'moon',
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },
            })

        end
    },

    {
        "navarasu/onedark.nvim",
        lazy = true,
        config = function()
            require("onedark").setup({
                style = "deep",  -- options: dark, deeper, cool, deep, warm, warmer, light
                transparent = false,
                term_colors = true,
            })
        end
    },
    
    { 
        "catppuccin/nvim", 
        name = "catppuccin",
        lazy = true,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                auto_integrations = true,
            })
        end
    },

}
