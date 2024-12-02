-- Set kitty terminal padding to 0 when in nvim
vim.cmd [[
  augroup kitty_mp
  autocmd!
  au VimLeave * :silent !kitty @ set-spacing padding=default
  au VimEnter * :silent !kitty @ set-spacing padding=5
  augroup END
]]
