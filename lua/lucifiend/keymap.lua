vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", "<CMD>Oil<CR>", { desc = "Exit to Oil" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source file" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' }) 
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function() vim.hl.on_yank() end,
})
