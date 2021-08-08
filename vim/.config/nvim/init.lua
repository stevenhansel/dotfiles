-- Main entrypoint for plugins, managed by paq.nvim
require('plugins/main')

-- General stuff, such as basic nvim mappings and settings 
require('general/mappings')
require('general/settings')

-- Plugin configuration
require('telescope/main')
require('defx/main')
