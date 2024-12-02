return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			auto_install = true,
			sync_install = false,
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"html",
				"css",
				"cpp",
				"c",
				"lua",
				"bash",
			}
		})
	end,
}
