vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "JK", "<Esc>")
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("x", "<leader>p", "\"_dP", { noremap = true })
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { noremap = true })
vim.keymap.set("x", "<leader>s", function ()
    local prev_v_registry = vim.fn.getreg('v')
    vim.cmd('normal! "vy')
    local copied_v_registry = vim.fn.getreg('v')
    vim.fn.setreg('v', prev_v_registry)
    local formatted_line = string.format(":%%s/%s/%s/gI", vim.fn.escape(copied_v_registry, '/\\'), vim.fn.escape(copied_v_registry, '/\\'))
    vim.api.nvim_feedkeys(formatted_line .. vim.api.nvim_replace_termcodes("<Left><Left><Left>", true, false, true), 'n', true)
end)
