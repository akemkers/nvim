return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
      ['<S-Tab>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = { documentation = { auto_show = false } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
  
  config = function(_, opts)
    require('blink.cmp').setup(opts)
    
    -- Disable completion for specific filetypes
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'minifiles', 'DiffviewFiles', 'DiffviewFileHistory' },
      callback = function()
        vim.b.completion = false
      end,
    })
  end,
}
