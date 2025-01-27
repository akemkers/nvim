return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  config = function()
    require('chatgpt').setup {
      openai_params = {
        model = 'gpt-4o',
        max_tokens = 2000,
      },
      openai_edit_params = {
        model = 'gpt-4o',
      },
    }
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim', -- optional
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>cc', ':ChatGPT<CR>', desc = 'Open ChatGPT' },
    { '<leader>ce', ':ChatGPTEdit<CR>', desc = 'Edit with ChatGPT', mode = { 'n', 'v' } },
    { '<leader>cw', ':ChatGPTRun explain_code<CR>', desc = 'ChatGPT Explain Code', mode = { 'v' } },
    { '<leader>ct', ':ChatGPTRun add_tests<CR>', desc = 'ChatGPT Explain Code', mode = { 'v' } },
  },
}
