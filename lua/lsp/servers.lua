return {
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
