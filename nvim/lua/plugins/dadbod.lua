return {
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "vim-dadbod-completion" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "vim-dadbod-completion" })
    end,
  },
}
