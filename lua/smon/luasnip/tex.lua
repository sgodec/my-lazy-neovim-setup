require('texpresso').attach()
local autocmd = vim.api.nvim_create_autocmd
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

autocmd({"InsertLeave"},{
    group = vim.api.nvim_create_augroup('texpressoGroup',{}),
    callback = function()
        vim.cmd("TeXpressoSync")
    end
    })

local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

return{

    s({trig="fig", snippetType="snippet", dscr="A basic figure environment"},
        fmta(
            [[
        \begin{figure}
        \centering
        \includegraphics[width=0.9\linewidth]{<>}
        \caption{
            \textbf{<>}
            <>
            }
        \label{fig:<>}
        \end{figure}

        ]],
            { i(1,"filename"),
                i(2, "captionBold"),
                i(3, "captionText"),
                i(4,"figureLabel"),}
        )
    ),

    s({ trig = "zapiski", snippetType = "snippet", dscr = "Zapiski LaTeX document with fixed author" },
      fmta([[
    \documentclass{article}
    \usepackage{amsmath}
    \usepackage{hyperref}
    \usepackage[dvipsnames]{xcolor}   
    \usepackage[utf8]{inputenc}
    \usepackage{geometry}
     \geometry{
     a4paper,
     total={170mm,257mm},
     left=20mm,
     top=20mm,
     }
    \usepackage{graphicx}
    \usepackage{titling}

    \title{<>}
    \author{Simon Godec}
    \date{\today}

    \usepackage{fancyhdr}
    \fancypagestyle{plain}{%
        \fancyhf{} 
        \fancyfoot[R]{\includegraphics[width=4cm]{}}
        \fancyfoot[L]{\thedate}
        \fancyhead[L]{<>}
        \fancyhead[R]{\theauthor}
    }
    \makeatletter
    \def\@maketitle{%
      \newpage
      \null
      \vskip 1em%
      \begin{center}%
      \let \footnote \thanks
        {\LARGE \@title \par}%
        \vskip 1em%
      \end{center}%
      \par
      \vskip 1em}
    \makeatother

    \usepackage{cmbright}

    \begin{document}

    \maketitle

    \noindent\begin{tabular}{@{}ll}
        Študent & Simon Godec \ 282420202\\
        Mentor & <> \\
        Kontakt & \href{mailto:sg74586@student.uni-lj.si}{\texttt{{\color{purple}sg74586@student.uni-lj.si}}}\\
    \end{tabular}

    \section*{Uvod}

    \end{document}
      ]],
      {
        i(1),
        rep(1),
        i(2),
    }
        )
    ),

    s({trig="env", snippetType="snippet", dscr="Begin and end an arbitrary environment"},
        fmta(
            [[
        \begin{<>}
            <>
        \end{<>}
        ]],
            {i(1),i(2),rep(1),}
        )
    ),

    s({trig="lbl", dscr="Label"},
        fmta(
            [[
        \label{<>}
        ]],
            { i(1, "label_name") }
        )
    ),

    s({trig="ref", dscr="Reference"},
        fmta(
            [[
        \ref{<>}
        ]],
            { i(1, "label_name") }
        )
    ),

    s({trig="thm", dscr="Theorem environment"},
        fmta(
            [[
        \begin{theorem}[<>]
            <>
        \end{theorem}
        ]],
            { i(1, "Optional name"), i(2) }
        )
    ),

    s({trig="proof", dscr="Proof environment"},
        fmta(
            [[
        \begin{proof}
            <>
        \end{proof}
        ]],
            { i(1) }
        )
    ),

    s({trig="sec", dscr="Section"},
        fmta(
            [[
        \section{<>}
        <>]],
            { i(1, "Section title"), i(0) }
        )
    ),
    s({trig="ssec", dscr="Subsection"},
        fmta(
            [[
        \subsection{<>}
        <>]],
            { i(1, "Subsection title"), i(0) }
        )
    ),
    s({trig="sssec", dscr="Subsubsection"},
        fmta(
            [[
        \subsubsection{<>}
        <>]],
            { i(1, "Subsubsection title"), i(0) }
        )
    ),

    s({trig="itemize", dscr="Itemize environment"},
        fmta(
            [[
        \begin{itemize}
            \item <>
            \item <>
        \end{itemize}
        ]],
            { i(1), i(2) }
        )
    ),
    s({trig="enum", dscr="Enumerate environment"},
        fmta(
            [[
        \begin{enumerate}
            \item <>
            \item <>
        \end{enumerate}
        ]],
            { i(1), i(2) }
        )
    ),

    s({trig="frac", dscr="Fraction"},
        fmta(
            [[
        \frac{<>}{<>}
        ]],
            { i(1), i(2) }
        )
    ),

    s({trig="diff", dscr="Derivative"},
        fmta(
            [[
        \frac{d<>}{d<>}
        ]],
            { i(1), i(2) }
        )
    ),

    s({trig="sum", dscr="Sum with limits"},
        fmta(
            [[
        \sum_{<>}^{<>}
        ]],
            { i(1, "i=1"), i(2, "n") }
        )
    ),

    s("int", fmta([[
    \int_{<>}^{<>} <> \ \mathrm{d} <>
  ]], {
            i(1, "-\\infty"),
            i(2, "\\infty"),
            i(3, "f(x)"),
            i(4, "x"),
        })),

    s("pder", fmta([[
    \frac{\partial <>}{\partial <>}
  ]], {
            i(1, "f"),
            i(2, "x"),
        })),

    postfix(
        {
            trig = "hat",
            match_pattern = [[[\\%w%.%_%-%"%']+$]],
            snippetType = "autosnippet",
            dscr = "postfix hat when in math mode",
        },
        {
            t("\\hat{"),
            f(function(_, snip) return snip.env.POSTFIX_MATCH end),
            t("}"),
        },
        { condition = math }
    ),

    postfix(
        {
            trig = "bf",
            match_pattern = [[[\\%w%.%_%-%"%']+$]],
            snippetType = "autosnippet",
            dscr = "mathbf mode",
        },
        {
            t("\\mathbf{"),
            f(function(_, snip) return snip.env.POSTFIX_MATCH end),
            t("}"),
        },
        { condition = math }
    ),

    postfix(
        {
            trig = "rm",
            match_pattern = [[[\\%w%.%_%-%"%']+$]],
            snippetType = "autosnippet",
            dscr = "mathrm mode",
        },
        {
            t("\\mathrm{"),
            f(function(_, snip) return snip.env.POSTFIX_MATCH end),
            t("}"),
        },
        { condition = math }
    ),

}
