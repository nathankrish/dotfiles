-- Krish's custom plugins

return {
  -- use nvim-tree as the file explorer
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    keys = {
      { '<C-n>', ':NvimTreeToggle<CR>', desc = 'Toggle NvimTree sideview', silent = true },
    },
    config = function()
      require('nvim-tree').setup {
        git = {
          ignore = false,
        },
      }
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    lazy = true,
    ---@type Flash.Config
    opts = {
      search = {
        trigger = ';',
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  -- {
  --   'NeogitOrg/neogit',
  --   lazy = true,
  --   dependencies = {
  --     'nvim-lua/plenary.nvim', -- required
  --     'sindrets/diffview.nvim', -- optional - Diff integration
  --
  --     -- Only one of these is needed.
  --     'nvim-telescope/telescope.nvim', -- optional
  --   },
  --   config = true,
  --   keys = {
  --     { '<leader>ng', '<cmd>Neogit<cr>', desc = 'Neogit' },
  --   },
  --   integrations = {
  --     diffviw = true,
  --   },
  -- },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'EdenEast/nightfox.nvim',
    -- 'ellisonleao/gruvbox.nvim',
    -- 'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      vim.cmd.colorscheme 'duskfox'
      -- vim.cmd.colorscheme 'gruvbox'
      -- vim.cmd.colorscheme 'kanagawa'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          disabled_filetypes = {
            statusline = { 'NvimTree' },
            winbar = { 'NvimTree' },
          }
        }
      }
    end
  },
}
