require "paq" {
	"savq/paq-nvim";

	'tomasiser/vim-code-dark';
	'tpope/vim-commentary';
	'yggdroot/indentline';
	'jiangmiao/auto-pairs';
	'alvan/vim-closetag';

	-- defx
	{ 'Shougo/defx.nvim', run = ':UpdateRemotePlugins' };
	'kristijanhusak/defx-icons';
	'kristijanhusak/defx-git';

  -- git
  'tpope/vim-fugitive';
  'airblade/vim-gitgutter';

	-- Telescope
	'nvim-lua/popup.nvim';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	{'nvim-telescope/telescope-fzf-native.nvim', run = 'make' };
}

