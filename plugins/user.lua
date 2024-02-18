return {
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "User AstroFile",
        config = function()
            require("treesitter-context").setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = "-",
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end,
    },

    -- ==========================================================

    -- barbar (tabline)
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "lewis6991/gitsigns.nvim",
        },
        opts = {
            -- configurations go here
            animation = true,
            insert_at_start = false,
            icons = {
                -- Configure the base icons on the bufferline.
                -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
                buffer_index = false,
                buffer_number = false,
                button = "",
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
                    [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
                    [vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
                    [vim.diagnostic.severity.HINT] = { enabled = true },
                },
                gitsigns = {
                    added = { enabled = true, icon = "+" },
                    changed = { enabled = true, icon = "~" },
                    deleted = { enabled = true, icon = "-" },
                },
                filetype = {
                    -- Sets the icon's highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = false,

                    -- Requires `nvim-web-devicons` if `true`
                    enabled = true,
                },
                -- separator = { left = "▎", right = "" },

                -- If true, add an additional separator at the end of the buffer list
                -- separator_at_end = true,

                -- Configure the icons on the bufferline when modified or pinned.
                -- Supports all the base icon options.
                modified = { button = "◉" },
                pinned = { button = "", filename = true },

                -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
                -- preset = "powerline",

                -- Configure the icons on the bufferline based on the visibility of a buffer.
                -- Supports all the base icon options, plus `modified` and `pinned`.
                alternate = { filetype = { enabled = false } },
                current = { buffer_index = true },
                inactive = { button = "×" },
                visible = { modified = { buffer_number = false } },
            },
        },
        event = "VeryLazy",
    }, -- End of 'barbar.nvim'

    -- ==========================================================

    -- Scrollview
    {
        "dstein64/nvim-scrollview",
        config = function() end,
        event = "User AstroFile",
    }, -- End of 'nvim-scrollview'

    -- ==========================================================

    -- Code Runner
    {
        "CRAG666/code_runner.nvim",
        opts = {
            mode = "toggleterm",
            focus = true,
            startinsert = true,
        },
        event = "User AstroFile",
    }, -- End of 'code_runner.nvim'

    -- ==========================================================

    -- Numb (line numbers)
    {
        "nacro90/numb.nvim",
        opts = {},
        event = "User AstroFile",
    }, -- End of 'numb.nvim'

    -- ==========================================================

    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function() require("rainbow-delimiters.setup").setup {} end,
        event = "User AstroFile",
    },

    -- ==========================================================
    -- ==========================================================

    { -- searchbox
        "VonHeikemen/searchbox.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            -- Configuration goes here (leave empty to use default settings)
        },
        event = "User AstroFile",
    }, -- End of 'searchbox.nvim'

    -- ==========================================================

    { -- actions-preview
        "aznhe21/actions-preview.nvim",
        opts = {
            telescope = {
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    width = 0.8,
                    height = 0.9,
                    prompt_position = "top",
                    preview_cutoff = 20,
                    preview_height = function(_, _, max_lines) return max_lines - 15 end,
                },
            },
        },
        event = "User AstroFile",
    }, -- End of 'actions-preview.nvim'

    -- ==========================================================

    { -- copilot cmp
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup {
                event = { "InsertEnter", "LspAttach" },
                fix_pairs = true,
            }
        end,
        event = "User AstroFile",
    },

    -- ==========================================================

    { -- incline nvim
        "b0o/incline.nvim",
        config = function()
            local helpers = require "incline.helpers"
            require("incline").setup {
                window = {
                    padding = 0,
                    margin = { horizontal = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    local buffer = {
                        ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
                            or "",
                        " ",
                        { filename, gui = modified and "bold,italic" or "bold" },
                        " ",
                        guibg = "#44406e",
                    }
                    return buffer
                end,
            }
        end,
        -- Optional: Lazy load Incline
        event = "VeryLazy",
    },

    -- ==========================================================

    {
        "patrickpichler/hovercraft.nvim",

        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },

        opts = function()
            return {
                -- providers = {
                --     providers = {
                --         {
                --             "LSP",
                --             require("hovercraft.provider.lsp").new(),
                --         },
                --         {
                --             "Man",
                --             require("hovercraft.provider.man").new(),
                --         },
                --         {
                --             "Dictionary",
                --             require("hovercraft.provider.dictionary").new(),
                --         },
                --         {
                --             "Github Issue",
                --             require("hovercraft.provider.github.issue").new(),
                --         },
                --         {
                --             "Github Repo",
                --             require("hovercraft.provider.github.repo").new { fetch_readme = true }, -- You can set fetch_readme to false if you don't want to fetch the README
                --         },
                --         {
                --             "Github User",
                --             require("hovercraft.provider.github.user").new(),
                --         },
                --         {
                --             "Git Blame",
                --             require("hovercraft.provider.git_blame").new { show_commit_message = true }, -- Set show_commit_message to false if you don't want to display the commit message
                --         },
                --     },
                -- },

                window = {
                    border = "rounded",
                },

                keys = {
                    { "<C-u>", function() require("hovercraft").scroll { delta = -4 } end },
                    { "<C-d>", function() require("hovercraft").scroll { delta = 4 } end },
                    { "<TAB>", function() require("hovercraft").hover_next() end },
                    { "<S-TAB>", function() require("hovercraft").hover_next { step = -1 } end },
                },
            }
        end,
    },

    -- ==========================================================

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
}
