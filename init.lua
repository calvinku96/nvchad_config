local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    vim.opt.colorcolumn = "90"
  end,
})
autocmd("BufEnter", {
  callback = function(args)
    if vim.bo.filetype == "fortran" then
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 3
      vim.opt.softtabstop = 3
      vim.opt.tabstop = 3
      vim.opt.colorcolumn = "80"
    end
  end,
})
autocmd("FileType", {
  pattern = "make",
  callback = function(args)
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 8
    vim.opt.softtabstop = 0
    vim.opt.tabstop = 8
  end,
})
autocmd("FileType", {
  pattern = "lua",
  callback = function(args)
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
})
autocmd("FileType", {
  pattern = "cpp",
  callback = function(args)
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.tabstop = 4
    vim.opt.colorcolumn = "111"
  end,
})
autocmd("FileType", {
  pattern = "tex",
  callback = function(args)
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
  end,
})
autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    vim.opt_local.formatoptions:remove "c"
    vim.opt_local.formatoptions:remove "r"
    vim.opt_local.formatoptions:remove "o"
  end,
})

vim.cmd [[ let fortran_do_enddo=1 ]]
vim.cmd [[ let frotran_free_source=1 ]]
if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
end

-- local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
-- if is_windows then
-- vim.opt.shell = 'pwsh'
-- vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
-- vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
-- vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
-- vim.opt.shellquote = "shellxquote="
-- else
-- end
vim.opt.guifont = { "UbuntuMono Nerd Font Mono:h11" }
-- if vim.g.fvim_loaded ~= nill then
--   vim.opt.guifont = { "UbuntuMono Nerd Font Mono:h14" }
-- end

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "auto"
vim.opt.wrap = true
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0
vim.opt.breakindent = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.linebreak = false
vim.opt.showmode = true
vim.opt.splitkeep = "cursor"
vim.opt.completeopt = "menuone,noselect,noinsert"
vim.g.mapleader = " "
vim.g.autoformat_enabled = true
vim.g.cmp_enabled = true
vim.g.diagnostics_mode = 0
vim.g.icons_enabled = true
vim.g.ui_notifications_enabled = true
vim.g.tex_conceal = ""
vim.g.highlighturl_enabled = false
vim.g.Tex_DefaultTargetFormat = "pdf"
vim.g.Tex_MultipleCompileFormats = "pdf"
vim.g.diagnostics_mode = 0
vim.diagnostic.disable()
