function ColorMyPencils(color)
    color = color or "catppuccin-macchiato"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
        end
    },

    {
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
                require("catppuccin").setup({
                    flavour = "macchiato", -- latte, frappe, macchiato, mocha
                    background = { -- :h background
                        light = "latte",
                        dark = "mocha",
                    },
                    transparent_background = true, -- disables setting the background color.
                    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
                    dim_inactive = {
                        enabled = false, -- dims the background color of inactive window
                        shade = "dark",
                        percentage = 0.15, -- percentage of the shade to apply to the inactive window
                    },
                    no_italic = false, -- Force no italic
                    no_bold = false, -- Force no bold
                    no_underline = false, -- Force no underline
                    styles = {     -- Handles the styles of general hi groups (see `:h highlight-args`):
                        comments = { "italic" }, -- Change the style of comments
                        conditionals = { "italic" },
                        loops = {},
                        functions = {},
                        keywords = {},
                        strings = {},
                        variables = {},
                        numbers = {},
                        booleans = {},
                        properties = {},
                        types = {},
                        operators = {},
                    },
                    color_overrides = {},
                    custom_highlights = {},
                    integrations = {
                        cmp = true,
                        gitsigns = true,
                        nvimtree = true,
                        telescope = true,
                        notify = false,
                        mini = false,
                        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                    },
                })
                vim.cmd("colorscheme catppuccin-macchiato")
                ColorMyPencils()
            end
        }
    },


}
