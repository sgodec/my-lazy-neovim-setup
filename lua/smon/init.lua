print("hello Smon")
require("smon.remap")
require("smon.settings")
require("smon.lazy_init")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    require("smon.texpresso").attach()
  end,
})
