require("mini.comment").setup()

require("jupytext").setup({
    style = "hydrogen",
    output_extension = "auto",
    force_ft = nil,
    custom_language_formatting = {},
})

require("image").setup({
  backend = "kitty", -- or "ueberzug" or "sixel"
  processor = "magick_cli", -- or "magick_rock"
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      only_render_image_at_cursor_mode = "popup", -- or "inline"
      floating_windows = false, -- if true, images will be rendered in floating markdown windows
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    asciidoc = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      only_render_image_at_cursor_mode = "popup",
      floating_windows = false,
      filetypes = { "asciidoc", "adoc" },
    },
    neorg = {
      enabled = true,
      filetypes = { "norg" },
    },
    rst = {
      enabled = true,
    },
    typst = {
      enabled = true,
      filetypes = { "typst" },
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  scale_factor = 1.0,
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})

local nn = require("notebook-navigator")
nn.setup({
  repl_provider = "molten",
  activate_hydra_keys = nil,
  syntax_highlight = true,
  cell_markers = {
    python = "# %%",
  },
})
vim.keymap.set("n", "]h", function() nn.move_cell("d") end, { desc = "Next cell" })
vim.keymap.set("n", "[h", function() nn.move_cell("u") end, { desc = "Previous cell" })
vim.keymap.set("n", "<leader>mr", function() nn.run_cell() end, { desc = "Run current cell" })
vim.keymap.set("n", "<leader>mn", function() nn.run_and_move() end, { desc = "Run cell and move" })

-- molten setup

vim.g.molten_image_provider = "image.nvim"
vim.g.molten_virt_text_output = true
vim.g.molten_virt_text_max_lines = 6
vim.g.molten_image_location = "both"
vim.g.molten_wrap_output = true
vim.g.molten_output_virt_lines = true
vim.g.molten_enter_output_behavior = "open_and_enter"
vim.g.molten_output_win_max_height = 30

vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "Evaluate operator" })
vim.keymap.set("n", "<leader>mrl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line" })
vim.keymap.set("n", "<leader>mrr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell" })
vim.keymap.set("v", "<leader>mr", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "Evaluate visual selection" })
vim.keymap.set("n", "<leader>mrd", ":MoltenDelete<CR>", { silent = true, desc = "Delete cell" })
vim.keymap.set("n", "<leader>mos", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "Show/enter output" })
vim.keymap.set("n", "<leader>moh", ":MoltenHideOutput<CR>", { silent = true, desc = "Hide output" })
vim.keymap.set("n", "<leader>mrs", ":MoltenRestart<CR>", { silent = true, desc = "Restart kernel" })
vim.keymap.set("n", "<leader>mi", function ()
    local venv = os.getenv("VIRTUAL_ENV_DIR")
    if venv ~= nil or vim.fn.isdirectory(venv) ~= 1 then
        local full_path = vim.fn.getcwd()
        local folder_name = full_path:match("^.+/(.+)$") or full_path:match("^.+\\(.+)$") or full_path
        local new_venv = vim.fs.joinpath(venv, folder_name)
        local python_bin = vim.fs.joinpath(new_venv, "bin", "python3")
        if vim.fn.isdirectory(new_venv) == 1 then
            vim.cmd(("MoltenInit %s"):format(folder_name))
            return
        end
        -- Create venv
        local cmd_create_venv = string.format(
            "uv venv --seed %s && " ..
            "uv pip install ipykernel pynvim --python %s && " ..
            "uv run --python %s -- python -m ipykernel install --user --name=%s --display-name='%s'",
            new_venv, new_venv, new_venv, folder_name, folder_name
        )
        -- Run async
        vim.system({ "bash", "-c", cmd_create_venv }, { text = true }, function(obj)
            vim.schedule(function() -- Jump back to the main thread to interact with Nvim
                if obj.code == 0 then
                    print("Environment ready! Initializing Molten...")
                    vim.cmd(("MoltenInit %s"):format(folder_name))
                else
                    vim.notify("Error setting up venv: " .. (obj.stderr or "unknown error"), vim.log.levels.ERROR)
                end
            end)
        end)
    else
        vim.notify("The virtual environment dir could not been found, VIRTUAL_ENV_DIR variable is not set", vim.log.levels.ERROR)
    end
end, { silent = true, desc = "Create a venv and initialize Molten" })

