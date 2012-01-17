" /Shortcut to find the defined shortcuts.
" /Function to find the defined functions.

call pathogen#infect('plugins')


" I - Use autocmd
"

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
    filetype plugin indent on
    autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
endif

set omnifunc=syntaxcomplete#Complete


" II - Some classics "
"

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
syntax on
set number
set mouse=a
set hidden
colorscheme default
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/Qt


" III - A little bit harder - Let's remember new function and shortcuts "
"

" !! The following shortcuts need the gundo plugin.
" Shortcut: F5
" Open/Close the undo window.
nmap <F5> :GundoToggle<CR>


" !! The following shortcuts need the unimpaired plugin.
" Shortcut: ctr + up/down
" Move lines up and down
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv


" !! The following shortcuts need the tabular plugin.
let mapleader=','
"
" Shortcut: <leader>a=
" Align on = sign.
" The following one is on the whole file... Too hazardous!
" nmap <Leader>a= :Tabularize /= <CR>
vmap <Leader>a= :Tabularize /= <CR>

" Shortcut: <leader>a:
" Align after the : sign.
" The following one is on the whole file... Too hazardous!
" nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>


" Shortcut: %%
" Directory of the current edited file.
cnoremap %% <C-R>=expand('%:h').'/'<cr>


" Preserve the buffer state while executing a command:
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
"
let mapleader = ","
"
" Shortcut: <leader>$
" Delete all blanks at the end of lines.
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
"
" Shortcut: <leader>=
" Indent the whole file.
nmap <leader>= :call Preserve("normal gg=G")<CR>


" Function: :Stab
" Set all tab settings at once.
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:tabstop     = l:tabstop
        let &l:softtabstop = l:tabstop
        let &l:shiftwidth  = l:tabstop
    endif
endfunction

