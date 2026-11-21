vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.pack.add({
      {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1.*")
      },
      "https://github.com/mason-org/mason.nvim",
      "https://github.com/mason-org/mason-lspconfig.nvim",
      "https://github.com/neovim/nvim-lspconfig",
    })

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      cmd = (function()
        local is_windows = vim.fn.has('win32') == 1
        local gxx_path = vim.fn.systemlist((is_windows and "where g++" or "which g++"))[1] or ""
        local clangd_cmd = { "clangd" }
        if gxx_path ~= "" then
          table.insert(clangd_cmd, "--query-driver=" .. gxx_path)
        end
        return clangd_cmd
      end)(),
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
    })

    require("mason").setup()

    require("mason-lspconfig").setup {
      ensure_installed = { "clangd", "rust_analyzer", "lua_ls" },
      automatic_enable = false
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'lua',
      once = true,
      callback = function()
        vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
        require('lazydev').setup()
      end,
    })

  end
})
