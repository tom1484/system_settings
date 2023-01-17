local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- local augroup = vim.api.nvim_create_augroup("lspformatting", {})

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.astyle,
		-- formatting.clang_format.with({ extra_args = { "--indent-width", 4 } }),
		-- formatting.clang_format,
		diagnostics.eslint,
		-- completion.spell,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			-- vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()")
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end)
			-- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	group = augroup,
			-- 	buffer = bufnr,
			-- 	callback = function()
			-- 		vim.lsp.buf.format({ bufnr = bufnr })
			-- 	end,
			-- })
		end
	end,
})
