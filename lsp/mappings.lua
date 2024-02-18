return {
    n = {
        -- Actions Preview mappings:
        ["<leader>la"] = { "<cmd>lua require('actions-preview').code_actions()<CR>", desc = "LSP Code Actions" },
        ["<leader>lr"] = { ":IncRename ", desc = "Rename current symbol" },
        ["<leader>ld"] = {
            function()
                local hovercraft = require "hovercraft"
                if hovercraft.is_visible() then
                    hovercraft.enter_popup()
                else
                    hovercraft.hover()
                end
            end,
            desc = "Hover LSP provider",
        },
    },
}
