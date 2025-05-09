-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Open help page in a vertical split instead of horizontal',
  group = vim.api.nvim_create_augroup('help_window_right', {}),
  pattern = { '*.txt' },
  callback = function()
    if vim.o.filetype == 'help' then
      vim.cmd.wincmd 'L'
      vim.cmd.wincmd '|'
      vim.cmd.wincmd '='
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Make a buffer-local keymap of gd to enabled natural traversel of help files',
  pattern = 'help',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<C-]>', { noremap = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Sets desired indentation for go files',
  pattern = { 'go', 'kotlin', 'xml' },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd('Filetype', {
  desc = 'Sets 2 space indentation for selected filetypes',
  pattern = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'svg', 'less', 'html', 'jsonc', 'json', 'http', 'lua', 'hurl' },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
