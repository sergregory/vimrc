filetype plugin indent on
syntax on

" highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 10
set colorcolumn=+1
set number
highlight ColorColumn ctermbg=lightgray guibg=lightgray
au FileType cpp let g:clang_use_library = 1
au FileType cpp let g:clang_library_path ="/usr/lib/libclang.so"
" Complete options (disable preview scratch window)
set completeopt = "menu,menuone,longest,preview"
" Limit popup menu height
set pumheight=30
" automatically change window's cwd to file's dir
set autochdir
" Show clang errors in the quickfix window
au FileType cpp let g:clang_complete_copen = 1


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
let g:syntastic_python_checkers = ["flake8", "pylint"]
let g:syntastic_python_flake8_post_args="--max-line-length=120, --ignore=E999,E111"
let g:syntastic_python_python_exec = 'python'
au FileType python setl tw=120


let g:pymode_lint = 0
let g:pymode_lint_unmodified = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_options_pylint = {'max-line-length': 120}
let g:pymode_lint_options_pep8 = {'max_line_length': 120}
let g:pymode_lint_ignore = "E501"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = '/home/gserebry/dev/python3-env'

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_options_colorcolumn=120
au FileType python setl tw=120
" "remap Jedi omlicompletion to Ctrl+P
" let g:jedi#completions_command = "<C-P>"
" let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0


let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>


" Don't autofold code
let g:pymode_folding = 0
" For EasyTags - put tags into the local file for each directory
set tags=.tags,./**/tags,~/.tags
let g:easytags_dynamic_files = 1
let Tlist_Use_Right_Window   = 1
colorscheme PaperColor
set  t_Co=256
set background=light

" Clang autoformatting
let g:formatdef_clangformat="/usr/bin/clang-format"
let g:autoformat_autoindent = 0

" C++ syntastic support
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'

" Include mathit extension
runtime macros/matchit.vim
"
" Vebugger
let g:vebugger_leader='<Tab>'


" YCM
let g:ycm_server_python_interpreter='/usr/bin/python2.7'

" EasyMotion
map \ <leader><leader>s

" Comment symbol for gnuplot files
au FileType gnuplot setl cms=\#\ %s
"
" Comment symbol for CMake files
au BufNewFile,BufRead CMakeLists.txt setl cms=\#\ %s
au BufNewFile,BufRead *.cmake setl cms=\#\ %s

nnoremap <leader>h :nohl<cr>

" Zeal
function! FindZealDoc()
    let l:file_type = &filetype
    let l:text = "<cword>"
    execute "!zeal '" . l:file_type."':'".l:text."'"
endfunction
nnoremap <leader><leader>g :call FindZealDoc()<CR><CR>

" Vim will then use the background of your shell.
let g:solarized_termtrans = 1
