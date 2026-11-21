vim.schedule(function()
  vim.pack.add({ "https://github.com/8lackfish/ccute.nvim" })

  require('ccute').setup({
    lazy = true
  })

end)
