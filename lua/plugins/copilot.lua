return {
  'github/copilot.vim',
  event = 'VeryLazy',

  config = function()
    local copilot_enabled = true

    function ToggleCopilot()
      if copilot_enabled == true then
        copilot_enabled = false
        vim.cmd 'Copilot disable'
        vim.notify('Copilot OFF', vim.log.Info)
      else
        copilot_enabled = true
        vim.cmd 'Copilot enable'
        vim.notify('Copilot ON', vim.log.Info)
      end
    end

    vim.keymap.set('n', '<leader>uc', '<cmd>lua ToggleCopilot()<cr>',
      { noremap = true, silent = true, desc = 'Toggle Copilot' })
  end,
}
