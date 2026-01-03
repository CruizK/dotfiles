return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  config = function()
    local ls = require("luasnip")
    vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.expand_or_jump() end, { silent = true })

    local path = vim.fn.stdpath("config") .. "/lua/snippets"

    vim.keymap.set("n", "<leader>ls", function()
      require("luasnip.loaders.from_lua").load({ paths = path })
    end, { desc = "Reload snippets" })

    require("luasnip.loaders.from_lua").load({ paths = path })
  end
}
