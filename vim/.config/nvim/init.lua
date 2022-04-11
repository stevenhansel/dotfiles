local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('general/main')
require('rnvimr/main')
require('gitgutter/main')
require('hexokinase/main')

return require('packer').startup(function(use)
  -- Packer, the package manager :D
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'NLKNguyen/papercolor-theme'

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
