-- Sets up the dashed line that guides indentation

require('mini.indentscope').setup {
  draw = {
    -- Define the animation function with a 10ms step duration
    animation = function()
      return 5
    end,
    -- animation = require('mini.indentscope').gen_animation.none(),
  },
}