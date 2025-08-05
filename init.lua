-- Set <space> as the leader key
--
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'autocmd'
require 'lazy-bootstrap'
require 'lazy-plugins'
require 'utils.inspect'

vim.cmd 'colorscheme catppuccin'

-- Function to apply transparency
local function apply_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

  -- Force tabline and statusline transparency
  vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
end

-- Apply transparency after colorscheme loads
vim.schedule(apply_transparency)

-- Reapply transparency when buffers change to prevent flashing
vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "TabNew", "TabClosed", "BufEnter", "WinEnter", "TabEnter" }, {
  callback = function()
    apply_transparency()
  end,
})

-- Also hook into vim's redraw events
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.schedule(apply_transparency)
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
