local fn = vim.fn
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
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

-- Install your plugins here
return packer.startup(function(use)

  -- colorscheme
  use { "ellisonleao/gruvbox.nvim" }

  -- alpha
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- packer popup plenary
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- coc.nvim
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  
  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  
  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
  }
  use 'nvim-telescope/telescope-media-files.nvim'
  
  -- impatient
  use 'lewis6991/impatient.nvim'

  -- project
use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
    }
  end
}
  -- toggleterm
  use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end }

  --lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- comment
  use { "numToStr/Comment.nvim" }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use "lukas-reineke/indent-blankline.nvim"

  use "folke/which-key.nvim"
  
  -- Git
  use "lewis6991/gitsigns.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
