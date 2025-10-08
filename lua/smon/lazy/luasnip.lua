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
        })

        vim.keymap.set({ "i", "s" }, "<Tab>", function()
          local ls = require("luasnip")
          if ls.expandable() then
            ls.expand()
          else
            vim.api.nvim_feedkeys( vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true )
          end
        end, { silent = true, desc = "Expand or jump in snippet" })         

        vim.keymap.set({ "i", "s" }, "<C-l>", function()
          local ls = require("luasnip")
          if ls.jumpable(1) then
            ls.jump(1)
            return  -- stop here if jumped
          end
          -- fallback if not jumpable
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<C-l>", true, false, true),
            "i",
            true
          )
        end, { silent = true, desc = "Jump to previous snippet field" })

    end
}
