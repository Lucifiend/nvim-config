return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ "folke/lazydev.nvim",               ft = "lua", opts = {} },
			{ "williamboman/mason.nvim",          opts = {} },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					-- Check if server supports formatting, and set up the write hooks
					if client:supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							group = vim.api.nvim_create_augroup('my.lsp.format', { clear = false }),
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
							end,
						})
					end
				end,
			})

			local servers = { 'lua_ls', 'rust_analyzer', 'clangd', 'tinymist', 'pyright' }

			require('mason-lspconfig').setup({
				ensure_installed = servers,
				handlers = {
					function(server_name)
						vim.lsp.enable(server_name)
					end,
				},
			})
		end,
	}
}
