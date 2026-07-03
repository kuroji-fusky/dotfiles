local function make_the_bitch_transparent()
  local vim_gwoups = {"Normal", "NormalNC", "NormalFloat", "SignColumn"}

  for _, group in ipairs(vim_gwoups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE"})
  end
end

vim.o.wildignore = { 
  -- Web dev bloat
  "node_modules", ".next", ".astro", ".svelte_kit", "dist"
  -- Python
  "__pycache__", "venv", ".venv"
}