-- NOTE: Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffer navigation
vim.keymap.set('n', 'L', ':bnext<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'H', ':bprevious<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bo', function()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = 'Delete other buffers' })

-- Tabs
vim.keymap.set('n', '<leader>tc', ':tabnew<cr>', { silent = true, desc = 'Creates new tab' })
vim.keymap.set('n', '<leader>tq', ':tabclose<cr>', { silent = true, desc = 'Quit current tab' })
vim.keymap.set('n', '<leader>tn', ':tabnext<cr>', { silent = true, desc = 'Next tab' })

-- Diagnostics
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { silent = true, desc = 'Open Diagnostic' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { silent = true, desc = 'Open Diagnostic' })
vim.keymap.set('n', '<leader>dd', vim.diagnostic.goto_prev, { silent = true, desc = 'Open Diagnostic' })
