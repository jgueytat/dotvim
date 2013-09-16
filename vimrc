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

        " Get the directory of the current buffer :
        cnoremap %% <C-R>=expand('%:h').'/'<CR>
    " }}}

    " Options: {{{
        set nocompatible

        " Highlight search
        set hlsearch

        " Setup tabs
        set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

        " Get colors
        syntax on
        colorscheme desert

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
        set tags=./tags;
        set tags+=~/.vim/tags/Qt.tags;
        set tags+=~/.vim/tags/STL.tags;
    " }}}
    
    " Functions: {{{
    "    " Set all tab settings at once :
    "    " Function: :Stab
    "    command! -nargs=* Stab call Stab()
    "    function! Stab()
    "        let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    "        if l:tabstop > 0
    "            let &l:tabstop     = l:tabstop
    "            let &l:softtabstop = l:tabstop
    "            let &l:shiftwidth  = l:tabstop
    "        endif
    "    endfunction
    " }}}
" }}}

" Vim Plugins: {{{
    " Emmet: {{{
    " }}}

    " OmniCppComplete: {{{
        if has("autocmd") && exists("+omnifunc") 
            autocmd Filetype *
                \ if &omnifunc == "" |
                \    setlocal omnifunc=syntaxcomplete#Complete |
                \ endif 
        endif 
        let OmniCpp_SelectFirstItem = 2
        let OmniCpp_MayCompleteScope = 1
    " }}}

    " CtrlP: {{{
    " }}}

    " Fugitive: {{{
    " }}}

    " Gundo: {{{
        nmap <F5> :GundoToggle<CR>
    " }}}

    " Pathogen: {{{
        runtime plugins-available/pathogen/autoload/pathogen.vim
        call pathogen#infect('plugins-enabled/{}')
    " }}}

    " Session: {{{
        let g:session_autoload = 'no'
    " }}}

    " TagBar: {{{
        nmap <F8> :TagbarToggle<CR>
    " }}}
" }}}

