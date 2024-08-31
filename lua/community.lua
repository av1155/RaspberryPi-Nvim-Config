-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- Color for the signature hint
vim.api.nvim_set_hl(0, "CustomHintScheme", { fg = "#907aa9", bold = true })

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    -- THEMES ==========================================================
    -- Import color schemes from the AstroNvim community repository
    { import = "astrocommunity.colorscheme.catppuccin" },

    -- PLUGINS ==========================================================
    -- User Interface Plugins
    { import = "astrocommunity.bars-and-lines.lualine-nvim" },
    { import = "astrocommunity.indent.indent-blankline-nvim" },
    { import = "astrocommunity.split-and-window.edgy-nvim" },
    { import = "astrocommunity.syntax.hlargs-nvim" },

    -- Code Assistance Plugins
    { import = "astrocommunity.completion.cmp-cmdline" },
    { import = "astrocommunity.completion.copilot-lua-cmp" },
    { import = "astrocommunity.editing-support.chatgpt-nvim" },
    { import = "astrocommunity.editing-support.hypersonic-nvim" },
    { import = "astrocommunity.editing-support.nvim-devdocs" },
    { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
    { import = "astrocommunity.editing-support.zen-mode-nvim" },
    { import = "astrocommunity.register.nvim-neoclip-lua" },

    -- File and Code Management Plugins
    { import = "astrocommunity.file-explorer.oil-nvim" },
    { import = "astrocommunity.git.octo-nvim" },
    { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
    -- { import = "astrocommunity.media.image-nvim" }, -- Breaks JDTLS... Only enable when working with non-java projects/files

    -- Utility and Tools Plugins
    { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },
    { import = "astrocommunity.media.codesnap-nvim" },
    { import = "astrocommunity.motion.harpoon" },
    { import = "astrocommunity.motion.nvim-surround" },
    { import = "astrocommunity.scrolling.mini-animate" },
    { import = "astrocommunity.scrolling.neoscroll-nvim" },
    { import = "astrocommunity.utility.noice-nvim" },

    --[[ ## Vim Surround Keymaps Documentation

        The three "core" operations of add/delete/change with the Vim Surround plugin can be done using the keymaps ys{motion}{char}, ds{char}, and cs{target}{replacement}, respectively.

        Here are some examples where * denotes the cursor position:

        | Old Text                  | Command       | New Text                  |
        |---------------------------|---------------|---------------------------|
        | surr*ound_words           | ysiw)         | (surround_words)          |
        | *make strings             | ys$"          | "make strings"            |
        | [delete ar*ound me!]      | ds]           | delete around me!         |
        | remove <b>HTML t*ags</b>  | dst           | remove HTML tags          |
        | 'change quot*es'          | cs'"          | "change quotes"           |
        | <b>or tag* types</b>      | csth1<CR>     | <h1>or tag types</h1>     |
        | delete(functi*on calls)   | dsf           | function calls            |

    --]]

    -- LSP AND DIAGNOSTICS =================================================
    { import = "astrocommunity.code-runner.compiler-nvim" },
    { import = "astrocommunity.code-runner.sniprun" },
    -- { import = "astrocommunity.diagnostics.error-lens-nvim" },
    { import = "astrocommunity.diagnostics.trouble-nvim" },
    { import = "astrocommunity.lsp.actions-preview-nvim" },
    -- { import = "astrocommunity.lsp.delimited-nvim" },
    { import = "astrocommunity.lsp.garbage-day-nvim" },
    { import = "astrocommunity.lsp.inc-rename-nvim" },
    -- { import = "astrocommunity.lsp.lsp-lens-nvim" },
    { import = "astrocommunity.lsp.lsp-signature-nvim" },
    { import = "astrocommunity.lsp.lsplinks-nvim" },
    -- { import = "astrocommunity.lsp.nvim-lint" },
    { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
    { import = "astrocommunity.lsp.ts-error-translator-nvim" },

    -- DEBUGGING ============================================================
    -- { import = "astrocommunity.debugging.nvim-bqf" },
    { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
    { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
    { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
    { import = "astrocommunity.debugging.telescope-dap-nvim" },

    -- LANGUAGES ============================================================
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.html-css" },
    { import = "astrocommunity.pack.java" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.tailwindcss" },
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.pack.yaml" },

    -- END =====================================================================

    -- =========================================================================
    --                                                                         =
    --                                                                         =
    --                                                                         =
    --                                                                         =
    --                    CUSTOMIZED COMMUNITY PLUGINS                         =
    --                                                                         =
    --                                                                         =
    --                                                                         =
    --                                                                         =
    -- =========================================================================

    -- =========================================================================
    { -- further customize the options set by the community
        "catppuccin",
        opts = {
            transparent_background = true,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = { "bold" },
                keywords = { "bold" },
                strings = {},
                variables = {},
                numbers = {},
                booleans = { "bold", "italic" },
                properties = {},
                types = { "italic" },
                operators = {},
            },
            integrations = {
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                barbar = true,
                sandwich = true,
                noice = true,
                mini = true,
                leap = true,
                markdown = true,
                neotest = true,
                cmp = true,
                overseer = true,
                lsp_trouble = true,
                rainbow_delimiters = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = true,
                harpoon = true,
                indent_blankline = { enabled = true },
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                illuminate = {
                    enabled = true,
                    -- lsp = true,
                },
                which_key = true,
            },
        },
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "hrsh7th/cmp-cmdline",
        event = "VeryLazy",
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "folke/zen-mode.nvim",
        opts = {
            window = {
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 0.8, -- 80% of the editor's width
                height = 1,  -- height of the Zen window
                options = {
                    signcolumn = "yes",
                },
            },
            plugins = {
                tmux = { enabled = true },
            },
        },
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "mistricky/codesnap.nvim",
        config = function()
            require("codesnap").setup {
                save_path = "~/Downloads/codesnap.png",
                mac_window_bar = true,
                title = "CodeSnap.nvim",
                code_font_family = "CaskaydiaCove Nerd Font",
                watermark_font_family = "Pacifico",
                -- watermark = "CodeSnap.nvim",
                watermark = "",
                bg_theme = "default",
                has_breadcrumbs = true,
                breadcrumbs_separator = "/",
            }
        end,
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "echasnovski/mini.animate",
        opts = {
            -- scroll = { enable = true },
            -- resize = { enable = true },
            -- open = { enable = true },
            close = { enable = false },
        },
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "karb94/neoscroll.nvim",
        event = "BufRead",
        config = function()
            require("neoscroll").setup {
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,             -- Function to run after the scrolling animation ends
                performance_mode = false,    -- Disable "Performance Mode" on all buffers.
            }
        end,
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "zbirenbaum/copilot.lua",
        opts = {
            panel = {
                enabled = false,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>",
                },
                layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4,
                },
            },
            suggestion = {
                enabled = false,
                auto_trigger = false,
                debounce = 75,
                keymap = {
                    accept = "<M-l>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                yaml = false,
                markdown = false,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },
            copilot_node_command = "node", -- Node.js version must be > 18.x
            server_opts_overrides = {},
        },
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "jackMort/ChatGPT.nvim",
        opts = {
            chat = {
                question_sign = "",
                answer_sign = "󰚩",
                sessions_window = {
                    active_sign = "  ",
                    inactive_sign = " 󰄱 ",
                    current_line_sign = "",
                },
            },
        },
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                opts = {
                    position = "50%", -- Center the cmdline vertically and horizontally
                },
            },
            lsp = {
                progress = { enabled = false },
                hover = { enabled = false },
                signature = { enabled = false },
            },
            routes = {
                { filter = { event = "msg_show", min_height = 20 },                                      view = "messages" },      -- send long messages to split
                { filter = { event = "msg_show", find = "%d+L,%s%d+B" },                                 view = "mini" },          -- save notification settings
                { filter = { event = "msg_show", find = "^%d+ more lines$" },                            opts = { skip = true } }, -- skip paste notifications
                { filter = { event = "msg_show", find = "^%d+ fewer lines$" },                           opts = { skip = true } }, -- skip delete notifications
                { filter = { event = "msg_show", find = "^%d+ lines yanked$" },                          opts = { skip = true } }, -- skip yank notifications
                { filter = { event = "notify", find = "Client with id %d+ not attached to buffer %d+" }, opts = { skip = true } }, -- skip buffer attach notifications
                {                                                                                                                  -- Add a filter to skip any classpath provider error message
                    filter = {
                        event = "msg_show",
                        find =
                        "Could not resolve classpath and modulepath for .+: Failed to resolve classpath: Referenced classpath provider does not exist: org%.eclipse%.m2e%.launchconfig%.classpathProvider",
                    },
                    opts = { skip = true },
                },
                { -- Add a filter to skip the Tree-sitter error message
                    filter = {
                        event = "msg_show",
                        find =
                        "There is no parser available for buffer %d+ and one could not be created because lang could not be determined. Either pass lang or set the buffer filetype",
                    },
                    opts = { skip = true },
                },
            },
        },
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "ray-x/lsp_signature.nvim",
        opts = {
            floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
            hint_enable = true,
            hint_prefix = "󰞗 ",
            hint_scheme = "CustomHintScheme",
            hint_inline = function() return false end,
            -- should the hint be inline(nvim 0.10 only)?  default false
            -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
            -- return 'right_align' to display hint right aligned in the current line
            close_timeout = nil, -- Disable automatic closing of the floating window
            fix_pos = true,      -- Keep the floating window open until all parameters are completed
        },
    },
    -- =========================================================================
    { -- further customize the options set by the community
        "mfussenegger/nvim-jdtls",
        opts = {
            single_file_support = true,
            root_dir = vim.fs.dirname(vim.fs.find({ ".idea", "gradlew", ".git", "mvnw" }, { upward = true })[1]) or
            vim.fn.getcwd(),
            capabilities = {
                workspace = {
                    configuration = true,
                },
                textDocument = {
                    completion = {
                        completionItem = {
                            snippetSupport = true,
                        },
                    },
                },
            },
        },
    },
    -- =========================================================================
    --                                                                         =
    --                                                                         =
    --                                                                         =
    --                                                                         =
    --                              DISABLED PLUGINS                           =
    --                                                                         =
    --                                                                         =
    --                                                                         =
    --                                                                         =
    -- =========================================================================

    -- Commented out plugins:-------------------------------------------------

    -- { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
    -- { import = "astrocommunity.bars-and-lines.vim-illuminate" },
    -- { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },
    -- { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
    -- { import = "astrocommunity.bars-and-lines.dropbar-nvim" }, -- NVIM v0.10 NEEDED
    -- { import = "astrocommunity.scrolling.satellite-nvim" },
    -- { import = "astrocommunity.git.git-blame-nvim" },

    -- Commented out configurations::-----------------------------------------

    -- { -- further customize the options set by the community
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         local highlight = {
    --             "RainbowRed",
    --             "RainbowYellow",
    --             "RainbowBlue",
    --             "RainbowOrange",
    --             "RainbowGreen",
    --             "RainbowViolet",
    --             "RainbowCyan",
    --         }
    --         local hooks = require "ibl.hooks"
    --         -- create the highlight groups in the highlight setup hook, so they are reset
    --         -- every time the colorscheme changes
    --         hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --             vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --             vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --             vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    --             vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --             vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    --             vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    --             vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    --         end)
    --
    --         vim.g.rainbow_delimiters = { highlight = highlight }
    --         require("ibl").setup {
    --             scope = {
    --                 highlight = highlight,
    --                 show_start = false,
    --                 show_end = false,
    --             },
    --             indent = {
    --                 char = "│",
    --                 smart_indent_cap = true,
    --             },
    --         }
    --
    --         hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    --     end,
    -- },

    -- import/override with your plugins folder
}
