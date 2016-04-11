filetype plugin indent on
syntax on

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set guifont=Source\ Code\ Pro\ Light\ 11
set colorcolumn=+1
set number
highlight ColorColumn ctermbg=lightgray guibg=lightgray
let g:clang_use_library = 1
let g:clang_library_path=/usr/lib/libclang.so
" Complete options (disable preview scratch window)
set completeopt = menu,menuone,longest,preview
" Limit popup menu height
set pumheight = 30
" automatically change window's cwd to file's dir
set autochdir
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-p>'
let g:SuperTabMappingBackward = '<s-c-p>'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

let g:pymode_rope_autoimport = 0
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_options_pylint = {'max-line-length': 120}
let g:pymode_lint_options_pep8 = {'max_line_length': 120}
"let g:pymode_lint_ignore = "E501"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_options_colorcolumn=120
"remap Jedi omlicompletion to Ctrl+P
let g:jedi#completions_command = "<C-P>"


" Don't autofold code
let g:pymode_folding = 0
let g:syntastic_mode_map = { 'mode': 'passive',
                             \ 'active_filetypes': ['ruby', 'php'],
                             \ 'passive_filetypes': ['puppet'] }

" For EasyTags - put tags into the local file for each directory
set tags=['./**/tags', '~/.vimtags'];
let g:easytags_dynamic_files = 1
let Tlist_Use_Right_Window   = 1
colorscheme peaksea
set  t_Co=256
set background=light
map <F10> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Clang autoformatting
let g:formatdef_clangformat=clang-format-3.6
noremap <C-l> :Autoformat<CR>
let g:autoformat_autoindent = 0

" Include mathit extension
runtime macros/matchit.vim
