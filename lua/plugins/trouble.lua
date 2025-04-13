return {
  'folke/trouble.nvim',
  opts = {},
  cmd = 'Trouble',
  keys = {
    {
      '<leader>dS',
      '<cmd>Trouble diagnostics toggle focus=true<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>ds',
      '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>dq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
