vim.schedule(function()
  vim.pack.add({
    {
      src = "https://github.com/echasnovski/mini.pairs",
      version = vim.version.range("*")
    },
  })

  require('mini.pairs').setup({})
end)
