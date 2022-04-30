command! -nargs=0 Fmt :CocCommand prettier.formatFile
command! -nargs=0 CocFormat :call CocActionAsync('format')

autocmd FileType javascript, javascriptreact, typescript, typescriptreact nmap fm :Fmt<Return>
autocmd FileType go nmap fm :GoFmt<Return>
autocmd FileType dart nmap fm :DartFmt<Return>

" TODO: move into it's own package
let dart_html_in_string=v:true
let g:dart_style_guide = 2
