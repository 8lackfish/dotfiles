return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  config = function()
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      win_split_mode = 'vertical',
      org_log_done = false,
      org_log_repeat = false,

      org_capture_templates = {
        t = {
          template = '* TODO %?\n',
          properties = {
            empty_lines = {
              before = 1,
              after = 1,
            },
          },
        },
      },

      mappings = {
        capture = {
          org_capture_kill = "<Leader>ock",
        },
      },

      org_todo_keywords = {
        "BACKLOG",
        "TODO",
        "DOING",
        "|",
        "DONE",
      },
      org_todo_keyword_faces = {
        BACKLOG = ":foreground #994B38",
        DOING = ":foreground #76BEB6 :underline on",
        TODO = ":foreground #76BEB6",
      },
      org_agenda_custom_commands = {
        B = {
          description = "BACKLOG entry",
          types = {
            {
              type = 'tags_todo',
              match = '/BACKLOG',
            },
          },
        },
        T = {
          description = 'TODO entry',
          types = {
            {
              type = 'tags_todo',
              match = '/TODO',
            },
          },
        },
        I = {
          description = 'DOING entry',
          types = {
            {
              type = 'tags_todo',
              match = '/DOING',
            },
          },
        },
        D = {
          description = 'DONE entry',
          types = {
            {
              type = 'tags',
              match = '/DONE',
            },
          },
        },
      },
    })

    vim.lsp.enable('org')

    if vim.tbl_contains(vim.v.argv, "orgmode") then -- nvim -- orgmode
      vim.schedule(function()
        vim.cmd("Org agenda t")
      end)
    end

    vim.api.nvim_set_hl(0, '@org.priority.highest', { fg = "#d01b24", })
    vim.api.nvim_set_hl(0, '@org.priority.default', { fg = "#a57705", })
    vim.api.nvim_set_hl(0, '@org.priority.lowest', { fg = "#728905", })

    local org_ns = vim.api.nvim_create_namespace("org")

    vim.api.nvim_set_hl(org_ns, "Normal", { fg = "#708183", })
    vim.api.nvim_set_hl(org_ns, "NormalNC", { fg = "#465a61", })
    vim.api.nvim_set_hl(org_ns, "Comment", { fg = "#465a61", })

    vim.api.nvim_create_autocmd({ 'FileType', 'BufWinEnter', 'WinEnter' }, {
      callback = function(args)
        local win = vim.api.nvim_get_current_win()
        if win == -1 then return end

        local ft = vim.bo[vim.api.nvim_win_get_buf(win)].filetype
        local is_float = vim.api.nvim_win_get_config(win).relative ~= ""

        local is_preview = is_float and ft == "org" and vim.bo[args.buf].buftype ~= ""

        local is_org = (ft == "org" and not is_preview) or ft == "orgagenda"

        if is_org then
          vim.w[win].org_ns = true
          vim.api.nvim_win_set_hl_ns(win, org_ns)
        elseif vim.w[win].org_ns then
          vim.w[win].org_ns = nil
          vim.api.nvim_win_set_hl_ns(win, 0)
        end
      end,
    })

  end,
}
