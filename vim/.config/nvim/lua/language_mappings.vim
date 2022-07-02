" autocmd FileType javascript, javascriptreact, typescript, typescriptreact nmap fm :Fmt<Return>
" autocmd FileType go nmap fm :GoFmt<Return>
" autocmd FileType dart nmap fm :DartFmt<Return>
" autocmd FileType rust nmap fm :RustFmt<Return>

" TODO: move into it's own package
let dart_html_in_string=v:true
let g:dart_style_guide = 2

if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif
