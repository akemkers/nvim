return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Open Neogit' },
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
    { '<leader>gD', '<cmd>DiffviewOpen main<cr>', desc = 'Open Diffview (main)' },
  },
  opts = {
    auto_refresh = true,
    integrations = {
      diffview = true,
    },
  },
}
