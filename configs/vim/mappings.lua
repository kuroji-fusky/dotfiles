-- mapping the commenting keyinds
require('nvim-autopairs').setup({})
require('Comment').setup()

vim.keymap.set('n', '<C-_>', function()
  return require('Comment.api').toggle.linewise.current()
end, { expr = true, desc = "Toggle comment" })

vim.keymap.set('v', '<C-_>', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = "Toggle comment (Visual)" })