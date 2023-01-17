vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

local tab_ft = { "go", "make" }
local find_ft = function(ft)
	for _, v in pairs(tab_ft) do
		if v == ft then
			return true
		end
	end
	return false
end
if find_ft(vim.opt.filetype._value) then
	vim.opt.expandtab = false
else
	vim.opt.expandtab = true
end

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.opt.formatoptions:remove({ "c", "r", "o" })
