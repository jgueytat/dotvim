call pathogen#infect()

syntax on

" Create :Stab funcion to update all tabs settings at once.
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

" Set tabstop softtabstop shiftwidth and expandtab.
set ts=4 sts=4 sw=4 expandtab

if has("autocmd")
    filetype plugin indent on
endif

