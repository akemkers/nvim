local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt

-- Lua snippets
ls.add_snippets('lua', {
  s('func', fmt('local function {}({})\n  {}\nend', { i(1, 'name'), i(2, 'args'), i(3, '-- body') })),
  s('print', fmt('print("{}")', { i(1, 'text') })),
})

--  React snippets
ls.add_snippets('typescriptreact', {
  s(
    'rfc',
    fmt(
      [[
type Props = {{
    {}: string
}}

export const {}: React.FC<Props> = ({{ {} }}) => {{
    
}}
]],
      {
        i(2, 'param'), -- Placeholder for the parameter (appears second, but will be mirrored below)
        i(1, 'ComponentName'), -- Placeholder for the component name (appears first)
        rep(2), -- Repeats the `param` placeholder
      }
    )
  ),
})

ls.add_snippets('typescriptreact', {
  s(
    'rfcnp',
    fmt(
      [[
export const {}: React.FC = () => {{
    
}}
]],
      {
        i(1, 'ComponentName'), -- Placeholder for the component name
      }
    )
  ),
})

-- Load your snippets
ls.filetype_extend('all', {})
