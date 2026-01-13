return {
  'mistweaverco/kulala.nvim',
  -- keys = {
  --   { '<leader>Rs', desc = 'Send request' },
  --   { '<leader>Ra', desc = 'Send all requests' },
  --   { '<leader>Rb', desc = 'Open scratchpad' },
  -- },
  ft = { 'http', 'rest' },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = '<leader>R',
    kulala_keymaps_prefix = '',
    contenttypes = {
      ['application/vnd.sparebank1.v1+json'] = 'application/json',
      ['application/vnd.sparebank1.v1+json;charset=utf-8'] = 'application/json',
    },
  },
}
