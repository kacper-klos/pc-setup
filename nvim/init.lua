-- Defined in .bashrc
local base_dir = os.getenv("VIRTUAL_ENV_DIR")
if base_dir then
    vim.g.python3_venv= base_dir .. "/nvim"
    vim.g.python3_host_prog=vim.fn.expand(vim.g.python3_venv .. "/bin/python3")
end
require("remap")
require("plugins")
require("setup")
