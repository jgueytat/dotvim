call pathogen#infect()

" /Shortcut to find the defined shorcuts.
" /Function to find the defined functions.

" I - Some classicals "
"

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
syntax on
set number
set mouse=a
colorscheme torte


" II - A little bit harder "
"

" Shortcut: %%
" Directory of the current edited file.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Preserve the buffer state while executing a command:
function! Preserve(command)
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")

    " Execute the command.
    execute a:command

    " Restore previous search history, and cursor position.
    let @/=_s
    call cursor(l, c)
endfunction

" Shortcut: _$
" Delete all blanks at the end of lines.
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" Shortcut: _=
" Indent the whole file.
nmap _= :call Preserve("normal gg=G")<CR>


" Function: :Stab
" Set all tab settings at once.
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:tabstop = l:tabstop
        let &l:softtabstop = l:tabstop
        let &l:shiftwidth = l:tabstop
    endif
endfunction


" III - Use autocommands
"

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
    filetype plugin indent on
endif

