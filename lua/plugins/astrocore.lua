-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true, -- highlight URLs at start
            notifications = true, -- enable notifications at start
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = {
                prefix = "",
            },
            underline = true,
            severity_sort = true,
        },

        -- vim options can be configured here
        options = {
            opt = { -- vim.opt.<key>
                relativenumber = false, -- sets vim.opt.relativenumber
                number = true, -- sets vim.opt.number
                spell = false, -- sets vim.opt.spell
                signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                wrap = true, -- sets vim.opt.wrap
                showbreak = "↪ ",
                -- list = true,
                -- listchars = {
                --     tab = "→ ",
                --     extends = "⟩",
                --     precedes = "⟨",
                --     trail = "·",
                --     nbsp = "␣",
                --     eol = "↲",
                -- },
                tabstop = 4,
                softtabstop = 4,
                shiftwidth = 4,
                expandtab = true,
            },
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file

                -- Add the following line to set the dynamic Python executable for pynvim
                python3_host_prog = "$NVIM_PYTHON_PATH",
                -- loaded_matchparen = 1, -- disable built-in MatchParen for macOSX.
            },
        },

        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized

        -- -- first key is the mode, ex: v = visual
        mappings = {
            --     -- second key is the lefthand side of the map, ex: <leader>

            i = {
                -- -- Neoscroll trackpad scrolling
                -- ["<ScrollWheelUp>"] = { "<cmd>lua require('neoscroll').scroll(-1, true, 20)<CR>", desc = "Scroll Up" },
                -- ["<ScrollWheelDown>"] = {
                --     "<cmd>lua require('neoscroll').scroll(1, true, 20)<CR>",
                --     desc = "Scroll Down",
                -- },
            },

            -- Visual mode mappings
            v = {
                -- -- Neoscroll trackpad scrolling
                -- vim.api.nvim_set_keymap("v", "<ScrollWheelUp>", "<C-y>", { noremap = true, silent = true }),
                -- vim.api.nvim_set_keymap("v", "<ScrollWheelDown>", "<C-e>", { noremap = true, silent = true }),
                -- -- ["<ScrollWheelUp>"] = { "<cmd>lua require('neoscroll').scroll(-1, true, 20)<CR>", desc = "Scroll Up" },
                -- -- ["<ScrollWheelDown>"] = { "<cmd>lua require('neoscroll').scroll(1, true, 20)<CR>", desc = "Scroll Down" },

                -- ChatGPT
                ["<leader>a"] = { name = "󱚤 ChatGPT" },
                ["<leader>ac"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
                ["<leader>ae"] = { ":'<,'>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
                ["<leader>aw"] = { ":'<,'>ChatGPTRun complete_code<CR>", desc = "Complete Code" },
                ["<leader>ag"] = { ":'<,'>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
                ["<leader>at"] = { ":'<,'>ChatGPTRun translate<CR>", desc = "Translate" },
                ["<leader>ak"] = { ":'<,'>ChatGPTRun keywords<CR>", desc = "Keywords" },
                ["<leader>ad"] = { ":'<,'>ChatGPTRun docstring<CR>", desc = "Docstring" },
                ["<leader>aa"] = { ":'<,'>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
                ["<leader>ao"] = { ":'<,'>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
                ["<leader>as"] = { ":'<,'>ChatGPTRun summarize<CR>", desc = "Summarize" },
                ["<leader>af"] = { ":'<,'>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
                ["<leader>ax"] = { ":'<,'>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
                ["<leader>ar"] = { ":'<,'>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
                ["<leader>al"] = {
                    ":'<,'>ChatGPTRun code_readability_analysis<CR>",
                    desc = "Code Readability Analysis",
                },

                -- Code Runner mappings
                ["<leader>r"] = { name = " Code Runner" },

                -- SnipRun mappings
                ["<leader>rs"] = { ":'<,'>SnipRun<cr>", desc = "Execute Code Snippet" },
            },

            -- Normal mode mappings
            n = {
                ["<leader>f"] = { name = "󰍉 Find" },

                -- Dadbod:
                ["<leader>lu"] = { "<Cmd>DBUIToggle<Cr>", desc = "Dadbod UI" },

                -- Buffer navigation and management
                ["<A-,>"] = { "<Cmd>BufferPrevious<CR>", desc = "Move to previous buffer" },
                ["<A-.>"] = { "<Cmd>BufferNext<CR>", desc = "Move to next buffer" },
                ["<A-<>"] = { "<Cmd>BufferMovePrevious<CR>", desc = "Re-order to previous buffer" },
                ["<A->>"] = { "<Cmd>BufferMoveNext<CR>", desc = "Re-order to next buffer" },
                ["<A-1>"] = { "<Cmd>BufferGoto 1<CR>", desc = "Goto buffer 1" },
                ["<A-2>"] = { "<Cmd>BufferGoto 2<CR>", desc = "Goto buffer 2" },
                ["<A-3>"] = { "<Cmd>BufferGoto 3<CR>", desc = "Goto buffer 3" },
                ["<A-4>"] = { "<Cmd>BufferGoto 4<CR>", desc = "Goto buffer 4" },
                ["<A-5>"] = { "<Cmd>BufferGoto 5<CR>", desc = "Goto buffer 5" },
                ["<A-6>"] = { "<Cmd>BufferGoto 6<CR>", desc = "Goto buffer 6" },
                ["<A-7>"] = { "<Cmd>BufferGoto 7<CR>", desc = "Goto buffer 7" },
                ["<A-8>"] = { "<Cmd>BufferGoto 8<CR>", desc = "Goto buffer 8" },
                ["<A-9>"] = { "<Cmd>BufferGoto 9<CR>", desc = "Goto buffer 9" },
                ["<A-0>"] = { "<Cmd>BufferGoto 0<CR>", desc = "Goto buffer 0" },
                ["<A-p>"] = { "<Cmd>BufferPin<CR>", desc = "Pin/unpin buffer" },
                ["<A-c>"] = { "<Cmd>BufferClose<CR>", desc = "Close buffer" },
                -- Sort buffers
                ["<Space>bsb"] = { "<Cmd>BufferOrderByBufferNumber<CR>", desc = "Sort buffers by buffer number" },
                ["<Space>bsd"] = { "<Cmd>BufferOrderByDirectory<CR>", desc = "Sort buffers by directory" },
                ["<Space>bsl"] = { "<Cmd>BufferOrderByLanguage<CR>", desc = "Sort buffers by language" },
                ["<Space>bsw"] = { "<Cmd>BufferOrderByWindowNumber<CR>", desc = "Sort buffers by window number" },

                -- DevDocs
                ["<leader>D"] = { name = " DevDocs" },
                ["<leader>Df"] = { "<cmd>DevdocsFetch<CR>", desc = "Fetch DevDocs metadata" },
                ["<leader>Di"] = { "<cmd>DevdocsInstall<CR>", desc = "Install documentation" },
                ["<leader>Do"] = { "<cmd>DevdocsOpen<CR>", desc = "Open documentation in buffer" },
                ["<leader>DO"] = { "<cmd>DevdocsOpenFloat<CR>", desc = "Open documentation in float" },
                ["<leader>DC"] = { "<cmd>DevdocsOpenCurrent<CR>", desc = "Open current filetype doc" },
                ["<leader>Dc"] = {
                    "<cmd>DevdocsFetch<CR><cmd>DevdocsOpenCurrentFloat<CR>",
                    desc = "Open current filetype doc in float",
                },
                ["<leader>Dt"] = { "<cmd>DevdocsToggle<CR>", desc = "Toggle floating window" },
                ["<leader>Du"] = { "<cmd>DevdocsUninstall<CR>", desc = "Uninstall documentation" },
                ["<leader>DU"] = { "<cmd>DevdocsUpdate<CR>", desc = "Update documentation" },
                ["<leader>Da"] = { "<cmd>DevdocsUpdateAll<CR>", desc = "Update all documentations" },

                -- -- Neoscroll trackpad scrolling
                -- vim.api.nvim_set_keymap("n", "<ScrollWheelUp>", "<C-y>", { noremap = true, silent = true }),
                -- vim.api.nvim_set_keymap("n", "<ScrollWheelDown>", "<C-e>", { noremap = true, silent = true }),
                -- -- ["<ScrollWheelUp>"] = { "<cmd>lua require('neoscroll').scroll(-1, true, 20)<CR>", desc = "Scroll Up" },
                -- -- ["<ScrollWheelDown>"] = { "<cmd>lua require('neoscroll').scroll(1, true, 20)<CR>", desc = "Scroll Down" },

                -- ChatGPT
                ["<leader>a"] = { name = "󱚤 ChatGPT" },
                ["<leader>ac"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
                ["<leader>ae"] = { "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
                ["<leader>aw"] = { "<cmd>ChatGPTRun complete_code<CR>", desc = "Complete Code" },
                ["<leader>ag"] = { "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
                ["<leader>at"] = { "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
                ["<leader>ak"] = { "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
                ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
                ["<leader>aa"] = { "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
                ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
                ["<leader>as"] = { "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
                ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
                ["<leader>ax"] = { "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
                ["<leader>ar"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
                ["<leader>al"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },

                -- -- Harpoon mappings
                ["<leader><leader>"] = { name = "󰛢 Harpoon" },
                ["<leader><leader>1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon File 1" },
                ["<leader><leader>2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon File 2" },
                ["<leader><leader>3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon File 3" },
                ["<leader><leader>4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon File 4" },

                -- Zen Mode
                ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },

                -- stylua: ignore start
                -- Goto Preview Mappings
                ["<leader>lg"] = { name = " GoTo Preview" },
                ["<leader>lgd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", desc = "Go to definition" },
                ["<leader>lgt"] = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "Go to type definition" },
                ["<leader>lgi"] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", desc = "Go to implementation" },
                ["<leader>lgD"] = { "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", desc = "Go to declaration" },
                ["<leader>lgr"] = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", desc = "Go to references" },
                ["<leader>lq"] = { "<cmd>lua require('goto-preview').close_all_win()<CR>", desc = "Close GoTo preview" },
                -- stylua: ignore end

                -- Command and Search
                ["<CR>"] = { ":", desc = "Open command line", noremap = true },
                ["<leader>s"] = { ":SearchBoxReplace<CR>", desc = "Search and Replace" },

                -- GitHub Copilot mappings
                ["<leader>G"] = { name = " GitHub Copilot" },
                ["<leader>GE"] = { "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
                ["<leader>GD"] = { "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
                ["<leader>GA"] = { "<cmd>Copilot auth<cr>", desc = "Copilot Authenticator" },
                ["<leader>GP"] = { "<cmd>Copilot panel<cr>", desc = "Open Copilot Panel" },
                ["<leader>GT"] = { "<cmd>Copilot toggle<cr>", desc = "Toggle Copilot" },
                ["<leader>GS"] = { "<cmd>Copilot status<cr>", desc = "Show Copilot Status" },
                ["<leader>GV"] = { "<cmd>Copilot version<cr>", desc = "Show Copilot Version" },

                ["<leader>GG"] = { name = " Menu" },
                ["<leader>GGS"] = { "<cmd>Copilot suggestion<cr>", desc = "Trigger Copilot Suggestion" },
                ["<leader>GGA"] = { "<cmd>Copilot attach<cr>", desc = "Attach Copilot to Buffer" },
                ["<leader>GGD"] = { "<cmd>Copilot detach<cr>", desc = "Detach Copilot from Buffer" },

                -- Code Runner mappings
                ["<leader>r"] = { name = " Code Runner" },
                ["<leader>rr"] = { "<cmd>RunCode<cr>", desc = "Smart Run" },
                ["<leader>rc"] = { "<cmd>RunClose<cr>", desc = "Close runner" },
                ["<leader>rp"] = { "<cmd>RunProject<cr>", desc = "Run Project" },
                ["<leader>rf"] = { "<cmd>RunFile<cr>", desc = "Run File" },
                -- Compiler mappings
                ["<leader>ro"] = { "<cmd>CompilerOpen<cr>", desc = "Open Compiler" },
                ["<leader>rt"] = { "<cmd>CompilerToggleResults<cr>", desc = "Toggle Compiler Results" },
                ["<leader>rx"] = { "<cmd>CompilerRedo<cr>", desc = "Redo Compiler" },
                ["<leader>rk"] = { "<cmd>CompilerStop<cr>", desc = "Stop Compiler Tasks" },
                -- SnipRun mappings
                ["<leader>rs"] = { "<cmd>SnipRun<cr>", desc = "Execute Code Snippet" },
                ["<leader>ri"] = { "<cmd>SnipInfo<cr>", desc = "Snippet Info" },

                -- JavaCompileRun Script
                ["<leader>rj"] = {
                    function()
                        vim.cmd "ToggleTerm direction=float"
                        vim.defer_fn(
                            function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("jcr<CR>", true, false, true), "t", false) end,
                            10
                        ) -- Delay to ensure the terminal has opened before sending keys
                    end,
                    desc = "JavaCompileRun Script",
                },

                -- ScrollView mappings
                ["<leader>uv"] = { "<cmd>ScrollViewToggle<cr>", desc = "Toggle ScrollView" },
                ["<leader>uB"] = { "<cmd>ScrollViewRefresh<CR>", desc = "Refresh Scrollview" },

                -- Telescope mappings
                ["<leader>T"] = { name = " Telescope" },
                ["<leader>Tc"] = { "<cmd>Telescope neoclip<cr>", desc = "Clipboard manager" },
                ["<leader>Td"] = { "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
                ["<leader>Tf"] = { "<cmd>TodoQuickFix<cr>", desc = "Show TODOs in Quickfix" },
                ["<leader>Tl"] = { "<cmd>TodoLocList<cr>", desc = "Show TODOs in Location List" },
                ["<leader>Tt"] = { "<cmd>TodoTrouble<cr>", desc = "List TODOs in Trouble" },

                -- Markdown Preview mappings
                ["<leader>M"] = { name = " Markdown Preview" },
                ["<leader>Ms"] = { "<cmd>MarkdownPreview<cr>", desc = "Open Markdown Preview" },
                ["<leader>Mc"] = { "<cmd>MarkdownPreviewStop<cr>", desc = "Close Markdown Preview" },

                ["<Leader>c"] = {
                    function()
                        local bufs = vim.fn.getbufinfo { buflisted = true }
                        require("astrocore.buffer").close(0)
                        if require("astrocore").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
                    end,
                    desc = "Close buffer",
                },

                ["<Leader>C"] = {
                    function()
                        local bufs = vim.fn.getbufinfo { buflisted = true }
                        require("astrocore.buffer").close(0, true)
                        if require("astrocore").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
                    end,
                    desc = "Close buffer",
                },

                -- navigate buffer tabs with `H` and `L`
                L = {
                    function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
                    desc = "Next buffer",
                },
                H = {
                    function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
                    desc = "Previous buffer",
                },

                -- mappings seen under group name "Buffer"
                ["<Leader>bD"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(function(bufnr) require("astrocore.buffer").close(bufnr) end)
                    end,
                    desc = "Pick to close",
                },

                -- -- tables with just a `desc` key will be registered with which-key if it's installed
                -- -- this is useful for naming menus
                -- ["<Leader>b"] = { desc = "Buffers" },
                -- -- quick save
                -- -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
            },

            -- Terminal mode mappings
            t = {
                -- -- Add your terminal mode mappings here
                -- -- setting a mapping to false will disable it
                -- ["<esc>"] = false,
            },
        },
    },
}
