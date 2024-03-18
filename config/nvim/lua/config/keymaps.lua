vim.keymap.set(
  "n",
  "<leader>ve",
  function()
    vim.cmd.tabnew()
    vim.cmd.Ex()
  end
)

-- close a buffer
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)

-- Move to the bottom or top of the previous highlihgt
vim.cmd([[nnoremap <leader>md `>]])
vim.cmd([[nnoremap <leader>mu `<]])


-- line and column highlight
-- vim.cmd([[map <leader>lc :set cursorcolumn!<Bar>set cursorline!<CR>]])

-- Copy to clipboard
vim.cmd([[vnoremap  <leader>y  "+y]])
-- vim.cmd([[nnoremap  <leader>Y  "+yg_]])
vim.cmd([[nnoremap  <leader>y  "+y]])
-- vim.cmd([[nnoremap  <leader>yy  "+yy]])

-- Paste from clipboard
vim.cmd([[nnoremap <leader>p "+p]])
vim.cmd([[nnoremap <leader>P "+P]])
vim.cmd([[vnoremap <leader>p "+p]])
vim.cmd([[vnoremap <leader>P "+P]])


-- Move to the next paragraph without opening folds
vim.api.nvim_set_keymap('n', '}', [[<Cmd>execute foldclosed('.') == -1 ? "normal! }" : "normal! j"<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '}', [[<Cmd>execute foldclosed('.') == -1 ? "normal! }" : "normal! j"<CR>]], {noremap = true, silent = true})

-- Move to the previous paragraph without opening folds
vim.api.nvim_set_keymap('n', '{', [[<Cmd>execute foldclosed('.') == -1 ? "normal! {" : "normal! k"<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '{', [[<Cmd>execute foldclosed('.') == -1 ? "normal! {" : "normal! k"<CR>]], {noremap = true, silent = true})

-- Easier save key
vim.keymap.set("n", "<leader>w", "<ESC>:w <CR>")

-- splits
vim.keymap.set("n", "<leader>vs", ":vsplit <CR>")
vim.keymap.set("n", "<leader>s", ":split <CR>")
vim.keymap.set("n", "<leader>cs", ":close <CR>")

-- navigate splits
vim.keymap.set("n", "<leader>l", ":wincmd l <CR>")
vim.keymap.set("n", "<leader>h", ":wincmd h <CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j <CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k <CR>")


vim.keymap.set("n", "<leader>vf", ":G ")

-- Map 'nd' to go to the next diagnostic
vim.api.nvim_set_keymap('n', '<leader>nd', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pd', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
