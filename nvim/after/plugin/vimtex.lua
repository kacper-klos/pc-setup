vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
vim.g.vimtex_compiler_method = 'latexmk'

vim.g.vimtex_compiler_latexmk = {
    build_dir = 'latex_build',
    options = {
        '-auxdir=latex_build',
        '-pdf',
        '-interaction=nonstopmode'
    },
}


vim.g.vimtex_mappings_enabled = 0

vim.api.nvim_set_keymap('n', '<leader>lc', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexView<CR>', { noremap = true, silent = true })
