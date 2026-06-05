local filetype_overrides = vim.api.nvim_create_augroup("filetype_overrides", { clear = true })

-- HTML tab overrides
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_overrides,
  pattern = "*.html",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Markdown and text overrides
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_overrides,
  pattern = "*.md",
  command = "set filetype=markdown",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_overrides,
  pattern = "*.txt",
  command = "set filetype=text",
})

-- Python overrides to comply with PEP8
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
	callback = function()
    vim.opt_local.shiftwidth = 4
		vim.pot_local.tabstop = 4
		vim.opt_local.softtabstop = 4
  end
})
