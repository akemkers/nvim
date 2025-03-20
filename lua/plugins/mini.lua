return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup {
        n_lines = 50,
      }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.pairs').setup()
      require('mini.notify').setup {
        lsp_progress = {
          enable = false,
        },
      }
      require('mini.comment').setup()
      require('mini.splitjoin').setup {
        mappings = {
          toggle = 'gs',
        },
      }

      require 'plugins.mini.statusline'
      require 'plugins.mini.animate'
      require 'plugins.mini.files'
      require 'plugins.mini.tabline'
    end,
  },
}
