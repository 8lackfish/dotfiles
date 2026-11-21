vim.api.nvim_create_autocmd('CmdUndefined', {
  pattern = { "TodoLocList", "TodoQuickFix" },
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/folke/todo-comments.nvim",
    })

    require('todo-comments').setup({
      -- NOTE: ripgrep and plenary.nvim are used for searching
      keywords = {
        ISSUES = {
          icon = " ",
          color = "warning",
          alt = { "ISS" },
        },
        LOG = {
          icon = " ",
          color = "info",
        },
      },
    })

  end
})

-- get todo list
vim.keymap.set('n', '<Leader>to', function()
  local input_mode = vim.fn.input("'w' to scan the git worktree, 'r' to scan recursively: ", "w")
  if input_mode ~= 'w' and input_mode ~= 'r' then return end
  local kw = vim.fn.input("Input todo keywords or press 󱊷 |⏎ to skip and get all: ", "")
  local dev_null = vim.fn.has("win32") == 1 and "nul" or "/dev/null"
  local cwd = input_mode == 'r' and "" or
  vim.fn.system("git rev-parse --show-toplevel 2>" .. dev_null):gsub("\n", "")
  if input_mode == 'w' and cwd == "" then return end
  vim.cmd("TodoQuickFix cwd=" .. cwd .. " keywords=" .. string.upper(kw))
end)
