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
