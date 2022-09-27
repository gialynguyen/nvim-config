runtime OPT general.vim
runtime OPT mapping.vim
runtime OPT abbreviation.vim
runtime OPT colors.vim

lua require('nvim')
lua require('plugins')

" Buffer navigation
nnoremap <leader>q :bp<cr>:bd #<cr>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l   :bnext<CR>
command! BufCurOnly execute '%bdelete|edit#|bdelete#'
nnoremap <leader>w :BufCurOnly<CR>

nnoremap <silent><leader>1 <Cmd>LualineBuffersJump 1<CR>
nnoremap <silent><leader>2 <Cmd>LualineBuffersJump 2<CR>
nnoremap <silent><leader>3 <Cmd>LualineBuffersJump 3<CR>
nnoremap <silent><leader>4 <Cmd>LualineBuffersJump 4<CR>
nnoremap <silent><leader>5 <Cmd>LualineBuffersJump 5<CR>
nnoremap <silent><leader>6 <Cmd>LualineBuffersJump 6<CR>
nnoremap <silent><leader>7 <Cmd>LualineBuffersJump 7<CR>
nnoremap <silent><leader>8 <Cmd>LualineBuffersJump 8<CR>
nnoremap <silent><leader>9 <Cmd>LualineBuffersJump 9<CR>
nnoremap <silent><leader>$ <Cmd>LualineBuffersJump -1<CR>

let g:floaterm_autoclose = 1
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_keymap_toggle = '<F3>'
let g:floaterm_keymap_new    = '<F2>'
let g:floaterm_keymap_prev   = '<F4>'
let g:floaterm_keymap_next   = '<F5>'

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
      \ tnoremap <silent><c-y> <Cmd>ToggleTermToggleAll<CR>

nnoremap <silent><c-y> <Cmd>ToggleTermToggleAll<CR>
inoremap <silent><c-y> <Esc><Cmd>ToggleTermToggleAll<CR>

runtime OPT nvim-treesitter.vim
runtime OPT telescope.nvim
runtime OPT telescope-file-browser.nvim
runtime OPT lualine.nvim

packadd vim-matchup
packadd is.vim
packadd vim-sneak
packadd gruvbox-material
packadd nvim-autopairs
packadd vim-sandwich

let g:loaded_matchit = 1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'hard' 
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
let g:gruvbox_material_enable_italic = 1

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
map ' <Plug>Sneak_,

inoremap <C-a> <ESC>la
inoremap <C-e> <ESC>
vnoremap <C-e> <ESC>
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" let g:indent_blankline_char_list = ['¦', '┆', '┊']

lua require('lsp')
lua require('keymap')

syntax on
autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab
set nowrap

set fillchars=eob:\ 

runtime OPT packs.vim
