-- [[ Setting options ]]
-- See `:help vim.opt`
--You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'nosplit'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Needed to display colors properly for colorizer.nvim
vim.opt.termguicolors = true

-- Turn off linewrapping
vim.opt.wrap = false

-- diagnostics virtual text
vim.diagnostic.config {
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
    spacing = 4,
    current_line = true,
    position = 'eol', -- Position of virtual text, eol or inline
  },
  -- virtual_lines = true,
  signs = true,
  underline = true,

  float = {
    source = true,
    border = 'rounded',
    focusable = false,
    header = { ' Diagnostic' },
    -- indent markers for multi-line messages
    indent_markers = {
      enable = true,
    },
  },
}

-- Required for nvim-colorizer
vim.opt.termguicolors = true
-- vim: ts=2 sts=2 sw=2 et
