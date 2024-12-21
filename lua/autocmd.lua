-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
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

--vim.api.nvim_create_autocmd('BufEnter', {
--  desc = "Automatically close Neo-tree when it's the last window",
--  callback = function()
--    -- Get the list of windows
--    local wins = vim.api.nvim_tabpage_list_wins(0)
--    -- TODO: Finne ut hvordan man kan sjekke om en buffer har blitt lagret eller ikke.
--
--    --    If there's only one window and it's Neo-tree, close it
--    if #wins == 1 then
--      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(wins[1]))
--      if string.find(bufname, 'neo-tree', 1, true) ~= nil then
--        vim.cmd 'q'
--      end
--    end
--  end,
--})
