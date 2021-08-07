" Initialize autocmd
" autocmd!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOVIM || VIM SETUP 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Detect if neovim is already installed, else use regular vim
if has('nvim')
    let g:plugInstallPath = '~/.local/share/nvim/site/autoload/plug.vim'
    let g:pluggedPath = '~/.local/share/nvim/plugged'
else
    let g:plugInstallPath = '~/.vim/autoload/plug.vim'
    let g:pluggedPath = '~/.vim/plugged'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-PLUG 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob(g:plugInstallPath))
    silent execute '!curl -fLo ' . g:plugInstallPath . ' --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(g:pluggedPath)
  " Autocompletion
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Easymotion
  Plug 'easymotion/vim-easymotion'

  " Theme
  Plug 'tomasiser/vim-code-dark'
  Plug 'itchyny/lightline.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'coreyja/fzf.devicon.vim'

  " File Explorer
  Plug 'Shougo/defx.nvim'
  Plug 'kristijanhusak/defx-icons'
  Plug 'kristijanhusak/defx-git'

  " Search helpers
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'

  " Editing helpers
  Plug 'tpope/vim-commentary' 
  Plug 'yggdroot/indentline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Snippets
  Plug 'honza/vim-snippets'

  " Language Syntax
  Plug 'yuezk/vim-js', { 'for': ['javascript', 'javascriptreact'] }
  Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascriptreact' }

  Plug 'jparise/vim-graphql'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  Plug 'dag/vim-fish', { 'for': 'fish' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup and swap files off
set nobackup
set nowb
set noswapfile
set history=750

" Folding method
set foldmethod=syntax "syntax highlighting items specify folds  
set foldcolumn=1 "defines 1 col at window left, to indicate folding  
set foldlevelstart=99 "start file with all folds opened

let javaScript_fold=1
let typeScript_fold=1
let javaScriptReact_fold=1
let typeScriptReact_fold=1

" Enable syntax highlighting
syntax on
set encoding=utf8
set ffs=unix,dos,mac

"" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256

" Set vim theme 
set termguicolors
colorscheme codedark

" Cursor style
set cursorline
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr    cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

" Hide intro message
set shortmess=I

" Hide foldcolumn
:setlocal foldcolumn=0

" Ignore case when searching 
set ignorecase 

" Set clipboard to be able to yank into OS clipboard
set clipboard=unnamedplus

" Enable filetype plugins
filetype plugin on
filetype indent on

" Show line numbers 
set number

" Set relative numbering
set relativenumber

" Set vim background transparency
hi Normal guibg=NONE ctermbg=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Turn on smart tab feature
set smarttab

" Set tab to spaces value
set shiftwidth=2
set tabstop=2

" Set indentation options
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL MODE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Tab management 
nmap tn :tabnew<cr>
nmap tc :tabclose<cr>
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" Remove search results
nnoremap <leader><space> :noh<cr>

" Format file with Prettier 
command! -nargs=0 Fmt :CocCommand prettier.formatFile
nmap fm :CocCommand prettier.formatFile<Return>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTLINE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent removing quotes from json
autocmd Filetype json let g:indentLine_setConceal = 0

let g:indentLine_indentLevel = 10

" Conceal settings
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "incv"
let g:indentLine_conceallevel = 2

let g:indentLine_char = '|'

let g:indentLine_leadingSpaceChar = "•"

" 16 Color
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" 256
let g:indentLine_color_term = 239

" True Color
let g:indentLine_color_gui = '#616161'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GITGUTTER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
let g:gitgutter_enabled=1
let g:gitgutter_async=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HEXOKINASE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_refreshEvents = ['InsertLeave']

let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

let g:Hexokinase_highlighters = ['backgroundfull']

" Reenable hexokinase on enter
autocmd VimEnter * HexokinaseTurnOn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-CLOSETAG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,typescriptreact'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,javascript.jsx,jsx,typescript.tsx,typescriptreact'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DEFX 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define mappings
nnoremap <silent>sf :<C-u>Defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ -show-ignored-files
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Vim Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map ;f :GFilesWithDevicons --exclude-standard --others --cached<CR>
map ;g :RgWithDevicons<CR>
map ;c :Commits<CR>

map <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --ignore .git "


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --glob=\!.git '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ]
      \           ],
      \   'right': [
      \     ['ale'],
      \     ['lineinfo'],
      \     ['percent'],
      \     ['charcode', 'fileformat', 'filetype'],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'filename': '%f'
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'ale': 'ALEGetStatusLine'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\u2b64"
  else
    return ""
  endif
endfunction

function! MyFugitive()
    let branch = fugitive#head()
    return strlen(branch) ? ' '.branch : ''
endfunction

set noshowmode
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" jsonc syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
noremap <silent> <C-f> <Plug>(coc-definition)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Extensions
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-clangd',
  \ 'coc-elixir',
  \ 'coc-python',
  \ 'coc-tailwindcss',
  \ 'coc-go',
  \ ]
