return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
					n = {
						["q"] = actions.close,
					},
				},
			},
			picker = {
				find_files = {
					file_ignore_patterns = { ".git" },
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind Current [W]ord" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elps" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })

		vim.keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[F]ind [/] in Open Files" })
	end,
}
