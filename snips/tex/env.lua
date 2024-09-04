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
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- mathzone check via vimtex
local function math()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local function not_math()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

local function not_math_begin_line()
  return not_math() and line_begin()
end

return {
  s(
    { trig = "fig", dscr = "Figure environment", snippetType = "autosnippet" },
    fmta(
      [[
          \begin{figure}[htpb]
            \centering
            \includegraphics[width=\columnwidth]{<>}
            \caption{<>}
            \label{fig:<>}
          \end{figure}
          <>
    ]],
      { i(1), i(2), i(3), i(0) }
    ),
    { condition = line_begin, show_condition = line_begin }
  ),
  s(
    { trig = "rrf", dscr = "ref", snippetType = "autosnippet" },
    fmta([[\ref{<>}<>]], { i(1), i(0) }),
    { condition = not_math, show_condition = not_math }
  ),
}
