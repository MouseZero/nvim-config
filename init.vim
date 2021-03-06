" vim-plug ------------------------------
" To install use 
" `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
call plug#begin('~/.vim/plugged')
  " Plugins
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-surround'
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'editorconfig/editorconfig-vim'
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
  Plug 'samoshkin/vim-mergetool'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
	Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
		\ 'tag': '0.1.155',
    \ 'do': 'bash install.sh',
    \ }
	Plug 'junegunn/fzf'
	Plug 'ionide/Ionide-vim', {
		\ 'do':  'make fsautocomplete',
		\}
call plug#end()

" General ------------------------------

let mapleader = "\<Space>"
syntax on
set background=dark
colorscheme gruvbox

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>mm :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>mb :wincmd =<cr>

" -----Normal Mode Keymapping-----
xnoremap <leader>yy "+y
nmap <leader>// :call NERDComment(0,"toggle")<CR>
nmap <leader>cb ^/ ]<cr>rx<esc>$A (<C-r>=strftime('%F')<cr>)<esc>:noh<cr>
nmap <leader>cl :e ~/.clipboard.md<cr>
nmap <leader>cn ^i- [ ] <esc>$
nmap <leader>cr ^df]x<esc>$
nmap <leader>cs :noh<cr>
nmap <leader>cu ^/x]<cr>r <esc>$F(lda(<esc>$x:noh<cr>
nmap <leader>ee :NERDTreeToggle<CR>
nmap <leader>ef :NERDTreeFind<CR>
nmap <leader>fa :Clap grep<cr>
nmap <leader>fc :! printf '\%s' "%" \| pbcopy<cr>
nmap <leader>ff :Clap files<cr>
nmap <leader>fn :echo @%<cr>
nmap <leader>is :set expandtab \| set shiftwidth=4 \| set softtabstop=4 \| set tabstop=4<cr>
nmap <leader>it :set expandtab! \| set shiftwidth=2 \| set softtabstop=2 \| set tabstop=2<cr>
nmap <leader>no :e ~/.note.md<cr>
nmap <leader>pi :PlugInstall<cr>
nmap <leader>pp "+p
nmap <leader>pr :PlugClean<cr>
nmap <leader>sp :split<cr>
nmap <leader>sw "xdiwdwep"xp<cr>
nmap <leader>th :e ./hide/think.md<cr>
nmap <leader>tn :tabnext<cr>
nmap <leader>to :e ~/.todo.md<cr>
nmap <leader>tp :tabprevious<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>ve :e $MYVIMRC<cr>
nmap <leader>vl :source $MYVIMRC<cr>
nmap <leader>vs :vsplit<cr>
nmap <leader>ww :close<cr>
nmap <leader>zi :set foldmethod=indent<CR>
nmap <leader>zm :set foldmethod=manual<CR>
nmap j gj
nmap k gk
" visual mode
vmap <leader>// :call NERDComment(0,"toggle")<CR>
vmap <leader>pf :PrettierPartial<cr>

" Insert Mode Keymapping
imap jk <esc>

" General Editor
:set relativenumber
:set number

" More generals ------------------------------

" Conquer Of Completion ------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Theme --------------------------------
hi StatusLine ctermbg=0 ctermfg=8

" Indent -------------------------------
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

