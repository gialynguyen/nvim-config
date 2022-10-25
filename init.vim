runtime OPT general.vim
runtime OPT mapping.vim
runtime OPT abbreviation.vim
runtime OPT colors.vim

lua require('nvim')
lua require('plugins')

" Buffer navigation
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

nnoremap <leader>q :bp<CR>:bd #<CR>
nnoremap <leader>Q :bp<CR>:bd #<CR><C-w>q
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l   :bnext<CR>
command! BufCurOnly execute '%bdelete|edit#|bdelete#'
nnoremap <leader>w :call DeleteHiddenBuffers()<CR>

nnoremap <Leader>1 :lua require("nvim-smartbufs").goto_buffer(1)<CR>
nnoremap <Leader>2 :lua require("nvim-smartbufs").goto_buffer(2)<CR>
nnoremap <Leader>3 :lua require("nvim-smartbufs").goto_buffer(3)<CR>
nnoremap <Leader>4 :lua require("nvim-smartbufs").goto_buffer(4)<CR>
nnoremap <Leader>5 :lua require("nvim-smartbufs").goto_buffer(5)<CR>
nnoremap <Leader>6 :lua require("nvim-smartbufs").goto_buffer(6)<CR>
nnoremap <Leader>7 :lua require("nvim-smartbufs").goto_buffer(7)<CR>
nnoremap <Leader>8 :lua require("nvim-smartbufs").goto_buffer(8)<CR>
nnoremap <Leader>9 :lua require("nvim-smartbufs").goto_buffer(9)<CR>

nnoremap <Leader>c1 :lua require("nvim-smartbufs").close_buffer(1)<CR>
nnoremap <Leader>c2 :lua require("nvim-smartbufs").close_buffer(2)<CR>
nnoremap <Leader>c3 :lua require("nvim-smartbufs").close_buffer(3)<CR>
nnoremap <Leader>c4 :lua require("nvim-smartbufs").close_buffer(4)<CR>
nnoremap <Leader>c5 :lua require("nvim-smartbufs").close_buffer(5)<CR>
nnoremap <Leader>c6 :lua require("nvim-smartbufs").close_buffer(6)<CR>
nnoremap <Leader>c7 :lua require("nvim-smartbufs").close_buffer(7)<CR>
nnoremap <Leader>c8 :lua require("nvim-smartbufs").close_buffer(8)<CR>
nnoremap <Leader>c9 :lua require("nvim-smartbufs").close_buffer(9)<CR>

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
let g:gruvbox_material_background = 'medium' 
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
let g:gruvbox_material_enable_italic = 1

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
map ' <Plug>Sneak_,


" Close popup
map Q <C-w><C-w>q

inoremap <C-a> <ESC>la
inoremap <C-e> <ESC>
nnoremap <C-e> <ESC>
vnoremap <C-e> <ESC>

nnoremap <leader>d "_d
nnoremap <leader>c "_c
vnoremap <leader>d "_d
vnoremap <leader>c "_c

" let g:indent_blankline_char_list = ['¦', '┆', '┊']

lua require('lsp')
lua require('keymap')

syntax on
autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc
autocmd BufNewFile,BufRead *.astro setlocal filetype=astro
autocmd BufNewFile,BufRead *.mdx setlocal filetype=markdown

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set expandtab
set nowrap
set nolist
set linebreak
set fillchars=eob:\ 

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

runtime OPT packs.vim
