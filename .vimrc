" Modeline and Metadata
" vim: set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab textwidth=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" Maintainer:
"           ____  __   _   ____  _  _  ___
"          (_  _)/  ) / ) (_  _)( \( )/ __)
"            )(   )( / _ \ _)(_  )  (( (_-.
"           (__) (__)\___/(____)(_)\_)\___/
"
" Description:
"
"   All in one .vimrc for personal configurations.
"   Customization for sensible, comfortable, light and powerful editor environment.
"

" Skip all configurations and plugins for vim.tiny {
    if !1 | finish | endif
" }

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
    let mapleader = ","

    " Open the vimrc file anytime
    noremap <LEADER>rc :e ~/.vimrc<CR>

    " Tab to Space
    nnoremap <LEADER>tt :%s/\t/    /g
    vnoremap <LEADER>tt :s/\t/    /g

" }

" User Interface {

    " Display options; cursor, line, column, menu, etc... {

        " set line to cursor
        set so=7

        " precede each line with its line number
        set nu

        " Show the line number relative to the line with the cursor (syntax highlight performance impacted)
        set rnu

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

        " Visual mode pressing * or # searches for the current selection
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
        endfunction " }

        " Disable highlight by <leader>/
        map <silent> <leader>/ :noh<cr>

    " }

    " Move around of lines {

        " allow backspacing over everything in insert mode
        set backspace=indent,eol,start
        set whichwrap+=<,>,h,l

        " Faster in-line navigation
        noremap W 5w
        noremap B 5b

        " Ctrl + U and D to scroll without moving cursor
        noremap <c-u> 5<c-y>
        noremap <c-d> 5<c-e>

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    " }

    " Move around between buffers, windows, and tabs {

        " Buffer switching
        nmap gn :bn<cr>
        nmap gp :bp<cr>

        " ,bt to open buffer in tab; ,bc to close tab; ,bd to close buffer
        nmap <leader>bt :tab split<cr>
        nmap <leader>bc :tabclose<cr>
        nmap <leader>bd :bd<cr>

        " beauty windows separator
        set fillchars+=vert:\│

        " Windows creation and deletion
        map <c-w>- :set splitbelow<cr>:split<cr>
        map <c-w>\| :set splitright<cr>:vsplit<cr>
        map <c-w>\ :set splitright<cr>:vsplit<cr>
        map Q <c-w>q

        " Windows resizing
        map <up> :res+1<cr>
        map <down> :res-1<cr>
        map <left> :vertical res-5<cr>
        map <right> :vertical res+5<cr>

        " Always show tabline = 2
        set showtabline=2

    " }

" }

" Formatting {

    " Switch syntax highlighting on
    syntax on

    " Enable filetype plugins
    filetype plugin on
    filetype indent on

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

    " fold by indent and fold by default
    set foldmethod=indent
    set foldlevel=10

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When off lines will not wrap and only part of long lines will be displayed
    set nowrap

    " modeline only take effect in first 2 lines or last 2 lines
    set modeline
    set modelines=2

    " highlight unwanted space
    highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

    " make indent faster
    nnoremap < <<
    nnoremap > >>

" }

" Editing {

    " copy/paste and undo {

        " Toggle paste mode on and off
        map <leader>pp :setlocal paste!<cr>

        " Share clipboard with system
        set clipboard=unnamedplus

        " set persistent undo
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

    " spell {

        " Turn on spell checking
        set spell

        " Pressing <leader>ss will toggle and untoggle spell checking
        noremap <leader>ss :setlocal spell!<cr>

        " sn: next typo
        noremap <leader>sn ]s
        " sp: previous typo
        noremap <leader>sp [s
        " sa: add typo to dict
        noremap <leader>sa zg
        " sc: fix typo
        noremap <leader>sc a<c-x>s<esc>
        " s?: list all typo
        noremap <leader>s? z=
        "
    " }

" }

" Misc {

    " next placeholder <++> <++> <++>
    noremap <LEADER><SPACE> <Esc>/<++><CR>:nohlsearch<CR>c4l

    " opening a terminal window
    noremap <LEADER>T :set splitbelow<CR>:split<CR>:res -10<CR>:term<CR>i

    " call figlet
    noremap tx :r !figlet -f pagga 

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
          " randomly pick keybindings hint and show in the message bar
        Plug 'mhinz/vim-startify'
          " <leader>S open the fancy start screen for Vim. :SSave to save session.

    " }

    " Plugins - lightline family {

        Plug 'itchyny/lightline.vim'
          " Lean & mean status/tabline for vim that's light as air.
        Plug 'mengelbrecht/lightline-bufferline'
          " gn to next buffer, gp to previous buffer, g[1-9] to buffer n
        Plug 'sinetoami/lightline-hunks'
        Plug 'maximbaz/lightline-ale'

    " }

    " Plugins - Files {

        Plug 'scrooloose/nerdtree'
          " <leader>nn open nerdtree window. <leader>nf find current file in nerdtree.'
        Plug 'Xuyuanp/nerdtree-git-plugin'
          " git notation for nerdtree
        Plug 'ctrlpvim/ctrlp.vim'
          " <c-p> for ctrlp, <leader>o for buffer window
        Plug 'mileszs/ack.vim', {'on': 'Ack'}
          " <leader>f code search tool

    " }

    " Plugins - Navigation {

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
          " Visible ERROR and warning, <c-j> for next error, <c-k> for previous error.
        Plug 'tpope/vim-fugitive'
          " <leader>gb git blame <leader>gl git log
        Plug 'airblade/vim-gitgutter'
          " <leader>gt Visible git sign <]c> for next hunk, <[c> for previous hunk.
        Plug 'majutsushi/tagbar'
          " tt to open tag bar; ctags required
        Plug 'vim-scripts/L9'
          " required by vim-autocomplpop
        Plug 'othree/vim-autocomplpop'
          " Auto trigger complete popup menu.
        Plug 'luochen1990/rainbow'
          " rainbow parentheses {[()]}
        Plug 'nathanaelkane/vim-indent-guides'
          " visually displaying indent levels

    " }

    " Plugins - filetypes {

        Plug 'davidhalter/jedi-vim', {'for': 'python'}
          " Auto-complete for python

        Plug 'nikvdp/ejs-syntax', {'for': 'ejs'}
          " syntax for ejs
        Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
          " syntax for ts

        Plug 'hushicai/tagbar-javascript.vim'
          " tagbar for js; have to load early, otherwise not working
        Plug 'moll/vim-node'
          " gf in node.js require(...)

        Plug 'jamessan/vim-gnupg'
          " transparent editing of gpg encrypted files: ".gpg", ".pgp" or ".asc" suffix

    " }

    " Plugins - Editing {

        Plug 'junegunn/vim-easy-align'
          " select, ENTER, =, =
        Plug 'tpope/vim-commentary'
          " gcc to comment out a line, gcap to comment out a paragraph
        Plug 'junegunn/vim-peekaboo'
          " extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers
        Plug 'mbbill/undotree'
          " visualizes undo history, <leader>u to open undo tree
        Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
          " <leader>tm to start automatic table creator & formatter
        Plug 'Ron89/thesaurus_query.vim'
          " <leader>cs to lookup synonyms of any word under cursor or phrase covered in visual mode, and replace it with an user chosen synonym
        Plug 'mg979/vim-visual-multi'
          " ctrl+N to select words, n to confirm, q to skip

    " }

    " Plugins - Themes {

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

    " marks key mappings
    let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'ToggleMarkAtLine'   :  "mm",
        \ 'PurgeMarks'         :  "m<Space>",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "mN",
        \ 'GotoPrevMarker'     :  "mP",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListBufferMarks'    :  "ml",
        \ 'ListBufferMarkers'  :  "mL"
        \ }

    " highligh for markers
    let g:SignatureMarkerLineHL = "QuickFixLine"

    " When a line has both marks and markers, display the sign for markers
    let g:SignaturePrioritizeMarks = 0

    VkhAdd 'plugin vim-signature: A plugin to toggle, display and navigate vim marks.'
    VkhAdd 'mark: mm toggle a mark, mn/mp motion, ml list, m<space> clear all'
    VkhAdd 'marker: m[0-9] toggle a marker, mN/mP motion, mL list, m<BS> clear all'
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
    \ 'javascript': ['jshint'],
    \ 'python': ['pylint', 'python'],
    \ 'go': ['go', 'golint', 'errcheck'],
    \}

    " navigate between errors quickly
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)

    " specify what text should be used for signs
    let g:ale_sign_error = 'ER'
    let g:ale_sign_warning = 'WA'

    " default is 200 ms, increase to 5s to save battery power
    let g:ale_lint_delay = 5000

    " pyhon default mode, set 'indent' to 2 space, and other stuff.
    autocmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab smarttab textwidth=100

    VkhAdd 'plugin ale: Syntax checking. c-k, c-j to navigate errors.'
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

    map tt <ESC>:TagbarToggle<CR>

    VkhAdd 'tt to open Tagbar window.'
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
        set norelativenumber
        set signcolumn=no
        let g:my_clean_mode_toggle=1
      else
        set nopaste
        set nu
        set relativenumber
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

    " Define your own header. {
    let g:ascii = [
        \ '  ____  __   _   ____  _  _  ___',
        \ ' (_  _)/  ) / ) (_  _)( \( )/ __)',
        \ '   )(   )( / _ \ _)(_  )  (( (_-.',
        \ '  (__) (__)\___/(____)(_)\_)\___/',]
    let g:startify_custom_header =
        \ 'startify#pad(g:ascii + startify#fortune#boxed())'
    " }

    " Startify displays lists. Each list consists of a `type` and optionally a `header` and custom `indices`. {
    let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
    " }

    " hardcoded files or directories that will always be shown
    let g:startify_bookmarks = [ '~/.vimrc', '~/.zshrc', '~/.tmux.conf' ]

    " The directory to save/load sessions to/from.
    let g:startify_session_dir = '~/.vim/session'

    " Automatically update sessions
    let g:startify_session_persistence=1

    " updates oldfiles on-the-fly, so that :Startify is always up-to-date.
    let g:startify_update_oldfiles = 0

    " Unicode box-drawing characters will be used instead.
    let g:startify_fortune_use_unicode = 1

    " anytime <leader>S to launch Startify
    map <leader>S :Startify<CR>

    VkhAdd 'plugin vim-startify: <leader>S open the fancy start screen for Vim. :SSave to save session.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin lightline.vim {
    " ~/.vim/bundle/lightline.vim/README.md
    " plugin lightline-bufferline
    " ~/.vim/bundle/lightline-bufferline/README.md
    " plugin lightline-hunks
    " ~/.vim/bundle/lightline-bufferline/README.md
    " plugin lightline-ale
    " ~/.vim/bundle/lightline-ale/README.md

    " lightline {
    let g:lightline = {
        \ 'colorscheme': 'PaperColor',
        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
        \ }
    let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste', 'spell' ],
        \           [ 'modified' ],
        \           [ 'hunks', 'readonly', 'relativepath' ],
        \ ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'filetype', 'fileencoding', 'fileformat' ],
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
        \ ] }
    let g:lightline.component_function = {
        \ 'hunks': 'lightline#hunks#composer',
        \ }
    let g:lightline.tabline = {
        \ 'left': [ [ 'buffers' ] ],
        \ 'right': [ [ 'tabs' ] ] }
    let g:lightline.component_expand = {
        \ 'buffers': 'lightline#bufferline#buffers',
        \ 'linter_checking': 'lightline#ale#checking',
        \ 'linter_infos': 'lightline#ale#infos',
        \ 'linter_warnings': 'lightline#ale#warnings',
        \ 'linter_errors': 'lightline#ale#errors',
        \ 'linter_ok': 'lightline#ale#ok',
        \ }
    let g:lightline.component_type = {
        \ 'buffers': 'tabsel',
        \ 'linter_checking': 'right',
        \ 'linter_infos': 'right',
        \ 'linter_warnings': 'warning',
        \ 'linter_errors': 'error',
        \ 'linter_ok': 'right',
        \ }
    " }

    " statusline for |CtrlP|, |Tagbar| buffers. {
    let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }
    function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
      return lightline#statusline(0)
    endfunction
    function! CtrlPStatusFunc_2(str)
      return lightline#statusline(0)
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'
    function! TagbarStatusFunc(current, sort, fname, ...) abort
      return lightline#statusline(0)
    endfunction
    " }

    " icons as ale indicators {
    let g:lightline#ale#indicator_checking = "..."
    let g:lightline#ale#indicator_infos = "\uf129 "
    let g:lightline#ale#indicator_warnings = "\uf071 "
    let g:lightline#ale#indicator_errors = "\uf05e "
    let g:lightline#ale#indicator_ok = ""
    " }

    " `-- INSERT --` is unnecessary anymore because the mode information is displayed in the statusline.
    set noshowmode

    " lighline#bufferline {

        " `2`: Ordinal number (buffers are numbered from _1_ to _n_ sequentially)
        let g:lightline#bufferline#show_number = 2

        " to use unicode superscript numerals for ordinal number
        let g:lightline#bufferline#number_map = {
        \ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
        \ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}

        " Enables the usage of [vim-devicons](https://github.com/ryanoasis/vim-devicons) to display a filetype icon for the buffer.
        let g:lightline#bufferline#enable_devicons = 1

        " Enables the usage of [nerdfont.vim](https://github.com/lambdalisue/nerdfont.vim) to display a filetype icon for the buffer.
        let g:lightline#bufferline#enable_nerdfont = 1

        " the symbols `+`, `-` and `...` are replaced by `✎`, `` and `…`.
        let g:lightline#bufferline#unicode_symbols = 1

    " }

    " This plugin provides Plug mappings to switch to buffers using their ordinal number in the bufferline {
    nmap g1 <Plug>lightline#bufferline#go(1)
    nmap g2 <Plug>lightline#bufferline#go(2)
    nmap g3 <Plug>lightline#bufferline#go(3)
    nmap g4 <Plug>lightline#bufferline#go(4)
    nmap g5 <Plug>lightline#bufferline#go(5)
    nmap g6 <Plug>lightline#bufferline#go(6)
    nmap g7 <Plug>lightline#bufferline#go(7)
    nmap g8 <Plug>lightline#bufferline#go(8)
    nmap g9 <Plug>lightline#bufferline#go(9)
    " }

    VkhAdd "plugin vim-airline: Lean & mean status/tabline for vim that's light as air."
    VkhAdd '<c-o> jump backward. <c-i> jump forward.'
    VkhAdd '<leader>- or <leader>| to splie window. Q to close window.'
    VkhAdd ',bt to open buffer in tab; ,bc to close current tab; ,bd to close buffer'
    VkhAdd 'gn to next buffer, gp to previous buffer, g[1-9] to move to tab n'
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
    map <expr> <leader>f ':Ack '.expand('<cword>').'<cr>'
    VkhAdd 'plugin ack.vim: source code search tool. <leader>f to search code.'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-peekaboo {
    " ~/.vim/bundle/vim-peekaboo/README.md
    VkhAdd '" or @ in normal mode and <CTRL-R> in insert mode to see the contents of the registers'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin undotree {
    " ~/.vim/bundle/undotree/README.md

    " change windows layout for bigger diff area
    let g:undotree_WindowLayout = 2

    " get focus after being opened
    let g:undotree_SetFocusWhenToggle = 1

    " to toggle the undo-tree panel
    nnoremap <leader>u :UndotreeToggle<cr>

    VkhAdd 'plugin undotree: visualizes undo history, <leader>u to open undo tree'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-indent-guides {
    " ~/.vim/bundle/vim-indent-guides/README.markdown

    " have indent guides enabled by default
    let g:indent_guides_enable_on_vim_startup = 1

    " customize the size of the indent guide
    let g:indent_guides_guide_size = 1

    " Use this option to control which indent level to start showing guides from.
    let g:indent_guides_start_level = 2

    " Use this option to specify a list of filetypes to disable the plugin for.
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']

    VkhAdd 'plugin vim-indent-guides: visually displaying indent levels'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-table-mode {
    " ~/.vim/bundle/vim-table-mode/README.md
    VkhAdd 'plugin vim-table-mode: <leader>tm to start automatic table creator & formatter'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin thesaurus_query.vim {
    " ~/.vim/bundle/thesaurus_query.vim/README.md
    VkhAdd 'plugin thesaurus_query.vim: <leader>cs to lookup synonyms of any word under cursor or phrase covered in visual mode, and replace it with an user chosen synonym'
    " }

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " plugin vim-visual-multi {
    " ~/.vim/bundle/vim-visual-multi/README.md
    VkhAdd 'plugin vim-visual-multi: ctrl+N to select words, n to confirm, q to skip'
    " }

" }
