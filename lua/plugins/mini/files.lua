local minifiles = require 'mini.files'
minifiles.setup {
  mappings = {
    go_in_plus = '<CR>',
  },
}

vim.keymap.set('n', '-', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  MiniFiles.reveal_cwd()
end)
