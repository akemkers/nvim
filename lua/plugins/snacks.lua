return {
  'folke/snacks.nvim',
  opts = {
    quickfile = {},
    lazygit = {
      -- your lazygit configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  config = function()
    local snacks = require 'snacks'
    vim.keymap.set('n', '<leader>gv', snacks.lazygit.open, { desc = 'Open lazygit' })
  end,
}
