vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.foldenable = true
--vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "indent"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.laststatus = 2

vim.opt.statusline = table.concat({
    "%#PmenuSel#",            -- Highlight group (depends on your colorscheme)
    " ▶ %F",                  -- Full path to file
    "%=",                     -- Right align the following
    "[%{&filetype}]",         -- Filetype in brackets
    " %m",                    -- Modified flag
    " %{strftime('%H:%M')}",  -- Current time
})
