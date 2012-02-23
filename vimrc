" Vim Basics: {{{
    " Autocommands: {{{
        if has("autocmd")
            filetype plugin indent on
            autocmd bufwritepost .vimrc source $MYVIMRC
        endif
    " }}}
    
    " Mappings: {{{
        " Personal shortcuts will begin with the mapleader key
        let mapleader = ";"

        " Edit .vimrc file in a new tab
        " Shortcut: <leader>v
        nmap <leader>v :tabedit $MYVIMRC<CR>

        " Get the directory of the current buffer :
        cnoremap %% <C-R>=expand('%:h').'/'<CR>

        " Launch tags generation :
        " Shortcut: Ctr + F12
        nmap <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q -f tags .<CR>

        " Edit a file in the same directory of the current file edited :
        " Shortcut: <leader>e
        nmap <leader>e :e %%
        
        " Change for the current tab to the directory of the current file edited :
        " Shortcut: <leader>e
        nmap <leader>lcd :lcd %%
    " }}}

    " Options: {{{
        set nocompatible

        " Highlight search
        set hlsearch

        " Setup tabs
        set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

        " Get colors
        syntax on
        colorscheme evening

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
        set wildmode=longest,list

        " Tags
        set tags+=.tags;/
        set tags+=~/sup_core/src/libs/sup/tags
        set tags+=~/.vim/tags/STL.tags
        set tags+=~/.vim/tags/Qt.tags
        
        setlocal omnifunc=syntaxcomplete#Complete
    " }}}
    
    " Functions: {{{
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

" Vim Plugins: {{{
    " Pathogen: {{{
        runtime plugins-enabled/pathogen/autoload/pathogen.vim
        call pathogen#infect('plugins-enabled')
    " }}}

    " Gundo: {{{
        " Mappings: {{{
            nmap <F5> :GundoToggle<CR>
        " }}}
    " }}}

    " Supertab: {{{
        " Mappings: {{{
            " Start completion
            " Shortcut: <C-Space>
            let g:SuperTabMappingForward = '<Nul>'
        " }}}

        " Options: {{{
            " Set up the completion type to use
            let g:SuperTabDefaultCompletionType = "context"
        " }}}
    " }}}

    " Fugitive: {{{
        " Autocommands: {{{
            if has("autocmd")
                autocmd BufReadPost fugitive://* set bufhidden=delete
            endif
        " }}}

        " Options: {{{
            set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
        " }}}
    " }}}

    " Session: {{{
        " Options: {{{
            let g:session_command_aliases = 1
            let g:session_autoload = 'yes'
            let g:session_default_to_last = 1
            let g:session_autosave = 'yes'
        " }}}
    " }}}

    " Taglist: {{{
        " Mappings: {{{
            nmap <F6> :TlistToggle<CR>
        " }}}   

        " Options: {{{
            let Tlist_Exit_OnlyWindow = 1
        " }}}
    " }}}

    " FuzzyFinder: {{{
        " Autocommands: {{{
        " }}}

        " Mappings: {{{
        " }}}

        " Options: {{{
        " }}}
    " }}}
" }}}

