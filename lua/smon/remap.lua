vim.g.mapleader = " "
vim.keymap.set("n", "<leader>l", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", function() vim.cmd("w!") end)
vim.keymap.set("n", "<leader>q", function() vim.cmd("q!") end)
--move block down or up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--line down up
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")

--join
vim.keymap.set("n", "J", "mzJ`z")
--move 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--next and prev search and move
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
--frees bulshit command
vim.keymap.set("n", "Q", "<nop>")

--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

--Vimtex remaps
vim.api.nvim_set_keymap('n', '<leader>tc', ':VimtexClean<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tw', ':VimtexView<CR>', { noremap = true, silent = true })




