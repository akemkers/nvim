return {
  'sindrets/diffview.nvim',
  opts = {
    keymaps = {
      view = {
        { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Quit Diffview' } },
      },
      file_panel = {
        { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Quit Diffview' } },
      },
    },
  },
  keys = {
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

    {
      '<leader>gD',
      function()
        if next(require('diffview.lib').views) == nil then
          vim.cmd 'DiffviewOpen main'
        else
          vim.cmd 'DiffviewClose'
        end
      end,
      desc = 'Open Diffview (main)',
    },
  },
}
