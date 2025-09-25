local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "smon.lazy",
	-- your plugins go here, e.g.
	"nvim-treesitter/nvim-treesitter",
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',           -- you can also use branch = '0.1.x'
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

})
