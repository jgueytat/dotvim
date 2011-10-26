call pathogen#infect()


" Some classicals "
"

" Classical settings:
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
syntax on
set number

" Mappings without new function:
nmap <c-s-h> <<
nmap <c-s-l> >>
vmap <c-s-h> <gv
vmap <c-s-l> >gv


" Functions and mappings using it "
"

" Function to preserve the buffer state while executing a command:
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

" Mapping based on the function Preserve():
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>


" Funcion to set all tab settings at once:
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:tabstop = l:tabstop
        let &l:softtabstop = l:tabstop
        let &l:shiftwidth = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction


if has("autocmd")
    filetype plugin indent on
endif

