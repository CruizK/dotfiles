table.unpack = table.unpack or unpack

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.nobackup = true
vim.g.omni_sql_no_default_maps = 1

vim.filetype.add {
  shader = "hlsl",
  hlsl = "hlsl"
}

require("config.keymaps")
require("config.options")
require("config.autocmd")
require("config.lazy")
require("config.diagnostics")
