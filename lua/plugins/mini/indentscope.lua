-- Sets up the dashed line that guides indentation

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = {
--     'help',
--     'dashboard',
--     'Trouble',
--     'trouble',
--     'lazy',
--     'mason',
--     'notify',
--     'toggleterm',
--     'lazyterm',
--   },
--   callback = function()
--     vim.b.miniindentscope_disable = true
--   end,
-- })

require('mini.indentscope').setup {
  draw = {
    -- Define the animation function with a 10ms step duration
    animation = function()
      return 5
    end,
    -- animation = require('mini.indentscope').gen_animation.none(),
  },
}
