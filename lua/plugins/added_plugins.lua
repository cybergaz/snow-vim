return {

  ---------------------------------------------------------------------------------------------------
  -- vim surround
  ---------------------------------------------------------------------------------------------------
  {
    "tpope/vim-surround",
  },

  ---------------------------------------------------------------------------------------------------
  -- telescope file explorer
  ---------------------------------------------------------------------------------------------------
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   --
  --   -- a few keybinds to remember :
  --   -- Alt+c --> create file
  --   -- Alt+r --> rename
  --   -- Alt+d --> delete
  --   -- Ctrl+h --> toggle hidden
  -- },

  ---------------------------------------------------------------------------------------------------
  -- github copilot
  ---------------------------------------------------------------------------------------------------
  -- {
  --   "zbirenbaum/copilot.lua",
  -- },

  ---------------------------------------------------------------------------------------------------
  -- hex rgb colorcoding
  ---------------------------------------------------------------------------------------------------
  {
    "norcalli/nvim-colorizer.lua",
  },

  ---------------------------------------------------------------------------------------------------
  -- rust tools
  ---------------------------------------------------------------------------------------------------
  {
    "simrat39/rust-tools.nvim",
    opts = function()
      return {
        tools = { -- rust-tools options

          -- how to execute terminal commands
          -- options right now: termopen / quickfix / toggleterm / vimux
          executor = require("rust-tools.executors").termopen,

          -- callback to execute once rust-analyzer is done initializing the workspace
          -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
          on_initialized = nil,

          -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
          reload_workspace_from_cargo_toml = true,

          -- These apply to the default RustSetInlayHints command
          inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
          },

          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {

            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
              { "╭", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╮", "FloatBorder" },
              { "│", "FloatBorder" },
              { "╯", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╰", "FloatBorder" },
              { "│", "FloatBorder" },
            },

            -- Maximal width of the hover window. Nil means no max.
            max_width = nil,

            -- Maximal height of the hover window. Nil means no max.
            max_height = nil,

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false,
          },
        },
        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {
          -- standalone file support
          -- setting it to false may improve startup time
          standalone = true,
        }, -- rust-analyzer options

        -- debugging stuff
        dap = {
          adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
          },
        },
      }
    end,
    -- require("rust-tools").setup({
    --   --
    -- }),
  },

  ---------------------------------------------------------------------------------------------------
  -- nvim navic (for representing in which block you're in right now)
  ---------------------------------------------------------------------------------------------------
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = require("lazyvim.config").icons.kinds,
        lazy_update_context = true,
      }
    end,
  },

  ---------------------------------------------------------------------------------------------------
  -- harpoon file navigation
  ---------------------------------------------------------------------------------------------------
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove harpoon marks" },
      { "<S-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      -- { "<C-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      { "<S-h>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
      { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
      { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "harpoon file 1" },
      { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "harpoon file 2" },
      { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "harpoon file 3" },
      { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "harpoon file 4" },
      { "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "harpoon file 5" },
    },
  },
}
