return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nushell = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opt = {},
    dependencies = {
      -- NOTE: additional parser
      { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
  },
}
