local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

-- PackerSync onThisFileSave
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

-- Safe require
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Error to require Packer. Check the config")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- COC - Conquer of Completion
    use {'neoclide/coc.nvim', branch = 'release'}

    -- CTags / Tagbar
    use 'preservim/tagbar'

    -- Telescope
    use 'nvim-lua/plenary.nvim' -- Required for Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Tree File Explorer
    use 'preservim/nerdtree'

    -- Jump plugin like small version of easy motion
    use 'justinmk/vim-sneak'
    
    -- Emmet - HTML JSX snippets
    use 'mattn/emmet-vim'

    -- Auto close HTML tags
    use 'alvan/vim-closetag'

    -- EditorConfig
    use 'editorconfig/editorconfig-vim'

    -- Surrounder for Simple Stuff
    use 'tpope/vim-surround'
    -- Dot command now works with some plugins too
    use 'tpope/vim-repeat'
    
    -- Commenter
    use 'tomtom/tcomment_vim'

    -- Git gutter
    use 'airblade/vim-gitgutter'

    -- Status Line
    use 'nvim-lualine/lualine.nvim'

    -- Color Schemes
    use 'mhartington/oceanic-next'
    use 'jacoborus/tender.vim'
    use 'dikiaap/minimalist'
    use 'folke/tokyonight.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
