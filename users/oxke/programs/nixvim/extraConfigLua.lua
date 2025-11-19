vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--
-- better colorscheme
-- require("midnight").setup({
--   HighlightGroup = {
--     bg = "none",
--   },
-- })

local auto_theme_custom = require("lualine.themes.auto")
auto_theme_custom.normal.c.bg = "#00000000"
require("lualine").setup({ options = { theme = auto_theme_custom } })

vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", vim.fn.expand("%:p:h") }
vim.g.UltiSnipsSnippetsDir = "UltiSnips"
vim.g.UltiSnipsExpandTrigger = "<A-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<A-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<A-h>"
-- vim.g.UltiSnipsEditSplit = "vertical"
vim.api.nvim_set_keymap("n", "<leader>asdf", ":UltiSnipsEdit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fdsa", ":e %:e.snippets<CR>", { noremap = true, silent = true })

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

_G.has_words_before = has_words_before

