local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
    s({
        trig = "%(",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "faster ()"
    }, {
            t("("),
            i(1), 
            t(") "),
            i(0),
        }),
    
    s({
        trig = "%[",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "faster []"
    }, {
            t("["),
            i(1), 
            t("] "),
            i(0),
        }),

    s({
        trig = "%{",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "faster {}"
    }, {
            t("{"),
            i(1), 
            t("} "),
            i(0),
        }),

    s({
        trig = "c",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "slovene c"
    }, {
            t("č")
        }),
    
    s({
        trig = "s",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "slovene s"
    }, {
            t("š")
        }),

    s({
        trig = "z",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "slovene s"
    }, {
            t("ž")
        }),

    s({
        trig = "C",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "slovene C"
    }, {
            t("Č")
        }),
    
    s({
        trig = "S",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "slovene S"
    }, {
            t("Š")
        }),

    s({
        trig = "Z",
        regTrig = true,
        wordTrig = false,
        snippetType = "snippet",
        desc = "slovene Z"
    }, {
            t("Ž")
        }),
}

