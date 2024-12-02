vim.g.mapleader = " "
vim.g.maplocalloader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- For conciseness
local opts = { noremap = true, silent = true }

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Compile and Run C++ with inp file
keymap.set(
	"i",
	"<F9>",
	"<ESC> :w <CR> :lcd %:p:h | !g++ -fsanitize=address -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <inp <CR>",
	{ desc = "Compile and Run C++ file with inp file" }
)
keymap.set(
	"n",
	"<F9>",
	"<ESC> :w <CR> :lcd %:p:h | !g++ -fsanitize=address -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <inp <CR>",
	{ desc = "Compile and Run C++ file with inp file" }
)
-- Compile and Run C++ with user input
keymap.set(
	"i",
	"<F10>",
	"<ESC> :w <CR> :lcd %:p:h | !g++ -DONPC -o %< % && ./%< <inp <CR>",
	{ desc = "Compile and Run C++ file with inp file" }
)
keymap.set(
	"n",
	"<F10>",
	"<ESC> :w <CR> :lcd %:p:h | !g++ -DONPC -o %< % && ./%< <inp <CR>",
	{ desc = "Compile and Run C++ file with inp file" }
)

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
