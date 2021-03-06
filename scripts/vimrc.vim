" For mapping a key combination to copy the contents of a template base file. 
" Use command \cc in normal vim mode to copy contents.
nnoremap <leader>cc :0r  ~/summer18/hcup/t.cpp <CR>

" If you're in insert mode, use <C-o> to perform an action of block mode without pressing <Esc>. 
" For example, <C-o> :w is the same as <Esc>:w<CR>i.
" Insert the result of a command with :r !<your cmd> or :. ! <your cmd>
" For auto entering
" autocmd BufNewFile *.cpp r ~/prog/base.cpp
" Read http://stackoverflow.com/questions/726894/what-are-the-dark-corners-of-vim-your-mom-never-told-you-about

" Mapping Ctrl + s for save
" Requires 'stty -ixon' to be written in bashrc (to disable control flow)
nmap <C-S> :w <CR>
imap <C-S> <Esc> :w <CR>

" Ctrl + V is used for paste, visual block is now Ctrl + Q
" Mapping system clipboard cut copy paste replace
vmap <C-X> "+x
vmap <C-C> "+y
nmap <C-V> "+p
imap <C-V> <Esc><C-V>
vmap <C-V> d"+P

" Commands when shift remaing pressed while pressing quit / write
:command WQ wq
:command Wq wq
:command W w
:command Q q

" For navigating tabs like other applications
nmap <C-PageDown> gt
nmap <C-PageUp> gT
nmap <C-T> :tabnew <Space>

" Open new panes to right and bottom
set splitright
set splitbelow

" Direct navigation in split mode
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Left> <C-W><Left>

" Trying to close
nmap <C-E> ZZ
nmap <C-Z> ZQ


" mapping increment/decrement
" nmap <C-I> <C-A>
" nmap <C-D> <C-X>

" Select All option, conflicts with the increment option
nmap <C-A> ggVG

" Move by virtual lines when used without a count
" move by actual lines when used with a count
" source http://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim/21000307#21000307
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Auto Bracket completion
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" inoremap        (  ()<Left>
inoremap <expr> (  matchstr(strpart(getline('.'), col('.')-1, 1), '[0-9A-Za-z_]') == "" ? "()<Left>" : "("
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap        "  ""<Left>
inoremap        '  ''<Left>
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Place 2 spaces instead of a tab
filetype plugin indent on
syntax on
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set softtabstop=2

set shiftround " when shifting a non-aligned set of lines, align them to the next tabstop
set nu         " show line numbers
set relativenumber " relative line numbers
set cursorline " underline current line
set colorcolumn=80 " 80 character limit

" while scrolling keep cursor at the middle
set scrolloff=999

" Fold using indentation
set foldmethod=indent
nmap fm :set foldmethod=manual <CR>
" Unfold all in beginning
set foldlevel=99
" Shortcut for fold, place inside the block and then <F-9> to toggle
" In case of manual fold, select lines and press <F-9>
nmap <F9> za
omap <F9> <C-C>za
vmap <F9> zf
nmap <F10> zR

set hlsearch  " highlight all matching entries
set incsearch " search as you type
set smartcase " smartcase search

" Taken from Misof's vimrc: https://people.ksp.sk/~misof/programy/vimrc.html 

" if I press <tab> in command line, show me all options if there is more than one
set wildmenu

" y and d put stuff into system clipboard (so that other apps can see it)
""set clipboard=unnamed,unnamedplus

" while typing a command, show it in the bottom right corner
set showcmd

" enough with the @@@s, show all you can if the last displayed line is too long
set display+=lastline
" show chars that cannot be displayed as <13> instead of ^M
set display+=uhex

" some tweaks taken from vimbits.com:
" reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv
" make Y behave like other capitals 
map Y y$
" force saving files that require root permission 
cmap w!! %!sudo tee > /dev/null %

" Indentation may cause trouble in pasting blocks of programs. 
" Use :set paste while pasting and :set nopaste to exit paste mode

" *** Plugin managers I use ***
" Pathogen, Vundle
" *** plugins I use
" syntastic, NERDTree, airline, NERDTree-git, solarized colors,
" indentline, ack (silver-searcher), fzf, vim-fugitive
" TODO use ctrlp, vim-snippets, vim-codefmt, yapf | neovim spacemacs etc
""execute pathogen#infect()
""let g:pathogen_disables = ['syntastic']

" start NerdTree on startup and start in main window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" project specific indentation
augroup ProjectSetup
""au BufRead,BufEnter /home/saurav/summer17/gsoc/* set shiftwidth=3 expandtab softtabstop=3
""au BufRead,BufEnter /home/saurav/summer17/gsoc set shiftwidth=3 expandtab softtabstop=3
augroup END

" Setting NERDTree Window Size
let g:NERDTreeWinSize=20
" Toggle hidden files show using I
" let NERDTreeShowHidden=1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Cgrep Ack!

if has("gui_running")
  set guioptions-=T     " no menu bar
  set guioptions-=r     " no scorllbar on right
  set guioptions-=l     " no scorllbar on left 
  set lines=35
  set columns=120
  set guifont=Monospace\ 10.5
  set linespace=5       " increased line spacing as underscore was not visible
  " air-line
  let g:airline_powerline_fonts = 0
  autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
  " display math symbols in bold
  "autocmd FileType tex nmap <LocalLeader>h :highlight Conceal gui=bold guifg=blue<CR>
  ""autocmd FileType tex :colorscheme solarized
  ""autocmd FileType tex :set background=dark
  " No 80 char width in tex. Write sentence by sentence as it helps in editing
  autocmd FileType tex :set colorcolumn=
else
  " basic raw vim
  let g:loaded_youcompleteme = 1
  ""autocmd VimEnter * SyntasticToggleMode
  autocmd VimEnter * AirlineToggle

  " dark background in guake terminal
  "https://unix.stackexchange.com/questions/170428/identify-whether-terminal-is-open-in-guake
  " needs which-terminal-emulator command in bash_aliases and ~/tmp/which-terminal-emulator.sh
  let terminal_emulator=system('/home/saurav/tmp/which-terminal-emulator.sh')
  if terminal_emulator =~ '.*guake.*$'
    set background=dark
  endif
endif

" No NERDTree by default, use fuzzy search
autocmd VimEnter * NERDTreeToggle
if exists('$TMUX')
  " Keep it simple, no nerdtree, no syntastic
  ""autocmd VimEnter * SyntasticToggleMode
  set background=dark
endif

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" fzf installation git
set rtp+=~/Downloads/fzf

" Vundle installation https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" NERDTree File Explorer
Plugin 'scrooloose/nerdtree'
"Airline
Plugin 'vim-airline/vim-airline'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" YouCompleteMe
Plugin 'valloric/youcompleteme'
" fzf vim plugin https://github.com/junegunn/fzf.vim <3 
Plugin 'junegunn/fzf.vim'
" ack.vim for ag
Plugin 'mileszs/ack.vim'
" vimtex plugin for latex
""Plugin 'lervag/vimtex'
" Solarized colorscheme
Plugin 'altercation/vim-colors-solarized'
" Indentline
Plugin 'Yggdroot/indentLine'
" From Google Codefmt https://github.com/google/vim-codefmt 
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" UltiSnips
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsListSnippets="<c-s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
filetype plugin indent on    " required

" codefmt default for Python is autopep8
autocmd FileType python let b:codefmt_formatter = 'yapf'

" display math symbols more promintently, also highlights indentline more
" prominently
autocmd FileType tex let g:indentLine_enabled = 0
autocmd FileType tex inoremap        $  $$<Left>
autocmd FileType tex inoremap        $$<CR>  $$<CR>$$<Esc>O
" conceal math symbols when cursor is on that line
" https://tex.stackexchange.com/questions/96741/vim-latex-suite-unwanted-in-editor-math-symbol-conversion
""autocmd FileType tex :set conceallevel=2 concealcursor=c
"" don't conceal, math symbols are annoying
let g:tex_conceal = ""
" vimtex compile individual files instead of only main
" https://vi.stackexchange.com/questions/14655/vimtex-commands-only-working-on-main-file
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}


" fzf vim mapping find keys
nmap <C-M-F> :Files 
" can be used to open file in different directory
" :Files DIRECTORY_NAME
nmap <C-F> :Files<CR>

" Make YouCompleteMe syntax checker
"https://stackoverflow.com/questions/24500281/youcompleteme-and-syntastic-compatibility
"
" YouCompleteMe options
"

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1


let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'


nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
