local M = {}

--- Keymaps for LSP. Se also snacks.lua for keymaps which opens LSP information in a picker.
---@param client_id (integer) the client id
---@param bufnr (integer) Buffer handle, or 0 for current
function M.setup(client_id, bufnr)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  map('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
  map('<leader>co', function()
    vim.lsp.buf.code_action {
      -- only run the "source.organizeImports" action
      ---@diagnostic disable: missing-fields
      context = {
        only = { 'source.organizeImports' },
      },
      -- apply immediately (skip the selection window)
      apply = true,
    }
  end, '[C]ode [O]rganize Imports')
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  local client = vim.lsp.get_client_by_id(client_id)
  -- Creates a keymap to toggle inlay hints in your
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    map('<leader>uh', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })
    end, 'Toggle Inlay Hints')
  end
end

return M
