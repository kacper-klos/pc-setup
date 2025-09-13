local lsp = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "<leader>lo", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

lsp.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
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
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	formatting = cmp_format,

	mappings = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})

lsp.setup()
