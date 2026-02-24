local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.conditions.expand").line_begin
local lb_show = function(line_to_cursor)
  return line_to_cursor == 0
end

return {
  s(
    { trig = "mplk", snippetType = "autosnippet" },
    fmta([[module://matplotlib-backend-kitty<>]], { i(0) }),
    { condition = line_begin, show_condition = lb_show }
  ),
  s(
    { trig = "base", snippetType = "autosnippet" },
    fmta(
      [[
        import os
        from pathlib import Path

        SCRATCH = Path(os.environ["SCRATCH"])
        <>
      ]],
      { i(0) }
    ),
    { condition = line_begin, show_condition = lb_show }
  ),
}
