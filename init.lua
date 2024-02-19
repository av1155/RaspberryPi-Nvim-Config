return {
    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "stable", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "nightly", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_quit = false, -- automatically quit the current session after a successful update
        remotes = { -- easily add new remotes to track
            --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
            --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
            --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        },
    },

    -- Set colorscheme to use
    colorscheme = "catppuccin-mocha",

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
        virtual_text = {
            prefix = "",
        },
        underline = true,
        severity_sort = true,
    },

    lsp = {
        -- customize lsp formatting options
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
                -- "lua_ls",
                "jdtls",
            },
            timeout_ms = 1000, -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
    },

    -- Configure require("lazy").setup() options
    lazy = {
        defaults = { lazy = true },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
            },
        },
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        -- ================================================================================
        -- ================================================================================
        -- Set require for some plugin commands to work
        require("inc_rename").setup()

        -- ---@diagnostic disable-next-line: missing-fields
        -- require("notify").setup {
        --     background_colour = "#262d3b",
        -- }

        -- Defer the execution of setting LSP and Mason configurations to reduce startup time
        vim.defer_fn(function()
            -- Setting border for LSP windows
            require("lspconfig.ui.windows").default_options.border = "rounded"

            -- Setting up Mason with a custom UI configuration
            require("mason").setup {
                ui = {
                    border = "rounded",
                },
            }
        end, 1000) -- Delay in milliseconds, adjust as needed

        -- ================================================================================

        -- local map = vim.api.nvim_set_keymap
        local unmap = vim.api.nvim_del_keymap
        -- local opts = { noremap = true, silent = true }

        -- Undo some stroVim mappings:
        unmap("n", "<leader>bse")
        unmap("n", "<leader>bsi")
        unmap("n", "<leader>bsm")
        unmap("n", "<leader>bsp")
        unmap("n", "<leader>bsr")

        -- ================================================================================

        -- Show cursor line only in active window, except for neo-tree buffer
        vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
            callback = function()
                if
                    vim.tbl_contains({
                        "neo-tree",
                        "aerial",
                    }, vim.bo.filetype)
                then
                    return
                end

                local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
                if ok and cl then
                    vim.wo.cursorline = true
                    vim.api.nvim_win_del_var(0, "auto-cursorline")
                end
            end,
        })

        vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
            callback = function()
                if
                    vim.tbl_contains({
                        "neo-tree",
                        "aerial",
                    }, vim.bo.filetype)
                then
                    return
                end

                local cl = vim.wo.cursorline
                if cl then
                    vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
                    vim.wo.cursorline = false
                end
            end,
        })

        -- ================================================================================

        -- Configuration for setting OPENAI_API_KEY environment variable
        -- Create an augroup for ChatGPT setup autocommands
        local group = vim.api.nvim_create_augroup("ChatGPTSetup", { clear = true })

        -- Autocmd to set OPENAI_API_KEY when the 'VeryLazy' user event is triggered
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            group = group,
            callback = function()
                vim.fn.setenv(
                    "OPENAI_API_KEY",
                    vim.fn.trim(vim.fn.system "bash ~/.dotfiles/configs/zsh/openai_api_key.sh")
                )
            end,
        })

        -- ================================================================================

        -- ================================================================================
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
    end,
}
