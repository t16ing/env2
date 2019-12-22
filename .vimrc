" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup   " do not keep a backup file
set history=50 " keep 50 lines of command line history
set ruler      " show the cursor position all the time
set showcmd    " display incomplete commands
set incsearch  " do incremental searching
syntax on      " Switch syntax highlighting on
set hlsearch   " Also switch on highlighting the last used search pattern.

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent  " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

"=============================================================================
" 20191219 - modern indent
autocmd FileType * setlocal ts=2 sts=2 sw=2 expandtab

" set vim working dir

let g:my_vim_tmp_dir = $VIM_TMP
if g:my_vim_tmp_dir == ""
  let g:my_vim_tmp_dir = $HOME
  exec "set backupdir=".g:my_vim_tmp_dir
  exec "set dir=".g:my_vim_tmp_dir
else
  exec "set backupdir=".g:my_vim_tmp_dir.'/backup'
  exec "set dir=".g:my_vim_tmp_dir.'/swap'
endif

" highlight unwanted space

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" modeline only take effect in first 2 lines or last 2 lines

set modeline
set modelines=2

" Avoiding escape timeout issues in vim

let &t_ti.="\e[?7727h"
let &t_te.="\e[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <C-c>

" locale settings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,utf-16,big5
set termencoding=utf8

" install vundle automatically

let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  autocmd VimEnter * exec ":BundleInstall"
endif

" plugin vundle

filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle

Bundle 'gmarik/vundle'

Bundle 't16ing/vim-vandomkeyhint'
Bundle 'mhinz/vim-startify'
Bundle 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
"-----------------------------------------------------------------------------
" code
Bundle 'scrooloose/syntastic'
  " Visible ERROR and warning
Bundle 'tpope/vim-fugitive'
  " <\gb> git blame <\gl> git log
Bundle 'airblade/vim-gitgutter'
  " <\gt> Visible git sign <]c> for next hunk, <[c> for previous hunk.
Bundle 'majutsushi/tagbar'
  " <\tb> open tag bar, ctags required
Bundle 'hushicai/tagbar-javascript.vim'
  " tagbar for js
Bundle 'vim-scripts/L9'
  " required by vim-autocomplpop
Bundle 'othree/vim-autocomplpop'
  " Auto trigger complete popup menu.
Bundle 'davidhalter/jedi-vim'
  " Auto-complete for python
Bundle 'moll/vim-node'
  " gf in node.js require(...)
Plugin 'luochen1990/rainbow'
  " rainbow parentheses {[()]}
"-----------------------------------------------------------------------------
" file
Bundle 'scrooloose/nerdtree'
  " <\nt> open nerdtree window. <\nf> find current file in nerdtree.'
Bundle 'Xuyuanp/nerdtree-git-plugin'
  " git notation for nerdtree
Bundle 'tiagofumo/vim-nerdtree-syntax-highlight'
  " highlights for nerdtree
Bundle 'ryanoasis/vim-devicons'
  " icons plugin for nerdtree
Bundle 'ctrlpvim/ctrlp.vim'
  " c-p
"-----------------------------------------------------------------------------
" navigation
Bundle 't16ing/vim-vookmark'
  " mm mn ml to toggle, move, list bookmarks
Bundle 'Lokaltog/vim-easymotion'
  " \\w forward move \\b backward move
Bundle 'terryma/vim-expand-region'
  " Press + to expand the visual selection and _ to shrink it.
Bundle 'gregsexton/MatchTag'
  " Highlights the matching HTML tags
Bundle 'kshenoy/vim-signature'
  " Visible mark (m-*)
"-----------------------------------------------------------------------------
" edit
Bundle 'vim-scripts/Gundo'
  " F6 to toggle Gundo
Bundle 'vim-scripts/Engspchk'
  " \ec start english spelling check. \ee end english spelling check.
Bundle 'junegunn/vim-easy-align'
  " select, ENTER, =, =
Bundle 'tpope/vim-commentary'
  " gcc to comment out a line, gcap to comment out a paragraph

filetype plugin indent on

" plugin vandomkeyhint
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

" plugin vim-signature
" ~/.vim/bundle/vim-signature/doc/signature.txt

VkhAdd 'plugin vim-signature: A plugin to toggle, display and navigate vim marks.'

" plugin nerdtree
" ~/.vim/bundle/nerdtree/doc/NERDTree.txt

let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

" nerdtree with vim-nerdtree-syntax-highlight is slow
" try https://github.com/ryanoasis/vim-devicons/issues/263
augroup nerdtreedisablecursorline
  autocmd!
  autocmd FileType nerdtree setlocal nocursorline
augroup end

map <leader>nt <ESC>:NERDTreeToggle<CR>
map <leader>nf <ESC>:NERDTreeFind<CR>

VkhAdd 'plugin nerdtree: A tree explorer plugin to rule the Vim world.'
VkhAdd '<\nt> open nerdtree window.'
VkhAdd '<\nf> find current file in nerdtree.'

" plugin vookmark
" ~/.vim/bundle/vim-vookmark/plugin/vookmark.vim

let g:vookmark_savepath=$HOME.'/.vim/vookmark'

VkhAdd 'plugin vim-vookmark: <mm> toggle a bookmark <mn> next <mp> previous <ma> clear all <ml> list.'

" plugin vim-easymotion
" ~/.vim/bundle/vim-easymotion/README.md

VkhAdd 'plugin vim-easymotion: \\w jump forward \\b jump backward.'

" plugin vim-expand-region
" ~/.vim/bundle/vim-expand-region/README.md

VkhAdd "plugin vim-expand-region: `+` to expand the visual selection and `_` to shrink it."

" plugin autocomplpop
" ~/.vim/bundle/vim-autocomplpop/doc/acp.txt
" L9 library must be installed
" ~/.vim/bundle/L9/README

highlight Pmenu term=reverse ctermbg=cyan ctermfg=black
highlight PmenuSel term=reverse ctermbg=lightred ctermfg=black

VkhAdd 'plugin vim-autocomplpop: Automatically opens popup menu for completions.'
VkhAdd 'plugin L9: required by plugin acp.'

" plugin ctrlp
" ~/.vim/bundle/ctrlp.vim/doc/ctrlp.txt

let g:ctrlp_max_files=0
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

VkhAdd 'plugin ctrlp.vim: Fuzzy file, buffer, mru, tag, ... finder.'
VkhAdd '<c-p> open ctrlp window.'

" plugin Gundo
" ~/.vim/bundle/Gundo/doc/gundo.txt

let g:gundo_close_on_revert=1

map <f6> <ESC>:GundoToggle<CR>

VkhAdd 'plugin Gundo: Graph your undo tree so you can actually USE it. Requires python 2.4+.'
VkhAdd '<f6> open Gundo window.'

" alternate plugin for diff modifies and origins

map <leader><f6> <ESC>:DiffOrig<CR>

VkhAdd '\<f6> open DiffOrig window (vim feature to compare modifies and origins).'

" plugin syntastic
" ~/.vim/bundle/syntastic/doc/syntastic.txt

let g:syntastic_error_symbol              = 'ER'
let g:syntastic_warning_symbol            = 'wa'
let g:syntastic_check_on_open             = 1
let g:syntastic_check_on_wq               = 1
let g:syntastic_cpp_remove_include_errors = 1

VkhAdd 'plugin syntastic: Syntax checking on the fly has never been so pimp.'

" plugin tagbar
" ~/.vim/bundle/tagbar/doc/tagbar.txt
" ~/.vim/bundle/tagbar-javascript.vim/README.md

let g:tagbar_autofocus   = 1
let g:tagbar_autoclose   = 0
let g:tagbar_autoshowtag = 1

map <leader>tb <ESC>:TagbarToggle<CR>

VkhAdd "plugin tagbar: requires apt install exuberant-ctags."
VkhAdd "plugin tagbar-javascript.vim: requires npm install -g esctags."
VkhAdd '<\tb> open Tagbar window.'

" plugin vim-fugitive & plugin gitgutter
" ~/.vim/bundle/vim-gitgutter/doc/gitgutter.txt
" ~/.vim/bundle/vim-fugitive/doc/fugitive.txt

let g:gitgutter_enabled         = 1
let g:gitgutter_highlight_lines = 0

let g:my_git_view_type=''

map <leader>gt <ESC>:GitGutterToggle<CR>
map <leader>gb <ESC>:Gblame<CR>
map <leader>gl <ESC>:Gllog<CR>

VkhAdd "plugin vim-gitgutter: shows a git diff in the 'gutter' (sign column)"
VkhAdd "<\gt> A Vim plugin which shows a git diff in the 'gutter' (sign column)."
VkhAdd '<]c> for next hunk, <[c> for previous hunk.'

VkhAdd 'plugin vim-fugitive: for Gblame and Glog'
VkhAdd '<\gb> brings up an interactive vertical split with git blame output.'
VkhAdd '<\gl> brings up commit history.'

" plugin easy_align
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

" plugin vim-commentary
" ~/.vim/bundle/vim-commentary/README.markdown

VkhAdd 'plugin vim-commentary: gcc for single line or gcap for a paragraph.'

" plugin Engspchk
" ~/.vim/bundle/Engspchk/doc/engspchk.txt
" ~/.vim/bundle/Engspchk/CVIMSYN/engspchk.usr

let g:spchksilent   = 1
let g:spchkautonext = 1

VkhAdd 'plugin Engspchk: english spelling checker.'
VkhAdd '\ec start english spelling check.'
VkhAdd '\ee end english spelling check.'

" plugin MatchTag
" ~/.vim/bundle/MatchTag/README.mkd

" no options, and only works on html/xml ft
" example: ~/.vim/bundle/MatchTag/test.html
"
VkhAdd 'plugin MatchTag: highlights the matching HTML tag.'

" alternate plugin for clean mode for copy/paste

function MY_PROC_CLEAN_MODE_TOGGLE()
  if ! exists('g:my_clean_mode_toggle')
    let g:my_clean_mode_toggle=0
  endif

  if g:my_clean_mode_toggle == 0
    set paste
    set nonu
    set nocursorline
    syntax off
    let g:my_clean_mode_toggle=1

    silent! execute ":SyntasticToggleMode"
  else
    set nopaste
    set nu
    set cursorline
    syntax on
    let g:my_clean_mode_toggle=0

    silent! execute ":SyntasticToggleMode"
  endif
endfunction

map <leader>cc <ESC>:call MY_PROC_CLEAN_MODE_TOGGLE()<CR>

VkhAdd '<\cc> enter/leave clean mode.'

" plugin startify
" ~/.vim/bundle/vim-startify/doc/startify.txt

let g:startify_session_persistence=1

map <leader>ss <ESC>:Startify<CR>

VkhAdd 'plugin vim-startify: The fancy start screen for Vim.'
VkhAdd '\ss open the fancy start screen for Vim. :SSave to save session.'

" plugin vim-airline
" ~/.vim/bundle/vim-airline/README.md

let g:airline_extensions = ['branch', 'tabline', 'cursormode', 'hunks', 'quickfix', 'syntastic']
let g:airline_theme                      = 'dark'
let g:airline_highlighting_cache         = 1
let g:airline_powerline_fonts            = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
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

set showtabline=2

VkhAdd 'gt,gn to move to next tab, gp to move to previous tab, gb to move to last focused tab.'
VkhAdd 'gr refresh tabs - unfold all buffers to tabs, g[1-9] to move to tab n.'
VkhAdd '<c-o> jump backward. <c-i> jump forward.'
VkhAdd "plugin vim-airline: Lean & mean status/tabline for vim that's light as air."

" plugin jedi-vim
" ~/.vim/bundle/jedi-vim/doc/jedi-vim.txt

VkhAdd 'plugin jedi-vim: awesome Python autocompletion with Vim'

" plugin vim-colorschemes
" ~/.vim/bundle/vim-colorschemes/README.md

colorscheme gruvbox
set bg=dark
set nu
set cursorline

" plugin rainbow
" ~/.vim/bundle/rainbow/README.md

let g:rainbow_active = 1

VkhAdd 'plugin rainbow: help you read complex code by showing diff level of parentheses in diff color'
