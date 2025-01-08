return {
  enabled = false,
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      jsx_close_tag = {
        enable = true,
      },
      expose_as_code_action = 'all',
    },
  },
}
