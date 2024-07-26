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

return {
  s(
    { trig = "template", dscr = "Standard article template" },
    fmta(
      [[
        \documentclass[a4paper]{article}

        \usepackage{inputenc}
        \usepackage{fontenc}
        \usepackage{textcomp}
        \usepackage{amsmath, amssymb}
        \usepackage{graphicx}
        \usepackage{geometry}
        \usepackage{hyperref}
        \usepackage{siunitx}


        \geometry{margin=2in}
        \graphicspath{{./figs/}}

        \title{<>}
        \author{<>}

        \begin{document}
        \maketitle
        \section{<>}
        <>
        \end{document}
  ]],
      { i(1), i(2), i(3), i(0) }
    )
  ),
  s(
    { trig = "template", dscr = "Standard article template" },
    fmta(
      [[
        \documentclass[a4paper,10pt,twocolumn]{article}

        \usepackage{inputenc}
        \usepackage{booktabs,supertabular}
        \usepackage{float}
        \usepackage{fontenc}
        \usepackage{textcomp}
        \usepackage{amsmath, amssymb}
        \usepackage{graphicx}
        \usepackage[width = 18cm,height = 22cm,columnsep = 1cm,margin = 2cm]{geometry}
        \usepackage[backend=biber,style=authoryear,uniquelist=false]{biblatex}
        \usepackage{hyperref}
        \usepackage{siunitx}
        \usepackage[toc,page]{appendix}
        \hypersetup{
          colorlinks=true,
          linkcolor=blue,
          citecolor=blue,
          urlcolor=cyan,
          pdftitle={<>},
        }


        %\usepackage{aas_macros}
        \bibliography{./bibliography.bib}
        \graphicspath{{./figs/}}

        \title{<>}
        \author{<>}

        \begin{document}
        \twocolumn[
          \begin{@twocolumnfalse}
            \maketitle
            \begin{abstract}
            <>
            \end{abstract}
            % add spaces as necessary
            $\,$
            %$\,$
          \end{@twocolumnfalse}]
          <>
        \end{document}
  ]],
      { i(1), rep(1), i(2), i(3), i(0) }
    )
  ),
  s(
    { trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
    fmta([[\href{<>}{<>}]], {
      i(1, "url"),
      i(2, "display name"),
    })
  ),
  s(
    { trig = "sec", dscr = "Top-level section" },
    fmta(
      [[
        \section{<>}
        <>
        ]],
      { i(1), i(0) }
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),
  s(
    { trig = "sub", dscr = "Subsection" },
    fmta(
      [[\subsection{<>}
    <>]],
      { i(1), i(0) }
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),
}
