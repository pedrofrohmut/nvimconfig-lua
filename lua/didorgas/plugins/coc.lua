vim.cmd [[
    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocActionAsync('format')
    " Prettier Format
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
]]

-- Completion ###############################################################

vim.cmd [[ inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>" ]]
vim.cmd [[
    inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(0): CheckBackspace() ? "\<Tab>" : coc#refresh()
    inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(0) : "\<C-h>"
]]

vim.keymap.set("i", "<C-n>", "coc#pum#next(0)", { noremap = true, silent = true, expr = true })
vim.keymap.set("i", "<C-p>", "coc#pum#prev(0)", { noremap = true, silent = true, expr = true })
-- vim.keymap.set("i", "<C-j>", "coc#pum#next(0)", { noremap = true, silent = true, expr = true })
-- vim.keymap.set("i", "<C-k>", "coc#pum#prev(0)", { noremap = true, silent = true, expr = true })

vim.keymap.set("i", "<C-j>", "coc#pum#confirm()", { noremap = true, silent = true, expr = true })
vim.keymap.set("i", "<C-i>", "coc#pum#cancel()", { noremap = true, silent = true, expr = true })

-- MAPS #####################################################################

-- " Use <c-space> to trigger completion.
vim.keymap.set("i", "<C-Space>", "coc#refresh()", { noremap = true, silent = true, expr = true })

-- " Remap keys for applying codeAction to the current buffer.
vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction)", { noremap = true })
-- " Apply AutoFix to problem on the current line.
vim.keymap.set("n", "<leader>cf", "<Plug>(coc-fix-current)", { noremap = true })

-- " Run the Code Lens action on the current line.
vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", { noremap = true })

-- " Symbol renaming.
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { noremap = true })
-- " CocRefactor
vim.keymap.set("n", "<leader>rf", "<Plug>(coc-refactor)", { noremap = true })

-- Use K to show documentation in preview window.
vim.keymap.set("n", "K", ":call ShowDocumentation()<CR>", { noremap = true, silent = true })
-- Highlight the symbol and its references when holding the cursor.
vim.cmd [[ autocmd CursorHold * silent call CocActionAsync('highlight') ]]

-- GoTo code navigation.
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { noremap = true, silent = true })
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { noremap = true, silent = true })
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = true })

-- " Show all diagnostics.
vim.keymap.set("n", "g]", "<Plug>(coc-diagnostic-prev)", { noremap = true, silent = true })
vim.keymap.set("n", "g[", "<Plug>(coc-diagnostic-next)", { noremap = true, silent = true })
vim.keymap.set("n", "<space>ld", ":<C-u>CocList diagnostics<Enter>", { noremap = true, silent = true, nowait = true })

-- Hide Popups
vim.keymap.set("n", "<space>h", "<Plug>(coc-float-hide)", {})

-- Show commands.
vim.keymap.set("n", "<space>lc", ":<C-u>CocList commands<Enter>", { noremap = true, silent = true, nowait = true })
-- Find symbol of current document.
vim.keymap.set("n", "<space>lo", ":<C-u>CocList outline<Enter>", { noremap = true, silent = true, nowait = true })

-- Extensions List #############################################################
-- - just a list of the extensions choose for future consulting
-- - Command to list :CocList extensions
-- 1. coc-html
-- 2. coc-css
-- 3. coc-prettier
-- 4. coc-pyright
-- 5. coc-eslint
-- 6. coc-tsserver
-- 7. coc-vetur
-- 8. coc-tailwindcss
