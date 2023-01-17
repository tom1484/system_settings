local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})

vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- vim.keymap.set('n', '<leader>f', function()
--     builtin.current_buffer_fuzzy_find(themes.get_dropdown({
--         winblend = 10,
--         previewer = false,
--     }))
-- end, { desc = '[/] Fuzzily search in current buffer]' })
