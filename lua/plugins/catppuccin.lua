return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
        integrations = {
          alpha = true,
          diffview = true,
          cmp = true,
          gitsigns = true,

          mason = true,
          mini = { enabled = true },
          neotree = true,
          neogit = true,
        },
        highlight_overrides = {
          mocha = function(colors)
            local overrides = {
              -- Tabline overrides (transparent backgrounds)
              MiniTablineCurrent = { fg = colors.yellow, bg = "NONE", style = { 'bold' } },
              MiniTablineFill = { bg = "NONE" },
              MiniTablineHidden = { fg = colors.overlay1, bg = "NONE" },
              MiniTablineModifiedCurrent = { fg = colors.yellow, bg = "NONE", style = { 'bold' } },
              MiniTablineModifiedHidden = { fg = colors.subtext0, bg = "NONE" },
              MiniTablineModifiedVisible = { fg = colors.subtext0, bg = "NONE", style = { 'bold' } },
              MiniTablineTabpagesection = { fg = colors.mauve, bg = "NONE", style = { 'bold' } },
              MiniTablineVisible = { fg = colors.overlay1, bg = "NONE", style = { 'bold' } },

              -- Statusline overrides (transparent backgrounds)
              MiniStatuslineModeNormal = { fg = colors.blue, bg = "NONE", style = { 'bold' } },
              MiniStatuslineModeInsert = { fg = colors.green, bg = "NONE", style = { 'bold' } },
              MiniStatuslineModeVisual = { fg = colors.mauve, bg = "NONE", style = { 'bold' } },
              MiniStatuslineModeReplace = { fg = colors.red, bg = "NONE", style = { 'bold' } },
              MiniStatuslineModeCommand = { fg = colors.yellow, bg = "NONE", style = { 'bold' } },
              MiniStatuslineModeOther = { fg = colors.teal, bg = "NONE", style = { 'bold' } },
              MiniStatuslineDevinfo = { fg = colors.overlay1, bg = "NONE" },
              MiniStatuslineFilename = { fg = colors.text, bg = "NONE" },
              MiniStatuslineFileinfo = { fg = colors.overlay1, bg = "NONE" },
              MiniStatuslineDirectory = { fg = colors.text, bg = "NONE" },
              MiniStatuslineInactive = { fg = colors.overlay0, bg = "NONE" },

              --Base statusline and tabline backgrounds
              StatusLine = { bg = "NONE" },
              StatusLineNC = { bg = "NONE" },
              TabLine = { bg = "NONE" },
              TabLineFill = { bg = "NONE" },
              TabLineSel = { bg = "NONE" },

              -- Typescript overrides
              ['@keyword.export'] = { fg = colors.mauve },
              ['@tag'] = { fg = colors.blue },
              ['@tag.builtin'] = { fg = colors.blue },
              ['@tag.attribute'] = { fg = colors.yellow },
              ['@tag.attribute.tsx'] = { fg = colors.yellow },
            }

            for _, hl in ipairs { 'Headline', 'rainbow' } do
              for i, c in ipairs { 'green', 'sapphire', 'mauve', 'peach', 'red', 'yellow' } do
                overrides[hl .. i] = { fg = colors[c], style = { 'bold' } }
              end
            end
            return overrides
          end,
        },
      }
    end,
  },
}
