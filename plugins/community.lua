return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  -- { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.markdown" },

  -- User Interface
  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.split-and-window.edgy-nvim" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },

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

  -- Utility and Tools
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  { "hrsh7th/cmp-cmdline", event = "VeryLazy" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { -- further customize the options set by the community
    "echasnovski/mini.animate",
    opts = {
      -- scroll = { enable = true },
      -- resize = { enable = true },
      -- open = { enable = true },
      close = { enable = false },
    },
  },

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
        { filter = { event = "msg_show", min_height = 20 }, view = "messages" }, -- send long messages to split
        { filter = { event = "msg_show", find = "%d+L,%s%d+B" }, view = "mini" }, -- save notification settings
        { filter = { event = "msg_show", find = "^%d+ more lines$" }, opts = { skip = true } }, -- skip paste notifications
        { filter = { event = "msg_show", find = "^%d+ fewer lines$" }, opts = { skip = true } }, -- skip delete notifications
        { filter = { event = "msg_show", find = "^%d+ lines yanked$" }, opts = { skip = true } }, -- skip yank notifications
      },
    },
  },

  { -- further customize the options set by the community
    "mfussenegger/nvim-jdtls",
    opts = {
      single_file_support = true,
      root_dir = vim.fs.dirname(vim.fs.find({ ".idea", "gradlew", ".git", "mvnw" }, { upward = true })[1])
        or vim.fn.getcwd(),
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
}
