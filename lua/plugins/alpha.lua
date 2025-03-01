return {
  'goolord/alpha-nvim',
  config = function()
    local dashboard = require 'alpha.themes.dashboard'
    local button = require('alpha.themes.dashboard').button

    local buttons = {
      type = 'group',
      val = {
        button('e', '  New file', '<cmd>ene <CR>'),
        button('q', '  Quit Neovim', '<cmd>qa<CR>'),
      },
      opts = {
        spacing = 1,
      },
    }
    dashboard.config.layout = {
      { type = 'padding', val = 8 },
      dashboard.section.header,
      { type = 'padding', val = 4 },
      buttons,
      dashboard.section.footer,
    }

    dashboard.opts = {
      margin = 5,
      opts = {
        noautocmd = true,
      },
    }

    require('alpha').setup(dashboard.config)
  end,
}
