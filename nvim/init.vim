call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-commentary'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'evanleck/vim-svelte', {'branch': 'main'}
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'wuelnerdotexe/vim-astro'
	Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
	Plug 'romgrk/barbar.nvim'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm i' }
	Plug 'github/copilot.vim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

" Set color scheme to gruvbox
colorscheme gruvbox

" Make :split below of current buffer
set splitbelow

" Set encoding to UTF-8
set encoding=UTF-8

" Line numbers
set number
set relativenumber

" Padding to cursor pos
set scrolloff=10

" Set tab size to 4
set autoindent
set noexpandtab
set shiftwidth=2
set tabstop=2
set tabline=2
set nowrap

" Map barbar
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

" Map NvimTree toggle
noremap <C-b> :NvimTreeToggle<CR>

" Map Telescope
noremap <C-p> :Telescope find_files<CR>

" Map Telescope live grep
noremap <C-f> :Telescope live_grep<CR>

" Setup terminal
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

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
require("toggleterm").setup{}
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
