vim.opt.background = "dark"

-- The configuration options should be placed before `colorscheme sonokai`.
vim.cmd [[ let g:sonokai_style = 'shusia' ]]
vim.cmd [[ let g:sonokai_better_performance = 1 ]]
vim.cmd [[ let g:sonokai_transparent_background = 2 ]]

vim.cmd [[ colorscheme sonokai ]]

vim.cmd [[ highlight MatchParen gui=bold guifg=#ff3333 guibg=None ]]

vim.cmd [[ highlight TablineSel guifg=#88ffff guibg=#323232 ]]
vim.cmd [[ highlight Tabline    guifg=#989898 guibg=#252525 ]]
