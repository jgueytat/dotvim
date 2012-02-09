" /Shortcut to find the defined shortcuts.
" /Function to find the defined functions.

" !! Pathogen plugin:
" {
    runtime plugins/pathogen/autoload/pathogen.vim
    call pathogen#infect('plugins')
" }

" Basics :
" {
    " Autocommands
    " {
        if has("autocmd")
            filetype plugin indent on
            autocmd BufWritePost .vimrc source $MYVIMRC
        endif
    " }
    
    " Settings
    " {
        set nocompatible
        set hlsearch
        set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
        syntax on
        set number
        set mouse=a
        set hidden
        colorscheme torte
        set tags+=~/.vim/tags/cpp.tags
        set tags+=~/.vim/tags/Qt.tags
        setlocal omnifunc=syntaxcomplete#Complete
    " }
    
    " Shortcuts and Functions
    " {
        " :help :mksession
        " :nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/
        " map <C-F12> :!ctags -R -I --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
        
        
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
" }

" !! Gundo plugin :
" {
    " Open/Close the undo window :
    " Shortcut: F5
    
    nmap <F5> :GundoToggle<CR>
" }

" !! Unimpaired plugin :
" {
"   " Move lines up and down :
"   " Shortcut: ctr + up/down
"   
"   nmap <C-Up> [e
"   nmap <C-Down> ]e
"   vmap <C-Up> [egv
"   vmap <C-Down> ]egv
" }

" !! Supertab plugin :
" {
    " Run the command :SuperTabHelp to switch to another completion method
    " Shortcut: F6

    nmap <F6> :SuperTabHelp<CR>

    " Set up the default completion method
    let g:SuperTabDefaultCompletionType = "context"
" }

" !! OmniCppComplete plugin:
" {
    if has("autocmd")
        autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
    endif
" }

" !! Fugitive plugin:
" {
    if has("autocmd")
        autocmd BufReadPost fugitive://* set bufhidden=delete
    endif

    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" }

