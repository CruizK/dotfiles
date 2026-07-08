return {
  'tpope/vim-sleuth',
  'j-hui/fidget.nvim',
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
  },
  {
    "juacker/git-link.nvim",
    keys = {
      {
        "<leader>gl",
        function() require("git-link.main").copy_line_url() end,
        desc = "Copy code link to clipboard",
        mode = { "n", "x" }
      }
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  }
}
