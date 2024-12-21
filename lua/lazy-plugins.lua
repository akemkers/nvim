-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  --'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'plugins/gitsigns',

  spec = {
    'tpope/vim-sleuth',
    require 'plugins.which-key',
    require 'plugins.telescope',
    require 'plugins.lspconfig',
    require 'plugins.conform',
    require 'plugins.cmp',
    require 'plugins.todo-comments',
    require 'plugins.mini',
    require 'plugins.treesitter',
    --require 'plugins.indent_line',

    --require 'plugins.debug',
    --require 'plugins.lint',
    --require 'plugins.autopairs',

    require 'plugins.neo-tree',
    require 'plugins.catppuccin',
    require 'plugins.tmux',
  },
}

--   , {
--
--   change_detection = {
--     enabled = true,
--     notify = true,
--   },
--   ui = {
--     border = 'rounded',
--     -- If you are using a Nerd Font: set icons to an empty table which will use the
--     -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
--     icons = vim.g.have_nerd_font and {} or {
--       cmd = '⌘',
--       config = '🛠',
--       event = '📅',
--       ft = '📂',
--       init = '⚙',
--       keys = '🗝',
--       plugin = '🔌',
--       runtime = '💻',
--       require = '🌙',
--       source = '📄',
--       start = '🚀',
--       task = '📌',
--       lazy = '💤 ',
--     },
--   },
-- })

-- vim: ts=2 sts=2 sw=2 et