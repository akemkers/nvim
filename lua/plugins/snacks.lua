---@module "snacks"
return {
  'folke/snacks.nvim',
  event = 'VeryLazy',
  opts = {
    lazygit = {
      -- your lazygit configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    picker = {},
    explorer = {},
    input = {},
  },
  keys = {
    -- Explorer
    {
      '<leader>e',
      function()
        ---@diagnostic disable: missing-fields
        Snacks.explorer {
          hidden = true,
          follow_file = true,
          replace_netrw = true,
          layout = {
            preset = function()
              return vim.o.columns >= 120 and 'default' or 'vertical'
            end,
            layout = {
              width = 0.3,
            },
          },
          windows = {
            input = {
              keys = {
                ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
                [','] = { 'cd', mode = { 'n' } },
              },
            },
          },
          auto_close = true,
        }
      end,
      desc = 'Open File Explorer',
    },

    -- Pickers
    {
      '<leader>sf',
      function()
        Snacks.picker.files {
          hidden = true,
        }
      end,
      desc = 'Search Files',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>sc',
      function()
        --- @diagnostic disable-next-line: assign-type-mismatch
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Config Files',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Visual Selection or Word',
      mode = { 'n', 'x' },
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume Last Picker',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers {
          focus = 'list',
        }
      end,
      desc = 'Search Buffers',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Search Help',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Search Keymaps',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'Synbolds for buffer',
    },
    {
      '<leader>sD',
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = 'Buffer Diagnostics',
    },
    {
      '<leader>m',
      function()
        Snacks.picker.marks {
          ['local'] = false,
          focus = 'list',
          transform = function(item)
            if item.label:match '^%d$' then
              return false -- exclude numeric marks 0–9
            end
            return true
          end,
          actions = {
            ['delete_mark'] = function(picker)
              local item = picker:selected { fallback = true }

              if item[1] and item[1].label then
                vim.cmd('delmarks ' .. item[1].label)
                vim.notify('Deleted mark ' .. item[1].label)
                picker:find()
              else
                vim.notify 'Did not find mark to delete'
              end
            end,
          },
          win = {
            list = {
              keys = {
                ['d'] = 'delete_mark',
              },
            },
          },
        }
      end,
      desc = 'Marks',
    },

    -- Git
    {
      '<leader>gv',
      function()
        Snacks.lazygit()
      end,
      desc = 'Open Lazygit',
    },
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Git Log',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status {
          formatters = {
            file = {
              filename_first = true,
            },
          },
        }
      end,
      desc = 'Git Status',
    },

    -- LSP
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto T[y]pe Definition',
    },

    -- Bufdelete
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete buffer',
    },
    {
      '<leader>bo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Delete other buffers',
    },
  },
}
