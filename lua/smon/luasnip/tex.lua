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

    --postfixes for vectors, hats, etc. The match pattern is '\\' plus the default (so that hats get put on greek letters,e.g.)
    postfix({trig="hat", match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType="autosnippet",dscr="postfix hat when in math mode"},
        {l("\\hat{" .. l.POSTFIX_MATCH .. "}")}, 
        { condition=math }
    ) ,
    postfix({trig="vec", match_pattern = [[[\\%w%.%_%-%"%']+$]] ,snippetType="autosnippet",dscr="postfix vec when in math mode"},
        {l("\\vec{" .. l.POSTFIX_MATCH .. "}")}, 
        { condition=math }
    ),
    s({trig=";I",snippetType="autosnippet",desc="integral with infinite or inserted limits",wordTrig=false},
    fmta([[
        <>
        ]],
        {
        c(1,{
            t("\\int_{-\\infty}^\\infty"),
            sn(nil,fmta([[ \int_{<>}^{<>} ]],{i(1),i(2)})),
            })
        }
    )
),
}
