local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.g.gruvbox_contrast_dark = 'hard'

-- vim.cmd([[
-- highlight SignColumn        NONE
-- highlight link SignColumn   GruvboxBg0
-- ]])
