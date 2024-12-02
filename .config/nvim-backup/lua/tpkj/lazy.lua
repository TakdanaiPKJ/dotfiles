local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Import color theme based on environment variable NVIM_THEME
local default_color_scheme = "nightfly"
local env_var_nvim_theme = os.getenv("NVIM_THEME") or default_color_scheme

-- Define a table of theme modules
local themes = {
	nord = "tpkj.plugins.themes.nord",
	onedark = "tpkj.plugins.themes.onedark",
	cyberdream = "tpkj.plugins.themes.cyberdream",
	nightfly = "tpkj.plugins.themes.nightfly",
}

require("lazy").setup({
	require(themes[env_var_nvim_theme]),
	{ import = "tpkj.plugins" },
	{ import = "tpkj.plugins.lsp" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
