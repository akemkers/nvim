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
    require('diffview').setup {
      keymaps = {
        view = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Quit Diffview' } },
        },
        file_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Quit Diffview' } },
        },
      },
    }
    require('neogit').setup {
      auto_refresh = true,
      integrations = {
        diffview = true,
      },
      mappings = {
        popup = {
          ['L'] = 'LogPopup',
        },
        status = {
          ['l'] = 'Toggle',
          ['h'] = 'Toggle',
        },
      },
    }

    -- Experimenting with setting custom highlights
    --     vim.cmd [[
    --   highlight NeogitDiffAddHighlight guibg=#1e1e2e guifg=#a6e3a1
    --   highlight NeogitDiffDeleteHighlight guibg=#1e1e2e guifg=#f38ba8
    --   highlight NeogitDiffContextHighlight guibg=#181825 guifg=#cdd6f4
    --   highlight NeogitHunkHeader guibg=#313244 guifg=#cdd6f4
    --   highlight NeogitHunkHeaderHighlight guibg=#45475a guifg=#cdd6f4
    -- ]]
  end,
}
