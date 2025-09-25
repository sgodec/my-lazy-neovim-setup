return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    event = "InsertEnter",
    config = function()
        local ls = require("luasnip")

        require("luasnip.loaders.from_lua").lazy_load({
            paths = "./lua/smon/luasnip/"
        })

        ls.setup({
            update_events = { "TextChanged", "TextChangedI" },
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
        })

        -- ⬇️ Dynamic <Tab> for expand or jump
        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            else
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
                    "n", true
                )
            end
        end, { silent = true, desc = "Expand or jump in snippet" })

        -- ⬇️ Shift-Tab for jumping backwards
        vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            else
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true),
                    "n", true
                )
            end
        end, { silent = true, desc = "Jump to previous snippet field" })
    end
}
