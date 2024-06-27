local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Package manager for LSP, DAP, Linters and formatters.
  "williamboman/mason.nvim",
  -- Mason support for LSP
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  },
  -- Sonarlint
  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim.git", -- Sonarcloud linter
    ft = {"python", "cpp", "java"},
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-jdtls"
    },
  },
 -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobjects for treesitter

  -- Code completion
  { 'hrsh7th/nvim-cmp', dependencies = { "hrsh7th/cmp-nvim-lsp" } }, -- Autocompletion
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  { "L3MON4D3/LuaSnip", dependencies = { "saadparwaiz1/cmp_luasnip" } }, -- Snippet Engine and Snippet Expansion

  -- Debugging
  "mfussenegger/nvim-dap", -- Debugger
  "jay-babu/mason-nvim-dap.nvim", -- Mason dap connections
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }, -- Debugger UI
  { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" } }, -- Display virtual text for variable values

  -- Linters


  -- Copilot
  "zbirenbaum/copilot.lua", -- GitHub Copilot
  "zbirenbaum/copilot-cmp", -- Use Copilot as a completion source
  "AndreM222/copilot-lualine", -- Show copilot status as an icon in the status line

  -- Appearance and layout
  "ellisonleao/gruvbox.nvim", -- Color scheme
  "nvim-tree/nvim-web-devicons", -- Dev Icons
  "nvim-lualine/lualine.nvim", -- Status line
  "folke/which-key.nvim", -- Key hints
  "goolord/alpha-nvim", -- Greeter
  "onsails/lspkind.nvim", -- Icons for LSP

  -- Search and navigation
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }, -- Use ripgrep for faster search

  -- Git
  "lewis6991/gitsigns.nvim", -- Git change indicators and signs

  -- Terminals
  "akinsho/toggleterm.nvim", -- Toggled terminal

  -- Neovim related stuffs
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = require("constants").language_servers_to_install
})
require("helpers/lsp").config_lsp()
require("helpers/sonar").config_sonar()

require "user/mason"
-- Configs
require "user/options"
require "user/keymaps"
require "user/colorscheme"
require "user/lualine"
require "user/cmp"
require "user/toggleterm"
require "user/telescope"
require "user/gitsigns"
require "user/treesitter"
require "user/which-key"
require "user/alpha"
require "user/copilot"
