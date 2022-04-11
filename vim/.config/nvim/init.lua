local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('general/main')
require('coc/main')
require('rnvimr/main')
require('telescope/main')
require('gitgutter/main')
require('hexokinase/main')
require('indentline/main')
require('closetag/main')
require('lualine/main')

require('custom/tabline')

return require('packer').startup(function(use)
  -- Packer, the package manager :D
  use 'wbthomason/packer.nvim'

  -- coc, autocompletion
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'

  -- Colorscheme
  use 'NLKNguyen/papercolor-theme'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- File exporer
  use 'kevinhwang91/rnvimr'

  -- Editing Helpers
  use 'tpope/vim-commentary' 
  use 'yggdroot/indentline'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'
  use { 'rrethy/vim-hexokinase',  run = 'make hexokinase' }

  -- Programming Language
    -- Go
    use {
      'fatih/vim-go',
      ft = {'go'}
    }

    -- JavaScript/TypeScript
    use {
      'pangloss/vim-javascript',
      ft = {'js', 'jsx', 'ts', 'tsx'}
    }
    use {
      'yuezk/vim-js',
      ft = {'js', 'jsx', 'ts', 'tsx'}
    }
    use {
      'HerringtonDarkholme/yats.vim',
      ft = {'ts', 'tsx'}
    }
    use {
      'maxmellon/vim-jsx-pretty',
      ft = {'js', 'jsx', 'ts', 'tsx'}
    }

    -- Python
    use {
      'vim-python/python-syntax',
      ft = {'python'}
    }
  
    -- JSON
    use {
      'elzr/vim-json',
      ft = {'json'}
    }

    -- Markdown
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
