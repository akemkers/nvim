require('mini.tabline').setup()
function ToggleTabline()
  if vim.g.minitabline_disable then
    vim.g.minitabline_disable = false
    vim.opt.showtabline = 2 -- Always show tabline
  else
    vim.g.minitabline_disable = true
    vim.opt.showtabline = 0 -- Hide tabline
  end
  vim.cmd 'redrawtabline' -- Refresh the tabline
end
vim.keymap.set('n', '<leader>ut', ':lua ToggleTabline()<CR>', { desc = 'Toggle tabline', noremap = true })
