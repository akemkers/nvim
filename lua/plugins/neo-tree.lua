return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  event = 'VimEnter',
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      default_components_config = {
        file_size = {
          enabled = false,
        },
      },
      window = {
        position = 'float',
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['q'] = function()
            vim.cmd 'wincmd p'
          end,
        },
      },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- only works on Windows for hidden files/directories
          hide_by_name = {
            -- ".DS_Store",
            -- "thumbs.db",
            --"node_modules",
          },
          hide_by_pattern = {
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            --".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            --".DS_Store",
            --"thumbs.db",
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
          follow_current_file = {
            enabled = true,
          },
        },
      },
    }

    -- keymaps
    vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal<CR>')
  end,
}