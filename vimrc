" /Shortcut to find the defined shortcuts.
" /Function to find the defined functions.

" ++ Pathogen plugin: {{{
    runtime plugins/pathogen/autoload/pathogen.vim
    call pathogen#infect('plugins')
" }}}

" Basics : {{{
    " Autocommands {{{
        if has("autocmd")
            filetype plugin indent on
        endif
    " }}}
    
    " Settings {{{
        set nocompatible

        " Highlight search
        set hlsearch

        " Setup tabs
        set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

        " Get colors
        syntax on
        colorscheme torte

        " Get line numbers
        set number

        " Enable the mouse
        set mouse=a

        " Switch buffer without saving
        set hidden
        
        " Folding method
        set foldmethod=indent

        " Enhance display
        set wildmenu

        " Tags
        set tags=tags;/
        set tags+=~/.vim/tags/STL.tags
        set tags+=~/.vim/tags/Qt.tags
        
        setlocal omnifunc=syntaxcomplete#Complete
    " }}}
    
    " Shortcuts and Functions {{{
        " Launch tags generation

        map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q -f tags .<CR>
        
        
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
    " }}}
" }}}

" ++ Gundo plugin : {{{
    nmap <F5> :GundoToggle<CR>
" }}}

" ++ Supertab plugin: {{{
    let g:SuperTabDefaultCompletionType = "context"
" }}}

" ++ Fugitive plugin: {{{
    if has("autocmd")
        autocmd BufReadPost fugitive://* set bufhidden=delete
    endif

    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" }}}

" ++ Session plugin: {{{
    let g:session_autoload = 'no'
    let g:session_autosave = 'yes'
" }}}

" ++ Taglist plugin : {{{
    nmap <F6> :TlistToggle<CR>
" }}}

