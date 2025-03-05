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
local conds = require("luasnip.extras.expand_conditions")

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- mathzone check via vimtex
local function math()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

-- generating function for matrixes
--local mat = function(args, snip)
--  local rows = tonumber(snip.captures[2])
--  local cols = tonumber(snip.captures[3])
--  local nodes = {}
--  local ins_indx = 1
--  for j = 1, rows do
--    table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
--    ins_indx = ins_indx + 1
--    for k = 2, cols do
--      table.insert(nodes, t(" & "))
--      table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
--      ins_indx = ins_indx + 1
--    end
--    table.insert(nodes, t({ " \\\\", "" }))
--  end
--  -- fix last node.
--  nodes[#nodes] = t(" \\\\")
--  return sn(nil, nodes)
--end

return {
  s(
    { trig = "([%a%)%]%}])_", dscr = "", priority = 100, snippetType = "autosnippet", regTrig = true, wordTrig = false },
    fmta([[<>_{<>}<>]], { f(function(_, snip)
      return snip.captures[1]
    end), i(1), i(0) }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "dint", dscr = "definite integral", priority = 100, snippetType = "autosnippet", wordTrig = true },
    fmta([[\int_{<>}^{<>} <> \,\mathrm{d} <>]], { i(1), i(2), i(3), i(4, "x") }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "ddx", dscr = "derivative", priority = 100, snippetType = "autosnippet", wordTrig = true },
    fmta([[\frac{\mathrm{d}<>}{\mathrm{d}<>}<>]], { i(1, "y"), i(2, "x"), i(0) }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "pdx", dscr = "partial derivative", priority = 100, snippetType = "autosnippet", wordTrig = true },
    fmta([[\frac{\partial<>}{\partial<>}<>]], { i(1, "y"), i(2, "x"), i(0) }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "ddt", dscr = "derivative", priority = 100, snippetType = "autosnippet", wordTrig = true },
    fmta([[\frac{\mathrm{d}<>}{\mathrm{d}<>}<>]], { i(1, "x"), i(2, "t"), i(0) }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "bf", dscr = "math bold", priority = 100, snippetType = "autosnippet", wordTrig = true },
    fmta([[\mathbf{<>}<>]], { i(1), i(0) }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "rm", dscr = "math roman", priority = 100, snippetType = "autosnippet", wordTrig = true },
    fmta([[\mathrm{<>}<>]], { i(1), i(0) }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "oint", dscr = "closed integral", priority = 100, snippetType = "autosnippet", wordTrig = true },
    fmta([[\oint_{<>}^{<>} <> \,\mathrm{d} <>]], { i(1), i(2), i(3), i(4, "x") }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "int", dscr = " integral", priority = 100, snippetType = "autosnippet", wordTrig = true },
    fmta([[\int <> \,\mathrm{d} <>]], { i(1), i(2, "x") }),
    { condition = math, show_condition = math }
  ),
  s(
    { trig = "df", snippetType = "autosnippet", wordTrig = false },
    { t("\\mathrm{d}") },
    { condition = math, show_condition = math }
  ),

  --s(
  --  {
  --    trig = "([bBpvV])mat(%d+)x(%d+)([ar])",
  --    regTrig = true,
  --    name = "matrix",
  --    dscr = "matrix trigger lets go",
  --    hidden = true,
  --    priority = 100,
  --  },
  --  fmt(
  --    [[
  --  \begin{<>}<>
  --  <>
  --  \end{<>}]],
  --    {
  --      f(function(_, snip)
  --        return snip.captures[1] .. "matrix" -- captures matrix type
  --      end),
  --      f(function(_, snip)
  --        if snip.captures[4] == "a" then
  --          out = string.rep("c", tonumber(snip.captures[3]) - 1) -- array for augment
  --          return "[" .. out .. "|c]"
  --        end
  --        return "" -- otherwise return nothing
  --      end),
  --      d(1, mat),
  --      f(function(_, snip)
  --        return snip.captures[1] .. "matrix" -- i think i could probably use a repeat node but whatever
  --      end),
  --    },
  --    { delimiters = "<>" }
  --  ),
  --  { condition = math, show_condition = math }
  --),
}
