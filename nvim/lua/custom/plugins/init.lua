-- Krish's custom plugins

return {
  -- use nvim-tree as the file explorer
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    keys = {
      { '<C-n>', ':NvimTreeToggle<CR>', desc = 'Toggle NvimTree sideview', silent = true },
    },
    config = function()
      require('nvim-tree').setup {
        filters = {
          dotfiles = true,
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
      { '<leader>g', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
