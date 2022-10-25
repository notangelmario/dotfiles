call plug#begin()
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'romgrk/barbar.nvim'
	Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

" Make :split below of current buffer
set splitbelow

" Set encoding to UTF-8
set encoding=UTF-8

" Line numbers
set number
set relativenumber

" Set tab size to 4
set autoindent
set noexpandtab
set shiftwidth=4
set tabstop=4
set tabline=4
set nowrap

" Map NvimTree toggle
noremap <C-n> :NvimTreeToggle<CR>

" Setup terminal
noremap <C-\> :split +term<CR>
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd TermOpen * startinsert
autocmd TermOpen * horizontal resize 8
augroup rc
au!
au TermOpen * setlocal nobuflisted
augroup END

" Enable copying to system clipboard
set clipboard+=unnamedplus

" Coc Setup
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
endif


" Setup lua modules
lua << END
require("nvim-tree").setup()

require('lualine').setup()

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)


END
