vim.pack.add({ "https://github.com/8lackfish/bufline.nvim" })

require('bufline').setup({
  highlights = {
    normal = 'lualine_b_normal',
    focused = 'lualine_a_insert'
  }
})
