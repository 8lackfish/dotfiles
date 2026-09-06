-- g++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.keymap.set("n", "<F5>", "<Cmd>w<Bar>!g++ -I ./libs -std=c++20 -g -Wall *." .. vim.bo.filetype .. " -o main<CR>")
  end
})

-- zoxide
if vim.fn.executable("zoxide") == 1 then
  vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
      vim.fn.system({ "zoxide", "add", vim.fn.getcwd() })
    end,
  })
end

-- treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if vim.treesitter.language.add(lang) then
      vim.treesitter.start(args.buf, lang)
    end
  end,
})

-- opts
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    vim.opt.showmode = false
  end
})
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt.formatoptions:remove({ "r", "o" })
  end
})
