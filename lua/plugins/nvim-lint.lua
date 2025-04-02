return {
  enabled = false,
  'mfussenegger/nvim-lint',
  event = 'VeryLazy',
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      --go = { 'golangcilint' },
    }

    --lint.linters.golangcilint.args = { 'golangci-lint', 'run', '--output.json.path', 'stdout', '--issues-exit-code=1', '--show-stats=false' }

    local lint_enabled = true
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    local function setup_linting()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end

    -- Run the setup at startup
    setup_linting()

    -- Toggle function
    function ToggleLint()
      lint_enabled = not lint_enabled
      if lint_enabled then
        setup_linting()
        vim.notify('nvim-lint ON', vim.log.levels.INFO)
      else
        vim.api.nvim_clear_autocmds { group = lint_augroup }
        vim.notify('nvim-lint OFF', vim.log.levels.INFO)

        -- Clear lint errors from the buffer
        vim.diagnostic.reset()
      end
    end

    -- Keymap
    vim.keymap.set('n', '<leader>ul', ToggleLint, { silent = true, noremap = true, desc = 'Toggle Linting' })
  end,
}
