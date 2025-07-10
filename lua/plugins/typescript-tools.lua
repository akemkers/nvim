return {
  enabled = true,
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('typescript-tools').setup {
      settings = {
        jsx_close_tag = {
          enable = true,
        },
        expose_as_code_action = 'all',
      },
    }

    vim.keymap.set('n', '<leader>co', '<Cmd>TSToolsOrganizeImports<CR>', { desc = 'Organize imports' })
    vim.keymap.set('n', '<leader>ci', '<Cmd>TSToolsAddMissingImports<CR>', { desc = 'Add missing imports' })
    vim.keymap.set('n', '<leader>cR', '<Cmd>TSToolsRenameFile<CR>', { desc = 'Rename file' })
  end,
  ft = {
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact',
  },
}
