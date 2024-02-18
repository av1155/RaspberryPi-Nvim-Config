return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- Define your existing logo
      local custom_logo = {
        [[                                                    ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        [[                                                    ]],
        [[                                                    ]],
      }

      -- Function to center and crop the logo
      local function center_and_crop_logo(logo)
        local width = vim.o.columns
        local cropped_logo = {}
        for _, line in ipairs(logo) do
          local line_length = vim.fn.strdisplaywidth(line)
          if line_length > width then
            -- Crop the line if it is longer than the window width
            local crop_start = math.floor((line_length - width) / 2) + 1
            local crop_end = crop_start + width - 1
            line = string.sub(line, crop_start, crop_end)
          end
          -- Center the line by adding equal padding to both sides
          local padding = (width - vim.fn.strdisplaywidth(line)) / 2
          local padding_left = math.floor(padding)
          local padding_right = math.ceil(padding)
          line = string.rep(" ", padding_left) .. line .. string.rep(" ", padding_right)
          table.insert(cropped_logo, line)
        end
        return table.concat(cropped_logo, "\n")
      end

      -- Function to center a single line of text
      local function center_text(text)
        local width = vim.o.columns
        local text_length = vim.fn.strdisplaywidth(text)
        local padding = (width - text_length) / 2
        local padding_left = math.floor(padding)
        local padding_right = math.ceil(padding)
        return string.rep(" ", padding_left) .. text .. string.rep(" ", padding_right)
      end

      -- Greeting function
      local function getGreeting(name)
        local tableTime = os.date "*t"
        local datetime = os.date " %Y-%m-%d   %I:%M %p"
        local hour = tableTime.hour
        local greetingsTable = {
          [1] = "  Sleep well",
          [2] = "  Good morning",
          [3] = "  Good afternoon",
          [4] = "  Good evening",
          [5] = "󰖔  Good night",
        }
        local greetingIndex = 0
        if hour == 23 or hour < 7 then
          greetingIndex = 1
        elseif hour < 12 then
          greetingIndex = 2
        elseif hour >= 12 and hour < 18 then
          greetingIndex = 3
        elseif hour >= 18 and hour < 21 then
          greetingIndex = 4
        elseif hour >= 21 then
          greetingIndex = 5
        end
        return datetime .. "\t" .. greetingsTable[greetingIndex] .. ", " .. name
      end

      local userName = "Andrea"
      local greeting = getGreeting(userName)
      local centered_greeting = center_text(greeting)

      -- Adjust padding in the layout
      opts.config.layout = {
        { type = "padding", val = 1 }, -- Adjust top padding
        opts.section.header,
        { type = "padding", val = 3 }, -- Adjust padding between header and buttons
        opts.section.buttons,
        { type = "padding", val = 2 }, -- Adjust padding between buttons and footer
        opts.section.footer,
      }

      -- Convert the custom_logo table to a string and center the greeting
      local logo = center_and_crop_logo(custom_logo)
      opts.section.header.val = vim.split(logo .. "\n" .. centered_greeting, "\n")

      -- Update logo and greeting when window is resized
      vim.api.nvim_create_autocmd("VimResized", {
        pattern = "*",
        callback = function()
          -- Recalculate the centered and cropped logo and centered greeting
          opts.section.header.val =
            vim.split(center_and_crop_logo(custom_logo) .. "\n" .. center_text(getGreeting(userName)), "\n")
        end,
      })

      return opts
    end,
  },

  -- {
  --             [[_/\\\\\_____/\\\_______________________________/\\\________/\\\___________________________         ]],
  --             [[_\/\\\\\\___\/\\\______________________________\/\\\_______\/\\\___________________________        ]],
  --             [[ _\/\\\/\\\__\/\\\______________________________\//\\\______/\\\___/\\\_____________________       ]],
  --             [[  _\/\\\//\\\_\/\\\_____/\\\\\\\\______/\\\\\_____\//\\\____/\\\___\///_____/\\\\\__/\\\\\___      ]],
  --             [[   _\/\\\\//\\\\/\\\___/\\\/////\\\___/\\\///\\\____\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_     ]],
  --             [[    _\/\\\_\//\\\/\\\__/\\\\\\\\\\\___/\\\__\//\\\____\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\_    ]],
  --             [[     _\/\\\__\//\\\\\\_\//\\///////___\//\\\__/\\\______\//\\\\\______\/\\\_\/\\\__\/\\\__\/\\\_   ]],
  --             [[      _\/\\\___\//\\\\\__\//\\\\\\\\\\__\///\\\\\/________\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\_  ]],
  --             [[       _\///_____\/////____\//////////_____\/////___________\///________\///__\///___\///___\///__ ]],
  --             [[                                                                                                   ]],
  --             [[                                                                                                   ]],
  --       }
  --

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
