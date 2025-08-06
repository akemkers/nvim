return {
  'sindrets/diffview.nvim',
  opts = {
    win_config = function()
      local c = { type = 'float' }
      local editor_width = vim.o.columns
      local editor_height = vim.o.lines
      c.width = math.min(100, editor_width)
      c.height = math.min(24, editor_height)
      c.col = math.floor(editor_width * 0.5 - c.width * 0.5)
      c.row = math.floor(editor_height * 0.5 - c.height * 0.5)
      return c
    end,
    enhanced_diff_hl = true,
    keymaps = {
      view = {
        { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Quit Diffview' } },
      },
      file_panel = {
        { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Quit Diffview' } },
      },
      file_history_panel = {
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
    {
      '<leader>gh',
      function()
        if next(require('diffview.lib').views) == nil then
          vim.cmd 'DiffviewFileHistory'
        else
          vim.cmd 'DiffviewClose'
        end
      end,
      desc = 'Open History',
    },
    {
      '<leader>gt',
      function()
        if next(require('diffview.lib').views) == nil then
          vim.cmd 'DiffviewFileHistory %'
        else
          vim.cmd 'DiffviewClose'
        end
      end,
      desc = 'Open History for current file',
    },
  },
}
