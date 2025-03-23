-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
   os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
--[[require("lazy").setup({
  spec = {
	{"sainnhe/gruvbox-material", config=function() vim.cmd.colorscheme  "gruvbox-material" end },
    -- import your plugins
    { import = "poorya.plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- automatically check for plugin updates
  checker = { enabled = true },
})]]--
-- Plugin Setup
require("lazy").setup({
	{"sainnhe/gruvbox-material", config=function() vim.cmd.colorscheme  "gruvbox-material" end },
  { import = "poorya.plugins" },
  { "nvim-lua/plenary.nvim" },  -- Required dependency
  { "hrsh7th/nvim-cmp" },  -- Autocompletion
  { "hrsh7th/cmp-nvim-lsp" },
  { "mfussenegger/nvim-dap" }, -- Debugging
  { "rcarriga/nvim-dap-ui" },
  { "simrat39/rust-tools.nvim" },
  { "mfussenegger/nvim-jdtls" },
  { "akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end },

  -- Git
  { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end },
  { "tpope/vim-fugitive" },

  -- DevOps
  { "mfussenegger/nvim-dap" }, -- Debugging support
  { "kevinhwang91/nvim-bqf" }, -- Quickfix Enhancements
  { "towolf/vim-helm" }, -- Helm Charts (for Kubernetes)
  --{ "ludovicchabant/vim-gutentags" }, -- Auto-manage tag files for large projects
  { "mfussenegger/nvim-dap-python" }, -- Python debugging support
  { "fatih/vim-go" }, -- Go development (common in DevOps tooling)
  { "ekalinin/Dockerfile.vim" }, -- Dockerfile syntax highlighting and linting
  { "kkvh/vim-docker-tools" }, -- Manage Docker containers and images
  { "cuducos/yaml.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" }, config = function() require("yaml_nvim").setup() end }, -- YAML support for Docker Compose

  -- Session Management
  }

)


-- Enable LSP (Language Server Protocol) for Python
require'lspconfig'.pyright.setup{}

require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})

-- Keymap to Run Python Code inside Neovim
vim.api.nvim_set_keymap("n", "<leader>r", ":w<CR>:!python3 %<CR>", { noremap = true, silent = true })

-- Autocompletion
local cmp = require'cmp'
cmp.setup {
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = { { name = 'nvim_lsp' } },
}

-- Keybindings
vim.g.mapleader = " "  -- Space is leader key
vim.opt.number = true  -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.shiftwidth = 4  -- Indentation width
vim.opt.tabstop = 4  -- Tab width
vim.opt.termguicolors = true  -- Enable true colors

