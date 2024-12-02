vim.g.mapleader = " "
vim.g.maplocalloader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For Conciseness
local opts = { noremap = true, silent = true }

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Open Explorer

keymap.set(
	{ "i", "n" },
	"<F9>",
	"<ESC> :w <CR> :lcd %:p:h | !g++ -fsanitize=address -DONPC -O2 -o %< % && ./%< <inp <CR>",
	{ desc = "Compile and Run C++ file with inp file" }
)
