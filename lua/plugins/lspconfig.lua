-- LSP Plugins
return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'Bilal2453/luvit-meta',
    ft = 'lua',
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            -- When you move your cursor, the highlights will be cleared (the second autocommand).
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- Creates a keymap to toggle inlay hints in your
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason').setup()

      local servers = {
        gopls = {
          -- TODO: Usikker på om dette egentlig fungerer, må ta en titt
          -- settings = {
          --   gopls = {
          --     analyses = {
          --       unusedparams = true,
          --       unreachable = true,
          --       shadow = true,
          --       nilness = true,
          --       fieldalignment = true,
          --     },
          --     staticcheck = true,
          --     usePlaceholders = true,
          --     completeUnimported = true,
          --     codelenses = {
          --       generate = true,
          --       gc_details = true,
          --       test = true,
          --       tidy = true,
          --       upgrade_dependency = true,
          --     },
          --   },
          -- },
        },
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
        kotlin_language_server = {},
        -- TODO: Oppleves som ganske sluggish, tror vi går for nvim-lint
        -- golangci_lint_ls = {
        --   settings = {
        --     default_config = {
        --       init_options = {
        --         command = { 'golangci-lint', 'run', '--output.json.path', 'stdout', '--issues-exit-code=1', '--show-stats=false' },
        --       },
        --     },
        --   },
        -- },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      local tools_ensure_installed = {
        'stylua', -- Used to format Lua code
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
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
