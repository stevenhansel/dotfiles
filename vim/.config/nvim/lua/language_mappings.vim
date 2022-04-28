command! -nargs=0 Fmt :CocCommand prettier.formatFile

autocmd FileType javascript, javascriptreact, typescript, typescriptreact nmap fm :CocCommand prettier.formatFile<Return>
autocmd FileType go nmap fm :GoFmt<Return>
