local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd "packadd packer.nvim"
end

-- Automatically source and re-compile packer whenever you save this file.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use.
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window.
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded"})
    end,
  },
}

-- Install your plugins here.
return packer.startup(function(use)
  -- Core functionalities
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim.
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- Package managers
  use "wbthomason/packer.nvim" -- Have packer manage itself.
  use "williamboman/mason.nvim" -- Package manager for LSP, DAP, Linters...

  -- Programming functionalities
  use "akinsho/toggleterm.nvim" -- Terminal

  -- Appearance and layout
  use "morhetz/gruvbox" -- Color scheme
  use "kyazdani42/nvim-web-devicons" -- Dev Icons
  use "akinsho/bufferline.nvim" -- Buffer as tabline
  use "nvim-lualine/lualine.nvim" -- Status line
  use "kyazdani42/nvim-tree.lua" -- File tree
  use "linty-org/key-menu.nvim"


  -- cmp plugins
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }               -- Autocompletion
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }           -- Snippet Engine and Snippet Expansion

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason-lspconfig.nvim" -- Mason support for LSP

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Fuzzy Finder (files, lsp, etc)
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }       -- Add git related info in the signs columns and popups

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'                                           -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'                               -- Additional textobjects for treesitter

  -- Automatically set up your configuration after cloning packer.nvim.
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
