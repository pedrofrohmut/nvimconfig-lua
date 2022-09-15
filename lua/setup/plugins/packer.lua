local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Coq Completion
    use "ms-jpq/coq_nvim"
    use "ms-jpq/coq.artifacts"

    -- Snippets
    use "rafamadriz/friendly-snippets"

    -- LSP Config
    use "neovim/nvim-lspconfig"

    -- Telescope
    use "nvim-lua/plenary.nvim" -- Required for Telescope
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- Tree file explorer
    use "preservim/nerdtree"
    
    -- Language Support
    use "nvim-treesitter/nvim-treesitter"
    -- use "elixir-editors/vim-elixir"
    -- use "andyl/vim-textobj-elixir"

    -- Jump plugin like small version of easy motion
    use "justinmk/vim-sneak"

    -- Emmet - HTML JSX snippets
    use "mattn/emmet-vim"

    -- Auto close HTML tags
    use "alvan/vim-closetag"
   
    -- EditorConfig
    use "editorconfig/editorconfig-vim"

    -- Surrounder for Simple Stuff
    use "tpope/vim-surround"

    -- Dot command now works with some plugins too
    use "tpope/vim-repeat"

    -- Commenter
    use "tomtom/tcomment_vim"

    -- Aligner
    use "tommcdo/vim-lion"

    -- Git gutter
    use "airblade/vim-gitgutter"

    -- Status Line
    use "nvim-lualine/lualine.nvim"

    -- Color Schemes
    use "mhartington/oceanic-next"
    use "jacoborus/tender.vim"
    use "folke/tokyonight.nvim"
    use "sainnhe/sonokai"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
end)
