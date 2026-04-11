local ts = require("nvim-treesitter")

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
  "bash",
  "c",
  "cpp",
  "rust",
  "lua",
  "python",
  "javascript",
  "typescript",
  "make",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "sh",
    "bash",
    "c",
    "cpp",
    "lua",
    "python",
    "javascript",
    "typescript",
    "rust",
    "make",
  },
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})
