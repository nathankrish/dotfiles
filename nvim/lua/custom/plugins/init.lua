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
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gv', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    version = '*',
    config = true,
    shade_terminals = false,
    keys = {
      { '<leader>h', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Toggle the [h]orizontal terminal' },
    },
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
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = true,
    keys = {
      { '<leader>gn', '<cmd>Neogit<cr>', desc = 'Neogit' },
    },
  },
  {
    'mfussenegger/nvim-jdtls',
  },
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   ft = { 'markdown' },
  --   build = function()
  --     vim.fn['mkdp#util#install']()
  --   end,
  -- },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   build = 'cd app && yarn install',
  --   init = function()
  --     vim.g.mkdp_filetypes = { 'markdown' }
  --   end,
  --   keys = {
  --     {
  --       '<leader>md',
  --       ft = 'markdown',
  --       '<cmd>MarkdownPreviewToggle<cr>',
  --       desc = 'Markdown Preview',
  --     },
  --   },
  -- },
}
