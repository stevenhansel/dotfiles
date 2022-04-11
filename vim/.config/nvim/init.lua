local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('general/main')
require('gitgutter/main')
require('rnvimr/main')

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
    use 'fatih/vim-go'

    -- JavaScript/TypeScript
    use 'pangloss/vim-javascript'
    use 'yuezk/vim-js'
    use 'HerringtonDarkholme/yats.vim'
    use 'maxmellon/vim-jsx-pretty'

    -- Python
    use 'vim-python/python-syntax'
  
    -- JSON
    use 'elzr/vim-json'

    -- Markdown
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
