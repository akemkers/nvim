local M = {}

function M.setup()
  require('lsp.attach').setup()
  require('mason').setup()

  local capabilities = require 'lsp.capabilities'

  local servers = {
    gopls = {},
    html = {},
    cssls = {
      settings = {
        css = {
          lint = {
            unknownAtRules = 'ignore', -- to avoid tailwindcss warnings
          },
        },
      },
    },
    bashls = {},
    jsonls = {},
    tailwindcss = {
      settings = {
        classAttributes = { 'class', 'className', 'classNames', 'clsx', 'cva' },
      },
    },
    lua_ls = {
      settings = {
        Lua = {
          -- This is what makes it possible to tab through prefilled function parameters
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    },
    rust_analyzer = {},
    kotlin_language_server = {},
  }

  local ensure_installed = vim.tbl_keys(servers or {})
  local tools_ensure_installed = {
    'stylua',
    'prettier',
    'ktfmt',
    'eslint_d',
    --'golangci_lint', TODO: Kjører manuell installasjon av eldre versjon frem til nvim.lint er oppdatert med v2 av golangci_lint
  }

  require('mason-tool-installer').setup { ensure_installed = tools_ensure_installed, automatic_installation = true }

  require('mason-lspconfig').setup {
    ensure_installed = ensure_installed,
    automatic_installation = true,
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
  }
end

return M
