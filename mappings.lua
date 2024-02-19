-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
    -- Visual mode mappings
    v = {
        -- Actions Preview mappings
        ["<leader>lp"] = { "<cmd>lua require('actions-preview').code_actions()<CR>", desc = "Actions Preview" },

        -- Code Runner mappings
        ["<leader>r"] = { name = " Code Runner" },

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
        ["<leader>al"] = { ":'<,'>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
    },

    -- Normal mode mappings
    n = {
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

        -- Harpoon mappings
        ["<leader><leader>"] = { name = "󰛢 Harpoon" },
        ["<leader><leader>1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon File 1" },
        ["<leader><leader>2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon File 2" },
        ["<leader><leader>3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon File 3" },
        ["<leader><leader>4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon File 4" },

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

        ["<leader>c"] = {
            function()
                local bufs = vim.fn.getbufinfo { buflisted = true }
                require("astronvim.utils.buffer").close(0)
                if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then
                    require("alpha").start(true)
                end
            end,
            desc = "Close buffer",
        },

        ["<leader>C"] = {
            function()
                local bufs = vim.fn.getbufinfo { buflisted = true }
                require("astronvim.utils.buffer").close(0, true)
                if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then
                    require("alpha").start(true)
                end
            end,
            desc = "Force close buffer",
        },

        -- Buffer navigation and management
        ["<leader>bD"] = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(
                    function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
                )
            end,
            desc = "Pick to close",
        },
        ["<leader>b"] = { name = "Buffers" },
    },

    -- Terminal mode mappings
    t = {
        -- Add your terminal mode mappings here
    },
}
