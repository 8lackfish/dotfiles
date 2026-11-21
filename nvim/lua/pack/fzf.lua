vim.schedule(function()
  vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/ibhagwan/fzf-lua"
  })

  local actions = require("fzf-lua").actions

  local colors = {
    pointer = "#648f90",
    spinner = "#648f90",
    info = "#afaf87", -- based on Fzf defaults: Dark256 Info (144)
    prompt = "#648f90",
    hl = "#859900"
  }

  vim.api.nvim_set_hl(0, "FzfLuaHeaderText", { fg = colors.prompt })

  require('fzf-lua').setup({

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

  })

  local function map(lhs, fn)
    vim.keymap.set('n', lhs, fn, { silent = true })
  end

  map("<Leader>ff", function()
    require('fzf-lua').files({ cwd = vim.fn.getcwd() })
  end)

  map("<Leader>fg", function()
    require('fzf-lua').git_files({})
  end)

  map("<Leader>fj", function()
    local cmd = (vim.fn.executable("fd") == 1) -- fd|find
    and "fd --type d --hidden --exclude .git --exclude .jj"
    or "find -type d \\( -name .git -o -name .jj \\) -prune -o -type d -print"

    require('fzf-lua').files({
      fzf_args = "--no-multi",
      formatter = 'path.dirname_first',
      cmd = cmd,
      cwd = vim.fn.getcwd(),
      absolute_path = true,
      actions = {
        ["enter"] = function(dir)
          if dir then
            vim.cmd.cd(dir[1])
          end
        end,
      },
    })
  end)

  map("<Leader>z", function()
    require('fzf-lua').zoxide({})
  end)

  map("<Leader>gr", function()
    require('fzf-lua').grep({})
  end)

end)
