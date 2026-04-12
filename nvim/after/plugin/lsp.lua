local lsp = require("lsp-zero")
local cmp = require("cmp")
local lsp_signature = require("lsp_signature")

local signature_cfg = {
    bind = true,
    floating_window = true,
    hint_enable = false,
    always_trigger = true,
    extra_trigger_chars = { "(", "," },
    handler_opts = {
        border = "rounded",
    },
}

lsp_signature.setup(signature_cfg)

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        rust = { "rustfmt" },
        javascript = { "prettier", stop_after_first = true },
        typescript = { "prettier", stop_after_first = true },
        json = { "prettier", stop_after_first = true },
        markdown = { "prettier", stop_after_first = true },
    },

    default_format_opts = {
        lsp_format = "fallback",
    },

    formatters = {
        ["clang-format"] = {
            append_args = {
                "-style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 120}",
            },
        },
    },


    format_on_save = nil, -- turn this on later if you want
    notify_on_error = true,
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }

    lsp_signature.on_attach(signature_cfg, bufnr)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>lo", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
    vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set({ "n", "x" }, "<F3>", function()
        require("conform").format({
            async = true,
            lsp_format = "fallback",
        })
    end, opts)
end)

lsp.extend_lspconfig({
    sign_text = true,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "rust_analyzer",
        "clangd",
        "lua_ls",
        "texlab",
        "jdtls",
    },
    handlers = {
        lsp.default_setup,
    },
})

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
    },
    formatting = cmp_format,
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})

require("hlargs").setup()
