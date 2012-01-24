" /Shortcut to find the defined shortcuts.
" /Function to find the defined functions.

call pathogen#infect('plugins')


" I - Use autocmd
"

if has("autocmd")
    filetype plugin indent on
    autocmd BufWritePost .vimrc source $MYVIMRC
    autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
endif



" II - Some classics "
"

set nocompatible
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
syntax on
set number
set mouse=a
set hidden
colorscheme default
set omnifunc=syntaxcomplete#Complete
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/Qt
set foldmethod=syntax



" III - A little bit harder - Let's remember new function and shortcuts "
"

" No plugin needed :
" {

" :help :mksession
" :nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/
" map <C-F12> :!ctags -R -I --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" 



" Directory of the current edited file :
" Shortcut: %%

cnoremap %% <C-R>=expand('%:h').'/'<cr>


" Preserve the buffer state while executing a command :
function! Preserve(command)
    " Save last search, and cursor position.
    let _s = @/
    let l  = line(".")
    let c  = col(".")

    " Execute the command.
    execute a:command

    " Restore previous search history, and cursor position.
    let @/=_s
    call cursor(l, c)
endfunction

let mapleader = ","

" Delete all blanks at the end of lines :
" Shortcut: <leader>$

nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Indent the whole file :
" Shortcut: <leader>=

nmap <leader>= :call Preserve("normal gg=G")<CR>


" Set all tab settings at once :
" Function: :Stab

command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:tabstop     = l:tabstop
        let &l:softtabstop = l:tabstop
        let &l:shiftwidth  = l:tabstop
    endif
endfunction
" }

" !! The following shortcuts need the gundo plugin :
" {
    " Open/Close the undo window :
    " Shortcut: F5
    
    nmap <F5> :GundoToggle<CR>
" }

" !! The following shortcuts need the unimpaired plugin :
" {
    " Move lines up and down :
    " Shortcut: ctr + up/down
    
    nmap <C-Up> [e
    nmap <C-Down> ]e
    vmap <C-Up> [egv
    vmap <C-Down> ]egv
" }

" !! The following shortcuts need the tabular plugin :
" {
    let mapleader=','
    
    " Align on = sign :
    " Shortcut: <leader>a=
    
    vmap <Leader>a= :Tabularize /= <CR>
    
    " Align on : sign :
    " Shortcut: <leader>a:
    
    vmap <Leader>a: :Tabularize /:\zs<CR>
" }

