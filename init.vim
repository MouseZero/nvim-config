" Indent -------------------------------
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Notes --------------------------------
" How to change the language of a file
" :setfiletype html
"
"Spell checker
" :set spell
" : ]s
" z=
"
" Go to file that your cursor is on
" gt
"
" Go to website
" gx

" vim-plug ------------------------------
" To install use 
" `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
call plug#begin('~/.vim/plugged')
  " Plugins
	"Plug 'dense-analysis/ale'
  "Plug 'morhetz/gruvbox'
	Plug 'github/copilot.vim'
	Plug 'sainnhe/edge'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
	Plug 'samoshkin/vim-mergetool'
	Plug 'airblade/vim-gitgutter'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'jreybert/vimagit'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
	Plug 'tpope/vim-fugitive'
	"Plug 'SirVer/ultisnips'
	Plug 'tpope/vim-rhubarb'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'xml'] }
	Plug 'junegunn/fzf'
	Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" General ------------------------------

let mapleader = "\<Space>"
syntax on
set background=dark
"colorscheme gruvbox
colorscheme edge

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>mm :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>mb :wincmd =<cr>

" -----Git Gutter-----
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1

" -----Terminal Keymapping-----
tnoremap <esc> <C-\><C-n>

" -----Normal Mode Keymapping-----
xnoremap <leader>yy "+y
nmap <leader>// :call nerdcommenter#Comment(0,"toggle")<CR>
nmap <leader>cb ^/ ]<cr>rx<esc>$A (<C-r>=strftime('%F')<cr>)<esc>:noh<cr>0
nmap <leader>cl :e ~/.clipboard.md<cr>
nmap <leader>cn ^i- [ ] <esc>0
nmap <leader>cr ^df]x<esc>0
nmap <leader>cs :noh<cr>
nmap <leader>cu ^/x]<cr>r <esc>$F(lda(<esc>$x:noh<cr>0
nmap <leader>cp :Copilot panel<cr>
nmap <leader>ee :NERDTreeToggle<CR>
nmap <leader>ef :NERDTreeFind<CR>
nmap <leader>fa :Clap grep<cr>
nmap <leader>fc :!printf '\%s' "%" \| pbcopy<cr>
nmap <leader>ff :Clap files<cr>
nmap <leader>fw :echo @%<cr>
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nnoremap <Leader>gc :! git commit<cr> " git commit
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous
nnoremap <leader>gP :! git push<CR>  " git Push
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)
nnoremap <Leader>gb :Git blame<CR>  " git blame
nnoremap <Leader>gB :GBrowse<CR>
vnoremap <Leader>gB :GBrowse<CR>
nmap <leader>gd :terminal git diff %<cr>
nmap <leader>gh :terminal git log %<cr>
nmap <leader>gl :terminal git log<cr>
nnoremap <leader>gs :Magit<CR>
nmap <leader>lw :resize 30<cr> "large window
nmap <leader>is :set expandtab \| set shiftwidth=4 \| set softtabstop=4 \| set tabstop=4<cr>
nmap <leader>it :set expandtab! \| set shiftwidth=2 \| set softtabstop=2 \| set tabstop=2<cr>
nmap <leader>no :e ~/.note.md<cr>
nmap <leader>nps :split<cr><C-w>j:resize 7<cr> "new pane small
nmap <leader>pi :PlugInstall<cr>
nmap <leader>pf :Prettier<cr>
nmap <leader>pp "+p
nmap <leader>pr :PlugClean<cr>
nmap <leader>sa ggVG
nmap <leader>sp :split<cr>
nmap <leader>snf :T tectonic test functional<cr>
nmap <leader>sw :resize 7<cr> "smaller window
nmap <leader>tnb :tabnew<cr> "tab new blankPage
nmap <leader>tnc :tabnew %<cr> "tab new currentPage
nmap <leader>tne :split<cr><C-w>j:Tnew<cr>:resize 7<cr>
nmap <leader>tfc ipwd<cr><esc>k
nmap <leader>trl :TREPLSendLine<cr>
nmap <leader>trf :TREPLSendFile<cr>
nmap <leader>to :e ~/.todo.md<cr>
nmap <leader>ve :e $MYVIMRC<cr>
nmap <leader>vl :source $MYVIMRC<cr>
nmap <leader>vs :vsplit<cr>
nmap <leader>wi :!code ~/OneDrive\ -\ ServiceNow/wiki<cr>
nmap <leader>ww :close<cr>
nmap <leader>zi :set foldmethod=indent<CR>
nmap <leader>zm :set foldmethod=manual<CR>
nmap j gj
nmap k gk
" visual mode
vmap <leader>// :call nerdcommenter#Comment(0,"toggle")<CR>
vmap <leader>pf :PrettierPartial<cr>
vmap <leader>trs :TREPLSendSelection<cr>


" Insert Mode Keymapping
imap ;;ct <c-r>=strftime('%c')<CR>
imap ;;td - Defect<CR><tab>- <c-r>=strftime('%c')<CR>
imap ;;te - Email and Messaging<CR><tab>- <c-r>=strftime('%c')<CR>
imap ;;tl - Lunch<CR><tab>- <c-r>=strftime('%c')<CR>
imap ;;tm - Meeting<CR><tab>- <c-r>=strftime('%c')<CR>
imap ;;to - Clock Out<CR><tab>- <c-r>=strftime('%c')<CR>
imap ;;tr - Code Review<CR><tab>- <c-r>=strftime('%c')<CR>
imap ;;ts - Story<CR><tab>- <c-r>=strftime('%c')<CR>
imap ;;tt - Triage<CR><tab>- <c-r>=strftime('%c')<CR>
imap ;jk <esc>

" General Editor
" :set relativenumber
:set number

" More generals ------------------------------

" ---- Utilisnips ----
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories="/Users/russell.murray/.config/nvim/UltiSnips"

" Conquer Of Completion ------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=4000

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
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

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
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

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

" ---- tpope/vim-rhubarb ----
let g:github_enterprise_urls = ['https://code.devsnc.com']

" Theme --------------------------------
hi StatusLine ctermbg=0 ctermfg=8

let NERDTreeShowHidden=1

" -----Ale Linting-----
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" NERDComment
let g:NERDCreateDefaultMappings = 0
