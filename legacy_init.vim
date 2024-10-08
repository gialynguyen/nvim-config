syntax on

set termguicolors

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" For MacOS Ventura
if filereadable("/opt/homebrew/bin/fish")
  set shell=/opt/homebrew/bin/fish
endif

if exists('+termguicolors') && $TERM_PROGRAM != "Apple_Terminal"
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

runtime OPT general.vim
runtime OPT mapping.vim
runtime OPT abbreviation.vim
runtime OPT colors.vim
runtime OPT packs.vim

lua require('nvim')
" lua require('plugins')
lua require('lazy-pkg-m')
lua require('lsp')
lua require('keymap')

augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=none
augroup END


nnoremap <silent><leader>gt <Cmd>FloatermNew --title=lazy-git lazygit<CR>
inoremap <silent><leader>gt <Cmd>FloatermNew --title=lazy-git lazygit<CR>

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-\> <Cmd>ToggleTermToggleAll<CR>

nnoremap <silent><c-\> <Cmd>ToggleTermToggleAll<CR>
inoremap <silent><c-\> <Esc><Cmd>ToggleTermToggleAll<CR>

" Close popup
map Q <C-w><C-w>q

inoremap <C-a> <ESC>la
inoremap <C-d> <ESC>ha

nnoremap <leader>d "_d
nnoremap <leader>c "_c
vnoremap <leader>d "_d
vnoremap <leader>c "_c

nnoremap <silent> <ESC> :nohlsearch<cr>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark

colorscheme tokyonight
" gruvbox-material
" let g:gruvbox_material_background = 'medium'
" let g:gruvbox_material_better_performance = 1
" let g:gruvbox_material_enable_italic = 1

" everforest
" let g:everforest_background = 'hard'
" let g:everforest_better_performance = 1

set autoread
au CursorHold * checktime
autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc
autocmd BufNewFile,BufRead *.astro setlocal filetype=astro
autocmd BufNewFile,BufRead *.mdx setlocal filetype=markdown
autocmd User TelescopePreviewerLoaded setlocal wrap
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js silent! EslintFixAll

if filereadable(glob("~/.config/nvim/user-settings.lua"))
  lua require('user-settings')
endif
