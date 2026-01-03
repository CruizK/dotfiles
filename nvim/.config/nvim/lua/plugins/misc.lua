return {
  'tpope/vim-sleuth',
  'j-hui/fidget.nvim',
  {
    'github/copilot.vim',
    config = function()
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        replace_keycodes = false, expr = true
      })
      vim.g.copilot_no_tab_map = true
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end
  },
  {
    "davidmh/mdx.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  }
}
