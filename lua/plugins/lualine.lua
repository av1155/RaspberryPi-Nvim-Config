-- Bubbles config for lualine:

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  -- black  = '#080808', -- transparent
  black  = '',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
  muted_blue = '#5f87af', -- A muted blue color
  dark_grey = '#262626', -- A new dark grey color for better contrast

}

local bubbles_theme = {
    normal = {
        a = { fg = colors.dark_grey, bg = colors.violet, gui = "bold" },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
        z = { fg = colors.white, bg = colors.muted_blue },
    },

    insert = {
        a = { fg = colors.dark_grey, bg = colors.blue, gui = "bold" },
        z = { fg = colors.white, bg = colors.muted_blue },
    },
    visual = {
        a = { fg = colors.dark_grey, bg = colors.cyan, gui = "bold" },
        z = { fg = colors.white, bg = colors.muted_blue },
    },
    replace = {
        a = { fg = colors.dark_grey, bg = colors.red, gui = "bold" },
        z = { fg = colors.white, bg = colors.muted_blue },
    },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
        z = { fg = colors.white, bg = colors.muted_blue },
    },
}

local function python_interpreter()
    if vim.bo.filetype == "python" then
        local python_path = os.getenv "NVIM_PYTHON_PATH"
        if python_path then
            local env_name = python_path:match ".*/envs/(.-)/bin/python"
            if env_name then
                return " " .. env_name
            else
                return " Python Env"
            end
        else
            return " No Python Interpreter"
        end
    else
        return ""
    end
end

local function lsp_status()
    local columns = vim.api.nvim_get_option "columns"
    if columns < 100 then -- Adjust the value as needed for your setup
        return ""
    else
        local active_clients = vim.lsp.get_active_clients()
        if next(active_clients) == nil then return "No Active Lsp" end

        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local active_servers = {}

        for _, client in ipairs(active_clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then table.insert(active_servers, client.name) end
        end

        if #active_servers == 0 then
            return "No Active Lsp"
        else
            return table.concat(active_servers, ", ")
        end
    end
end

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "AndreM222/copilot-lualine",
        },
        config = function()
            require("lualine").setup {
                options = {
                    theme = bubbles_theme,
                    component_separators = "|",
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {
                            "neo-tree",
                            "alpha",
                        },
                        winbar = {},
                    },
                },
                sections = {
                    lualine_a = {
                        { "mode", separator = { left = "" }, right_padding = 2 },
                    },
                    lualine_b = {
                        {
                            "filename",
                            on_click = function() vim.cmd "Telescope buffers" end,
                        },

                        {
                            "branch",
                            icon = "",
                            color = { fg = "#c6c6c6" },
                            on_click = function() vim.cmd "Telescope git_branches" end,
                        },
                    },
                    lualine_c = { "fileformat", { python_interpreter, color = { fg = "#c6c6c6" } } },

                    lualine_x = {
                        {
                            lsp_status,
                            icon = " LSP:",
                            color = { fg = "#c6c6c6" },
                            on_click = function() vim.cmd "LspInfo" end,
                        },
                        {
                            "copilot",
                            show_colors = true,
                            on_click = function() vim.cmd "Copilot panel" end,
                        },
                    },

                    lualine_y = {
                        {
                            "filetype",
                            on_click = function() vim.cmd "Telescope man_pages" end,
                        },
                        "progress",
                    },
                    lualine_z = {
                        { "diff", separator = { right = "" }, left_padding = 2 },
                    },
                },
                inactive_sections = {
                    lualine_a = { "filename" },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                tabline = {},
                extensions = {},
            }
        end,
    },
}
