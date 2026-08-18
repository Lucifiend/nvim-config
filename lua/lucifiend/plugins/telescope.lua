return {
	'nvim-telescope/telescope.nvim',
	tag = 'v0.2.1',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope list keymaps' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope list diagnostics' })
		vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Telescope list old/recent files' })
		vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Telescope list commands' })
		vim.keymap.set({'n', 'v'}, '<leader>fw', builtin.grep_string, { desc = 'Telescope search current word' })
	vim.keymap.set('n', '<leader>fn', function() builtin.find_files { cwd = vim.fn.stdpath 'config', follow = true } end, { desc = '[F]ind [N]eovim files' })
	end
}
