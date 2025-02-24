return {
  'folke/snacks.nvim',
  opts = {
    lazygit = {
      -- your lazygit configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  keys = {
    { 'n', '<leader>gv', '<Cmd>lua require("snacks").lazygit.open()<CR>', { noremap = true, silent = true, desc = 'Open lazygit' } },
  },
}
