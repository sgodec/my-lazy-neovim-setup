local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
    s({
        trig = "start",
        wordTrig = true,
        snippetType = "snippet",
        desc = "preload jl setup"
    }, {
        t({
      "using Random:default_rng, seed!",
      "using LaTeXStrings",
      "using CairoMakie",
      "using ProgressMeter",
      "using LinearAlgebra",
      "",
      "MT = Makie.MathTeXEngine",
      "mt_fonts_dir = joinpath(dirname(pathof(MT)), \"..\", \"assets\", \"fonts\", \"NewComputerModern\")",
      "",
      "set_theme!(fonts = (",
      "regular = joinpath(mt_fonts_dir, \"NewCM10-Regular.otf\"),",
      "bold = joinpath(mt_fonts_dir, \"NewCM10-Bold.otf\")",
      ") )"
    })
  }),

    s({
        trig = "fig",
        wordTrig = true,
        snippetType = "snippet",
        desc = "julia fig"
    }, {
            t({
                "fig = Figure(size = (400 ,400))",
                "ax = [",
                "    Axis(fig[1,i], ",
                "         width = 350, ",
                "         height = 350,",
                "         xticklabelsize = 16,",
                "         yticklabelsize = 16,",
                "         xlabelsize = 20,",
                "         ylabelsize = 20,",
                "         titlesize = 22) for i in 1:1",
                "]",
                "",
                "for a in ax",
                "    a.xgridvisible = true",
                "    a.ygridvisible = true",
                "    a.xgridstyle = :dash",
                "    a.ygridstyle = :dash",
                "    a.xminorgridvisible = true",
                "    a.yminorgridvisible = true",
                "    a.xminorticksvisible = true",
                "    a.yminorticksvisible = true",
                "end",
            }),
        })

}

