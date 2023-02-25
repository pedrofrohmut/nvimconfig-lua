vim.cmd [[
    augroup vimrcCompileMap
        " CleanUp
        autocmd!

        " Map <leader>rf to save, compile and run single source file.
        autocmd FileType c          nnoremap <buffer> <leader>rf :w<CR>:! gcc -std=c99 -o %< % && ./%< <CR>
        autocmd FileType cpp        nnoremap <buffer> <leader>rf :w<CR>:! g++ -o %< % && ./%< <CR>
        autocmd FileType python     nnoremap <buffer> <leader>rf :w<CR>:! python % <CR>
        autocmd FileType javascript nnoremap <buffer> <leader>rf :w<CR>:! node % <CR>
        autocmd FileType sh         nnoremap <buffer> <leader>rf :w<CR>:! ./% <CR>
        autocmd FileType elixir     nnoremap <buffer> <leader>rf :w<CR>:! elixir % <CR>
       "autocmd FileType rust       nnoremap <buffer> <leader>rf :w<CR>:! rustc -o rust.out % && ./rust.out <CR>
        autocmd FileType rust       nnoremap <buffer> <leader>rf :w<CR>:! cargo run --quiet <CR>
        autocmd FileType cs         nnoremap <buffer> <leader>rf :w<CR>:! csc /out:csharp.out % && mono csharp.out <CR>
        autocmd FileType clojure    nnoremap <buffer> <leader>rf :w<CR>:! clojure -M % <CR>
    augroup END
]]
