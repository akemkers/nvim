local M = {}

function M.setup()
  require('mason').setup()

  local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

  vim.lsp.config('*', {
    capabilities = capabilities,
    on_attach = require('lsp.attach').on_attach,
  })

  local servers = require 'lsp.servers'
  local tools = require 'lsp.tools'

  local server_names = vim.tbl_keys(servers or {})
  local ensure_installed = vim.list_extend(vim.deepcopy(server_names), tools)

  require('mason-tool-installer').setup {
    ensure_installed = ensure_installed,
    automatic_installation = true,
  }

  for _, server_name in ipairs(server_names) do
    vim.lsp.config(server_name, servers[server_name])
    vim.lsp.enable(server_name)
  end
end

return M
