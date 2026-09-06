return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ -- ensure installed
      "bash",
      "c",
      "cpp",
      "css",
      "go",
      "javascript",
      "json",
      "lua",
      "powershell",
      "python",
      "rust",
      "toml",
      "yaml",
      "zsh",
    })
  end,
}
