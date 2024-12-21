require('mini.animate').setup {
  cursor = {
    enable = false,
  },
  scroll = {
    timing = require('mini.animate').gen_timing.linear { duration = 150, unit = 'total' },
  },
}
