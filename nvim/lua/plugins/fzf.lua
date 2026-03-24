return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<Leader>ff", function()
        require("fzf-lua").files({ cwd = vim.fn.getcwd() })
      end, silent = true
    },
    {
      "<Leader>fg", function()
        require("fzf-lua").git_files({})
      end, silent = true
    },
    {
      "<Leader>z", function()
        require("fzf-lua").zoxide({})
      end, silent = true
    },
    {
      "<Leader>gr", function()
        require("fzf-lua").grep({})
      end, silent = true
    }
  },
  dependencies = { "nvim-tree/nvim-web-devicons", },
  opts = function()

    local actions = require("fzf-lua").actions

    local colors = {
      pointer = "#648f90",
      spinner = "#648f90",
      info = "#afaf87", -- based on Fzf defaults: Dark256 Info (144)
      prompt = "#648f90",
      hl = "#859900"
    }

    vim.api.nvim_set_hl(0, "FzfLuaHeaderText", { fg = colors.prompt })

    return {
      actions = {
        files = {
          ["enter"] = actions.file_edit,
        }
      },
      defaults = {
        file_icons = false
      },
      files = {
        formatter = 'path.filename_first'
      },
      fzf_colors = {
        true,
        ["hl"] = colors.hl,
        ["hl+"] = colors.hl,
        ["bg+"] = "-1",
        ["pointer"] = colors.pointer,
        ["spinner"] = colors.spinner,
        ["info"] = colors.info,
        ["marker"] = colors.pointer,
        ["prompt"] = colors.prompt
      },
      fzf_opts = {
        ["--info"] = false
      },
      git = {
        files = {
          cmd = "git ls-files --exclude-standard --cached --others",
          formatter = 'path.filename_first',
          cwd_prompt = true
        }
      },
      hls = {
        border = "FloatBorder",
        preview_border = "FloatBorder"
      },
      winopts = {
        preview = {
          hidden = true,
          vertical = 'up:70%',
          scrollbar = false,
          winopts = {
            number = false
          }
        },
        height = 0.7,
        row = 0.5
      }
    }
  end
}
