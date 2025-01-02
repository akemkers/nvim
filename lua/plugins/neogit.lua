return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Open Neogit' },
    {
      '<leader>gd',
      function()
        if next(require('diffview.lib').views) == nil then
          vim.cmd 'DiffviewOpen'
        else
          vim.cmd 'DiffviewClose'
        end
      end,
      desc = 'Open Diffview',
    },
    { '<leader>gD', '<cmd>DiffviewOpen main<cr>', desc = 'Open Diffview (main)' },
  },
  config = function()
    require('neogit').setup {
      auto_refresh = true,
      integrations = {
        diffview = true,
      },
    }
  end,
}
