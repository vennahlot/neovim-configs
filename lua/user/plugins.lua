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
  -- Coding essentials
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- Package manager for LSP, DAP, Linters...
  "williamboman/mason-lspconfig.nvim", -- Mason support for LSP
  "mfussenegger/nvim-dap", -- Debugger
  "jay-babu/mason-nvim-dap.nvim", -- Mason dap connections
  {"rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }, -- Debugger UI
  "mfussenegger/nvim-dap-python", -- Debugger config for Python

  -- Copilot
  "github/copilot.vim",

  -- Appearance and layout
  "morhetz/gruvbox", -- Color scheme
  "kyazdani42/nvim-web-devicons", -- Dev Icons
  "akinsho/bufferline.nvim", -- Buffer as tabline
  "nvim-lualine/lualine.nvim", -- Status line
  "folke/which-key.nvim", -- Key hints
  "goolord/alpha-nvim", -- Greeter
  "karb94/neoscroll.nvim", -- Smooth scroll

  -- cmp plugins
  { 'hrsh7th/nvim-cmp', dependencies = { "hrsh7th/cmp-nvim-lsp" } }, -- Autocompletion
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  { "L3MON4D3/LuaSnip", dependencies = { "saadparwaiz1/cmp_luasnip" } }, -- Snippet Engine and Snippet Expansion

  -- Diagnostics
  "folke/trouble.nvim",

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },

  -- Git
  "lewis6991/gitsigns.nvim",

  -- Treesitter
  "nvim-treesitter/nvim-treesitter", -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobjects for treesitter

  -- Terminals
  "akinsho/toggleterm.nvim", -- Terminal
})
