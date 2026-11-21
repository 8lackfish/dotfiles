vim.api.nvim_create_autocmd('BufReadPre', {
  once = true,
  callback = function()
    vim.pack.add({ "https://github.com/echasnovski/mini.diff" })

    require('mini.diff').setup({
      view = {
        signs = {
          add = ' ▎',
          change = ' ▎',
          delete = ' ▎',
        },
      },
      mappings = {
        apply = 'gA',
      },
    })

    vim.keymap.set('n', '<Leader>D', function()
      require('mini.diff').toggle_overlay()
    end, { silent = true })

  end,
})
