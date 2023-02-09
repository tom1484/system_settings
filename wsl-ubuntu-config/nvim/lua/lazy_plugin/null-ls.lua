local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("lspformatting", {})

null_ls.setup({
	border = "rounded",
	sources = {
		formatting.clang_format.with({
			extra_args = {
				"--style", "{BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 100}",
			},
		}),
		formatting.autopep8,
		formatting.beautysh,
		formatting.cbfmt,
		formatting.eslint_d,
		formatting.gofumpt,
		formatting.goimports,
		formatting.prettierd.with({
			filetypes = { "html", "css", "json" },
		}),
		formatting.rustfmt,
		formatting.shfmt,
		formatting.stylua,
		formatting.jq,

		diagnostics.commitlint,
		diagnostics.jsonlint,
		diagnostics.staticcheck,
	},
	-- on_attach = function(client, bufnr)
	-- 	if client.supports_method("textDocument/formatting") then
	-- 		vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()")
	-- 		vim.keymap.set("n", "<leader>vf", function()
	-- 			vim.lsp.buf.format()
	-- 			vim.cmd.w()
	-- 		end)
	-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 		vim.api.nvim_create_autocmd("BufWritePre", {
	-- 			group = augroup,
	-- 			buffer = bufnr,
	-- 			callback = function()
	-- 				vim.lsp.buf.format({ bufnr = bufnr })
	-- 			end,
	-- 		})
	-- 	end
	-- end,
})
