""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

function! PythonRunCtags()
    silent !clear
    execute "!ctags -R --fields=+l --extra=+f --languages=python --python-kinds=-iv -f \"$(dirname '" . bufname("%") . "')/tags\" \"$(dirname '" . bufname("%") . "')\"  $(python -c \"import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))\")"
endfunction

au FileType python map <buffer> <C-F12> :call PythonRunCtags()<cr>


" """"""""""""""""""""""""""""""
" " => JavaScript section
" """""""""""""""""""""""""""""""
" au FileType javascript call JavaScriptFold()
" au FileType javascript setl fen
" au FileType javascript setl nocindent

" au FileType javascript imap <c-t> AJS.log();<esc>hi
" au FileType javascript imap <c-a> alert();<esc>hi

" au FileType javascript inoremap <buffer> $r return 
" au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

" function! JavaScriptFold() 
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

"     function! FoldText()
"         return substitute(getline(v:foldstart), '{.*', '{...}', '')
"     endfunction
"     setl foldtext=FoldText()
" endfunction


" """"""""""""""""""""""""""""""
" " => CoffeeScript section
" """""""""""""""""""""""""""""""
" function! CoffeeScriptFold()
"     setl foldmethod=indent
"     setl foldlevelstart=1
" endfunction
" au FileType coffee call CoffeeScriptFold()

"""""""""""""""""""""""""""""""
" => Matlab/Octave section
"""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.m setl cms=\%\ %s

"""""""""""""""""""""""""""""""
" => C/C++ section
"""""""""""""""""""""""""""""""
" C++11 syntax
let c_no_curly_error = 1

" Use clang
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_check_header = 1

au FileType cpp map <C-F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --langmap="c++:+.cuh.cu" . /home/gserebry/dev/opencv/ <CR><CR>
au FileType cpp map <Leader><C-F12> <Esc>:!ctags -a -R --c++-kinds=+p --fields=+iaS --extra=+q --langmap="c++:+.cuh.cu" . /home/gserebry/dev/opencv/ 

"""""""""""""""""""""""""""""""
" => Bash section
"""""""""""""""""""""""""""""""
au BufNewFile,BufRead .sh setl tw=0

