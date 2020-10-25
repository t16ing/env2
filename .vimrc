" Modeline and Metadata
" vim: set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab textwidth=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" Maintainer:
"           ____  __   _   ____  _  _  ___
"          (_  _)/  ) / ) (_  _)( \( )/ __)
"            )(   )( / _ \ _)(_  )  (( (_-.
"           (__) (__)\___/(____)(_)\_)\___/
"
" Description:
"
"   A single, self-satisfied, personal .vimrc for general configurations, plugins bundles, themes, and more.
"   Customization for a sensible, comfortable, light and powerful editor environment.
"
" References:
"
"   - https://vi.stackexchange.com/questions/16037/vim-swap-file-best-practices
"

" General {

    " This must be first, because it changes other options as a side effect.
    set nocompatible

    " Sets how many lines of history VIM has to remember
    set history=1000

    " Encoding settings, compatible with Windows files in Chinese
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,gb18030,utf-16,big5
    set termencoding=utf8

    " Set to auto read when a file is changed from the outside
    set autoread
    au FocusGained,BufEnter * checktime

    " do not keep a backup file
    set nobackup

    " set swap folder to .vim/swap
    set directory^=$HOME/.vim//

    " opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
    set hid

    " Don't redraw while executing macros (good performance config)
    set lazyredraw

    " Show key combinations
    set showcmd

    " With a map leader it's possible to do extra key combinations
    " have to apply leader map remapping before any leader key is used
    if 1
        let mapleader = ","
    endif

" }

" User Interface {

    " Display options; cursor, line, column, menu, etc... {

        " set line to cursor
        set so=7

        " precede each line with its line number
        set nu

        " show the cursor position all the time
        set ruler

        " Highlight the text line of the cursor.
        set cursorline

        " Set to 1 to add a bit extra margin to the left
        set foldcolumn=0

        " Turn on the Wild menu
        set wildmenu

        " Always show status line = 2
        set laststatus=2

    " }

    " Search matches and patterns {

        " Ignore case when searching
        set ignorecase

        " When searching try to be smart about cases
        set smartcase

        " Also switch on highlighting the last used search pattern.
        set hlsearch

        " do incremental searching
        set incsearch

        " For regular expressions turn magic on
        set magic

        " Show matching brackets when text indicator is over them
        set showmatch
        " How many tenths of a second to blink when matching brackets
        set mat=2

        " Disable highlight by <leader>/
        map <silent> <leader>/ :noh<cr>

    " }

    " Move around between lines, buffers, windows, tabs {

        " allow backspacing over everything in insert mode
        set backspace=indent,eol,start
        set whichwrap+=<,>,h,l

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

        " switch between buffers, useful with multi-tabs
        map <leader>l :bn<cr>
        map <leader>h :bp<cr>

        " Always show tabline = 2
        set showtabline=2

        " Windows creation and deletion
        map <leader>- :set splitbelow<cr>:split<cr>
        map <leader>\| :set splitright<cr>:vsplit<cr>
        map Q <c-w>q

    " }

" }

" Formatting {

    " always set autoindenting on
    set autoindent
    set smartindent
    set wrap

    " modern indent: 1 tab = 4 spaces, use space instead
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set smarttab

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " modeline only take effect in first 2 lines or last 2 lines
    set modeline
    set modelines=2

" }

" Editing {

    " Toggle paste mode on and off
    map <leader>pp :setlocal paste!<cr>

    " Share clipboard with system
    set clipboard=unnamedplus

    " Turn on spell checking
    set spell

    " Pressing <leader>ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>

    " sn: next typo
    map <leader>sn ]s
    " sp: previous typo
    map <leader>sp [s
    " sa: add typo to dict
    map <leader>sa zg
    " s?: list all typo
    map <leader>s? z=

" }

" Skip plugins and advanced settings for vim-tiny or vim-small {
	if !1 | finish | endif
" }

" Advanced Settings {

    " Show the line number relative to the line with the cursor (syntax highlight performance impacted) {
        set rnu
    " }

    " Visual mode pressing * or # searches for the current selection {
        vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
        vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

        " helper function for current selection {
        function! CmdLine(str)
            call feedkeys(":" . a:str)
        endfunction

        function! VisualSelection(direction, extra_filter) range
            let l:saved_reg = @"
            execute "normal! vgvy"

            let l:pattern = escape(@", "\\/.*'$^~[]")
            let l:pattern = substitute(l:pattern, "\n$", "", "")

            if a:direction == 'gv'
                call CmdLine("Ack '" . l:pattern . "' " )
            elseif a:direction == 'replace'
                call CmdLine("%s" . '/'. l:pattern . '/')
            endif

            let @/ = l:pattern
            let @" = l:saved_reg
        endfunction
        " }
    " }

    " syntax {
        " Switch syntax highlighting on
        syntax on

        " Enable filetype plugins
        filetype plugin on
        filetype indent on
    " }

    " highlight unwanted space {
        highlight ExtraWhitespace ctermbg=red guibg=red
        autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
        match ExtraWhitespace /\s\+$/
        autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
        autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match ExtraWhitespace /\s\+$/
        autocmd BufWinLeave * call clearmatches()
    " }

    " set persistent undo {
        if !isdirectory("~/.vim/undodir")
            silent !mkdir -p ~/.vim/undodir
        endif
        try
            set undodir=~/.vim/undodir
            set undofile
            set undolevels=1000
            set undoreload=10000
        catch
        endtry
    " }

" }

" Plugins manager: vim-plug {

    " Benefits: on-demand loading, parallel installation/update
    " https://github.com/junegunn/vim-plug
    " ~/.vim/autoload/plug.vim

    " install vim-plug automatically {

        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

    " }

    call plug#begin('~/.vim/bundle')

    " Plugins - General {

        Plug 't16ing/vim-vandomkeyhint'
        Plug 'vim-airline/vim-airline'
        Plug 'mhinz/vim-startify'

    " }

    " Plugins - Files {

        Plug 'scrooloose/nerdtree'
          " <leader>nn open nerdtree window. <leader>nf find current file in nerdtree.'
        Plug 'Xuyuanp/nerdtree-git-plugin'
          " git notation for nerdtree
        Plug 'ctrlpvim/ctrlp.vim'
          " c-p for ctrlp, <leader>p for MRU, <leader>o for buffer window
        Plug 'mileszs/ack.vim', {'on': 'Ack'}
          " <leader>g code search tool

    " }

    " Plugins - Navigation {

        Plug 't16ing/vim-vookmark'
          " mm mn mp ml to toggle, move, list bookmarks
        Plug 'Lokaltog/vim-easymotion'
          " <leader><leader>w forward move <leader><leader>b backward move
        Plug 'terryma/vim-expand-region'
          " Press + to expand the visual selection and _ to shrink it.
        Plug 'gregsexton/MatchTag'
          " Highlights the matching HTML tags
        Plug 'kshenoy/vim-signature'
          " Visible mark (m-*)

    " }

    " Plugins - Coding {

        Plug 'dense-analysis/ale'
          " Visible ERROR and warning
        Plug 'tpope/vim-fugitive'
          " <leader>gb git blame <leader>gl git log
        Plug 'airblade/vim-gitgutter'
          " <leader>gt Visible git sign <]c> for next hunk, <[c> for previous hunk.
        Plug 'majutsushi/tagbar'
          " <leader>tt open tag bar, ctags required
        Plug 'vim-scripts/L9'
          " required by vim-autocomplpop
        Plug 'othree/vim-autocomplpop'
          " Auto trigger complete popup menu.
        Plug 'luochen1990/rainbow'
          " rainbow parentheses {[()]}

    " }

    " Plugins - filetypes {

        Plug 'davidhalter/jedi-vim', {'for': 'python'}
          " Auto-complete for python

        Plug 'nikvdp/ejs-syntax', {'for': 'ejs'}
          " syntax for ejs
        Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
          " syntax for ts

        " have to load early, otherwise not working
        Plug 'hushicai/tagbar-javascript.vim'
          " tagbar for js
        Plug 'moll/vim-node'
          " gf in node.js require(...)

    " }

    " Plugins - Editing {

        Plug 'junegunn/vim-easy-align'
          " select, ENTER, =, =
        Plug 'tpope/vim-commentary'
          " gcc to comment out a line, gcap to comment out a paragraph
        Plug 'junegunn/vim-peekaboo'
          " extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers

    " }

    " Plugins - Themes {

        Plug 'vim-airline/vim-airline-themes'
          " airline theme dark/onedark
        Plug 'flazz/vim-colorschemes'
          " colorscheme gruvbox/PaperColor with dark background
        " TODO: a lag-fixed fork of 'tiagofumo/vim-nerdtree-syntax-highlight', change back to upstream if PR is merged.
        Plug 'tarlety/vim-nerdtree-syntax-highlight'
          " color highlights for nerdtree
        Plug 'ryanoasis/vim-devicons'
          " icons plugin for nerdtree

    " }

    call plug#end()
"}

" Plugins Configs {

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vandomkeyhint {
    " ~/.vim/bundle/vim-vandomkeyhint/autoload/vandomkeyhint.vim
    " This has to be prior than any VkhAdd command
    " Has to be done here to avoid following "VkhAdd" from leading to error
    let vkh_readme=expand('~/.vim/bundle/vim-vandomkeyhint/README.md')
    if !filereadable(vkh_readme)
      echo "Installing vandomkeyhint.."
      echo ""
      silent !mkdir -p ~/.vim/bundle/vim-vandomkeyhint
      silent !git clone https://github.com/t16ing/vim-vandomkeyhint ~/.vim/bundle/vim-vandomkeyhint
    endif
    set rtp+=~/.vim/bundle/vim-vandomkeyhint/
    call vandomkeyhint#rc()

    VkhAdd 'plugin vandomkeyhint: Vim plugin to install and show user-defined hints.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-signature {
    " ~/.vim/bundle/vim-signature/doc/signature.txt
    VkhAdd 'plugin vim-signature: A plugin to toggle, display and navigate vim marks.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin nerdtree {
    " ~/.vim/bundle/nerdtree/doc/NERDTree.txt

    let g:NERDTreeQuitOnOpen = 1
    let g:NERDTreeGitStatusWithFlags = 1
    let g:NERDTreeIgnore = ['^node_modules$']
    let g:NERDTreeWinSize = 32

    map <leader>nn <ESC>:NERDTreeToggle<CR>
    map <leader>nf <ESC>:NERDTreeFind<CR>

    VkhAdd 'plugin nerdtree: A tree explorer plugin to rule the Vim world.'
    VkhAdd '<leader>nn open nerdtree window. <leader>nf find current file in nerdtree.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-nerdtree-syntax-highlight {
    " ~/.vim/bundle/vim-nerdtree-syntax-highlight/README.md

    " nerdtree with vim-nerdtree-syntax-highlight is slow
    " try https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/issues/17
    " and https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/issues/6

    " To improve syntax highlighting scroll performance, try this
    " https://github.com/vim/vim/issues/1735
    set regexpengine=1
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-devicons {
    " ~/.vim/bundle/vim-devicons/README.md
    " issue:
    "  https://github.com/ryanoasis/vim-devicons/issues/274
    " screenshot:
    "  https://user-images.githubusercontent.com/24741314/60797287-939f2d80-a1a1-11e9-8e18-a19d3a5b1711.png
    " fix:
    "  https://github.com/ryanoasis/vim-devicons/issues/274#issuecomment-513560707
    let g:rainbow_conf = {
          \    'separately': {
          \       'nerdtree': 0
          \    }
          \}
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin bookmark {
    " ~/.vim/bundle/vim-vookmark/README.md

    let g:vookmark_savepath = $HOME.'/.vim/vookmark'

    VkhAdd 'plugin vim-vookmark: <mm> toggle a bookmark <mn> next <mp> previous <ml> list'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-easymotion {
    " ~/.vim/bundle/vim-easymotion/README.md
    VkhAdd 'plugin vim-easymotion: <leader><leader>w jump forward <leader><leader>b jump backward.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-expand-region {
    " ~/.vim/bundle/vim-expand-region/README.md
    VkhAdd "plugin vim-expand-region: `+` to expand the visual selection and `_` to shrink it."
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin autocomplpop {
    " ~/.vim/bundle/vim-autocomplpop/doc/acp.txt
    " L9 library must be installed
    " ~/.vim/bundle/L9/README

    highlight Pmenu term=reverse ctermbg=cyan ctermfg=black
    highlight PmenuSel term=reverse ctermbg=lightred ctermfg=black

    VkhAdd 'plugin vim-autocomplpop: Automatically opens popup menu for completions, requires L9.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin ctrlp {
    " ~/.vim/bundle/ctrlp.vim/doc/ctrlp.txt

    let g:ctrlp_max_files=0
    let g:ctrlp_use_caching=1
    let g:ctrlp_clear_cache_on_exit=1
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

    map <leader>o :CtrlPBuffer<CR>

    VkhAdd 'ctrlp.vim: <c-p> open ctrlp window. <leader>o open buffer window.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin ale {
    " ~/.vim/bundle/ale/README.md

    let g:ale_linters = {
    \   'javascript': ['jshint'],
    \   'python': ['pylint'],
    \   'go': ['go', 'golint', 'errcheck']
    \}

    nmap <silent> <leader>a <Plug>(ale_next_wrap)

    " Disabling highlighting
    let g:ale_set_highlights = 0

    " Only run linting when saving the file
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0

    VkhAdd 'plugin ale: Syntax checking.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin tagbar {
    " ~/.vim/bundle/tagbar/doc/tagbar.txt
    " plugin tagbar: requires apt install exuberant-ctags.
    " ~/.vim/bundle/tagbar-javascript.vim/README.md
    " plugin tagbar-javascript.vim: requires npm install -g esctags.

    let g:tagbar_autofocus   = 1
    let g:tagbar_autoclose   = 0
    let g:tagbar_autoshowtag = 1
    let g:tagbar_width = 32

    map <leader>tt <ESC>:TagbarToggle<CR>

    VkhAdd '<leader>tt to open Tagbar window.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-fugitive & plugin gitgutter {
    " ~/.vim/bundle/vim-gitgutter/doc/gitgutter.txt
    " ~/.vim/bundle/vim-fugitive/doc/fugitive.txt

    let g:gitgutter_enabled         = 1
    let g:gitgutter_highlight_lines = 0

    let g:my_git_view_type=''

    map <leader>gt <ESC>:GitGutterToggle<CR>
    map <leader>gb <ESC>:Gblame<CR>
    map <leader>gl <ESC>:Gllog<CR>

    VkhAdd "plugin vim-gitgutter: shows a git diff in the 'gutter' (sign column)"
    VkhAdd "<leader>gt A Vim plugin which shows a git diff in the 'gutter' (sign column)."
    VkhAdd '<]c> for next hunk, <[c> for previous hunk.'

    VkhAdd 'plugin vim-fugitive: for Gblame and Glog'
    VkhAdd '<leader>gb brings up an interactive vertical split with git blame output.'
    VkhAdd '<leader>gl brings up commit history.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin easy_align {
    " ~/.vim/bundle/vim-easy-align/README.md
    " ~/.vim/bundle/vim-easy-align/EXAMPLES.md

    let g:easy_align_delimiters = {
          \ '>': { 'pattern': '>>\|=>\|>' },
          \ '/': { 'pattern': '//\+\|/\*\|\*/', 'ignore_groups': ['String'] },
          \ '#': { 'pattern': '#\+', 'ignore_groups': ['String'] },
          \ ']': {
          \     'pattern':       '[[\]]',
          \     'left_margin':   0,
          \     'right_margin':  0,
          \     'stick_to_left': 0
          \   },
          \ ')': {
          \     'pattern':       '[()]',
          \     'left_margin':   0,
          \     'right_margin':  0,
          \     'stick_to_left': 0
          \   }
          \ }

    vnoremap <silent> <Enter> :LiveEasyAlign<Enter>

    VkhAdd 'plugin vim-easy-align: (visual mode) <Enter>=='
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-commentary {
    " ~/.vim/bundle/vim-commentary/README.markdown
    VkhAdd 'plugin vim-commentary: gcc for single line or gcap for a paragraph.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin MatchTag {
    " ~/.vim/bundle/MatchTag/README.mkd

    " no options, and only works on html/xml ft
    " example: ~/.vim/bundle/MatchTag/test.html
    "
    VkhAdd 'plugin MatchTag: highlights the matching HTML tag.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " alternate plugin for clean mode for copy/paste {

    function MY_PROC_CLEAN_MODE_TOGGLE()
      if ! exists('g:my_clean_mode_toggle')
        let g:my_clean_mode_toggle=0
      endif

      if g:my_clean_mode_toggle == 0
        set paste
        set nonu
        set signcolumn=no
        let g:my_clean_mode_toggle=1
      else
        set nopaste
        set nu
        set signcolumn=yes
        let g:my_clean_mode_toggle=0
      endif
    endfunction

    map <leader>cc <ESC>:call MY_PROC_CLEAN_MODE_TOGGLE()<CR>

    VkhAdd '<leader>cc enter/leave clean mode.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin startify {
    " ~/.vim/bundle/vim-startify/doc/startify.txt

    let g:startify_session_persistence=1
    map <leader>s :Startify<CR>

    VkhAdd 'plugin vim-startify: <leader>ss open the fancy start screen for Vim. :SSave to save session.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-airline {
    " ~/.vim/bundle/vim-airline/README.md

    let g:airline_extensions         = ['branch', 'tabline', 'cursormode', 'hunks', 'quickfix', 'ale']
    let g:airline_theme              = 'onedark'
    let g:airline_highlighting_cache = 1
    let g:airline_powerline_fonts    = 1

    nmap gn <Plug>AirlineSelectNextTab
    nmap gp <Plug>AirlineSelectPrevTab
    nmap g1 <Plug>AirlineSelectTab1
    nmap g2 <Plug>AirlineSelectTab2
    nmap g3 <Plug>AirlineSelectTab3
    nmap g4 <Plug>AirlineSelectTab4
    nmap g5 <Plug>AirlineSelectTab5
    nmap g6 <Plug>AirlineSelectTab6
    nmap g7 <Plug>AirlineSelectTab7
    nmap g8 <Plug>AirlineSelectTab8
    nmap g9 <Plug>AirlineSelectTab9

    VkhAdd "plugin vim-airline: Lean & mean status/tabline for vim that's light as air."
    VkhAdd 'gn to move to next tab, gp to move to previous tab, [0-9]gt to move to tab n.'
    VkhAdd 'gr refresh tabs - unfold all buffers to tabs, g[1-9] to move to tab n.'
    VkhAdd '<c-o> jump backward. <c-i> jump forward.'
    VkhAdd ':tabe to create new tab. :tabc to close current tab.'
    VkhAdd 'gf to open file in the same tab. <c-w>gf to open file in new tab. <c-w>f to open file in new window.'
    VkhAdd '<leader>- or <leader>| to splie window. Q to close window.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin jedi-vim {
    " ~/.vim/bundle/jedi-vim/doc/jedi-vim.txt
    VkhAdd 'plugin jedi-vim: awesome Python autocompletion with Vim'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-colorschemes {
    " ~/.vim/bundle/vim-colorschemes/README.md

    set t_Co=256
    colorscheme PaperColor
    set background=dark
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin rainbow {
    " ~/.vim/bundle/rainbow/README.md

    let g:rainbow_active = 1

    VkhAdd 'plugin rainbow: help you read complex code by showing diff level of parentheses in diff color'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin ack.vim {
    " ~/.vim/bundle/ack.vim/README.md

    map <expr> <leader>g ':Ack '.expand('<cword>').'<cr>'

    VkhAdd 'plugin ack.vim: source code search tool. <leader>g to search code.'
    " }

" }
