return {
  enabled = true,
  'folke/noice.nvim',
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    'echasnovski/mini.nvim',
  },
  event = 'VeryLazy',
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = '%d+ lines yanked' },
            { find = '%d+ (fewer|more) lines' },
            { find = '^/%S+' },
          },
        },
        opts = { skip = true },
      },
      {
        view = 'mini',
        filter = { event = 'msg_showmode' },
      },
      {
        -- Disable annoying error from `kotlin_language_server`.
        opts = { skip = true },
        filter = {
          event = 'notify',
          any = {
            { find = '^kotlin_language_server: %-32603: Internal error%.$' },
            { find = "Done!" }
          }
        },
      },
    },

    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>n",  "",                                             desc = "+noice" },
    { "<leader>nl", function() require("noice").cmd("last") end,    desc = "Noice Last Message" },
    { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>na", function() require("noice").cmd("all") end,     desc = "Noice All" },
    { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>nt", function() require("noice").cmd("pick") end,    desc = "Noice Picker (Snacks.picker)" },
  },
  config = function(_, opts)
    require('noice').setup(opts)
  end,
}
