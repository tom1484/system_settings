local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("lspformatting", {})

null_ls.setup({
	border = "rounded",
	sources = {
		formatting.stylua,
		formatting.astyle.with({
			filetypes = { "cpp", "c" },
		}),
		-- formatting.clang_format.with({
		--     filetypes = { "cpp" },
		-- }),
		formatting.goimports,
		formatting.gofumpt,
		formatting.prettierd.with({
			filetypes = { "html", "css", "json" },
		}),
		formatting.rustfmt,
		formatting.autopep8,
		formatting.beautysh,
		formatting.cbfmt,
		formatting.eslint_d,

		diagnostics.eslint_d.with({
			extra_args = { "--tab-width", 2 },
		}),
		-- diagnostics.cpplint,
		diagnostics.commitlint,
		diagnostics.jsonlint,
		diagnostics.staticcheck,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			-- vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()")
			vim.keymap.set("n", "<leader>vf", function()
				vim.lsp.buf.format()
				vim.cmd.w()
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
