vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1

vim.g.mapleader = '\\'
vim.g.maplocalleader = ' '

-- vim.g.netrw_altv = 1

vim.opt.shadafile = 'NONE'
vim.opt.swapfile = false
vim.opt.autochdir = true

-- editing
vim.opt.clipboard = 'unnamedplus'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true

-- ui
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.guicursor = "n-v-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.pumblend = 28
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wildoptions = 'tagfile'
vim.opt.title = true
vim.opt.ruler = false
vim.opt.fillchars = { eob = ' ' }
vim.opt.guicursor = {
  "n-v-c-sm:block-blinkwait0-blinkon200-blinkoff200",
  "i-ci-ve:ver25-blinkwait0-blinkon200-blinkoff200",
  "r-cr-o:hor20-blinkwait0-blinkon200-blinkoff200",
  "t:block-blinkwait0-blinkon200-blinkoff200-TermCursor",
}
