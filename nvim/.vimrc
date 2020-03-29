syntax on
filetype on

set ttyfast " faster redrawing
se mouse+=a
set autoread
set belloff=all           " don't flash
set splitbelow            " split below, not above
set splitright            " split right, not left
set scrolloff=12          " Keep 10 lines above/below cursor
set backspace=indent,eol,start "make backspace work
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set cmdheight=1
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<Esc>', 'n') ==# ''
  nnoremap <silent> <Esc> :nohlsearch<CR><C-L>
endif
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

set foldmethod=indent "syntax highlighting items specify folds
set foldlevelstart=99 "start file with all folds opened

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

call plug#begin('~/.vim/plugged')
 
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
" Plug 'jremmen/vim-ripgrep'
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'peitalin/vim-jsx-typescript'
Plug 'groenewege/vim-less'
Plug 'alvan/vim-closetag'
Plug 'liuchengxu/vista.vim'
" Plug 'suy/vim-context-commentstring'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'json', 'markdown', 'yaml', 'html'] }

call plug#end()

" set background=dark
" set background=light
colorscheme gruvbox

let g:closetag_filenames = '*.html,*.jsx,*.tsx'

let mapleader = " "
" nnoremap <leader>h :wincmd h<CR>
" nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>k :wincmd k<CR>
" nnoremap <leader>l :wincmd l<CR>
" set pastetoggle=<leader>u
" nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" nnoremap <silent> j gj
" nnoremap <silent> k gk
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

inoremap <C-p> <C-r>"

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

noremap <leader><leader> :q<CR>
noremap <leader>s :w<CR>

" Change text without putting the text into register,
nnoremap c "_c
nnoremap cc "_cc

" copy content to system clipboard in normal mode and visual mode
nnoremap <leader>\ "+y
vnoremap <leader>\ "+y

" set terminal tab title to project name
let &titlestring = " " . expand("%:p")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

" autocmd BufEnter * let &titlestring = ' ' . expand("%:p:h:t")
let &titlestring = ' ' . expand("%:p:h:t")
set title



" --------------- YCM config start ------------------------
" nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
" nnoremap <silent> <Leader>gr :YcmCompleter GoToReferences<CR>

" set completeopt=menu,menuone
" let g:ycm_add_preview_to_completeopt = 0

" let g:ycm_key_list_select_completion = ['j', '<TAB>']
" let g:ycm_key_list_previous_completion = ['k', '<S-TAB>']
" let g:ycm_key_invoke_completion = '<c-f>'
" --------------- YCM config end ------------------------



" --------------- ripgrep config start ------------------------
" nnoremap <Leader>ps :Rg<SPACE>
if executable('rg')
  let g:rg_derive_root='true'
endif
" --------------- ripgrep config end ------------------------









" --------------- ctrlp config start ------------------------
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0
" --------------- ctrlp config start ------------------------









" --------------- ultisnips config start ------------------------
let g:UltiSnipsExpandTrigger='<c-c>'
" --------------- ultisnips config end ------------------------









" ------------------ NERDTree config start -----------------
map <C-n> :NERDTreeToggle<CR>
nmap <silent> <leader>u :NERDTreeFind<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
" ------------------ NERDTree config end -----------------




" ---------------- prettier config start ------------------
noremap <leader>p :PrettierAsync<CR>
" ---------------- prettier config end ------------------








" ---------------- easymotion config start ------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map jj <Plug>(easymotion-j)
" map kk <Plug>(easymotion-k)
" ---------------- easymotion config end ------------------








" ---------------- terminal config start ------------------
noremap <leader>t :belowright split <bar> terminal <CR> i
" ---------------- terminal config end ------------------







" --------------- coc config start ------------------------
" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> j
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr>k pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
inoremap <expr> k pumvisible() ? "\<C-p>" : "k"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-f> to trigger completion.
inoremap <silent><expr> <c-f> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" --------------- coc config end ------------------------











" --------------- lightline config start ------------------------
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
" --------------- lightline config end ------------------------












" --------------- fzf config end ------------------------
 let g:fzf_layout = { 'window': 'call FloatingFZF()' }
 function! FloatingFZF()
   let buf = nvim_create_buf(v:false, v:true)
   call setbufvar(buf, '&signcolumn', 'no')

   let height = float2nr(&lines * 0.4) " 40% of screen
   let width = float2nr(&columns * 0.8) " 70% of screen
   let horizontal = float2nr((&columns - width) / 2)
   let vertical = float2nr(&lines * 0.2) " space to top: 10%

   let opts = {
         \ 'relative': 'editor',
         \ 'row': vertical,
         \ 'col': horizontal,
         \ 'width': width,
         \ 'height': height,
         \ 'anchor': 'NW',
         \ 'style': 'minimal'
         \ }

   call nvim_open_win(buf, v:true, opts)
 endfunction



nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Rg<Cr>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <silent> <C-f>b :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <C-f>g :call FZFOpen(':Rg')<CR>
nnoremap <silent> <C-f>c :call FZFOpen(':Commands')<CR>
nnoremap <silent> <C-f>l :call FZFOpen(':BLines')<CR>
nnoremap <silent> <C-f>s :call FZFOpen(':GFiles?')<CR>
nnoremap <silent> <C-p> :call FZFOpen(':GFiles')<CR>

tnoremap <Esc><Esc> <C-c>
" --------------- fzf config end ------------------------









" --------------- vista config start ------------------------
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
nmap <Leader>v :Vista!!<CR>
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
" --------------- vista config end ------------------------
