"         
"  ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"  ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"  ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"  ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
" 
"   => MARIO Says hello to world 
"
" ===========================================================================

set path+=**
set title
set scrolloff=10
set autoindent
set wildmenu
set number
set cursorline
set mouse=a
set noswapfile
set tabstop=4 shiftwidth=4  expandtab autoindent smartindent
set showcmd
set t_Co=256
set background=dark
set termguicolors
syntax on
set laststatus=2
filetype plugin on
" set foldmethod=syntax
" set foldcolumn=1
" set foldlevelstart=99
" set colorcolumn=80

" Ingore files" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Vim-Plug init ================================================================
" instal vim plug if not existed
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif


"
" Attempt to Speed up Vim ======================================================
set ttyfast
set lazyredraw



" Plugins ======================================================================
call plug#begin('~/.vim/plugged')
    Plug 'mhinz/vim-startify'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'dikiaap/minimalist'
    Plug 'tpope/vim-surround'
    Plug 'alvan/vim-closetag'
    Plug 'jiangmiao/auto-pairs'
    "-------------------------------------------------     
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'ianks/vim-tsx'
    Plug 'peitalin/vim-jsx-typescript'
    "-------------------------------------------------     
    Plug 'preservim/nerdtree'
    "-------------------------------------------------     
    Plug 'vim-airline/vim-airline'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    "-------------------------------------------------     
    Plug 'nvim-lua/plenary.nvim'
    Plug 'tpope/vim-commentary'  " For commenting  gcc & gcl 
    Plug 'tpope/vim-fugitive'
    Plug 'preservim/tagbar' 
    Plug 'duane9/nvim-rg'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    call plug#end()



" Telescope ===================================================================
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules", "android", "ios",
            "assets", "yarn.lock" ,"package-lock.json" 
        }
    }
}


EOF


" Close tag Congifg ===========================================================
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }


" Startify Congifg ============================================================
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [ 
        \{'w':'~/Mario/work'},
        \{'m':'~/Mario/'},
        \{ 'i': '~/Mario/dotfiles/.config/nvim/init.vim'},
        \ ]


" Airlne config ==============================================================
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" Coc config ==================================================================
let g:coc_global_extensions = [
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-json',  
            \ 'coc-tslint-plugin',
            \ 'coc-tsserver',
            \ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-pairs'
            \ ]


" terminal colors =============================================================
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


" Colors ======================================================================

colorscheme minimalist

hi Normal ctermbg=NONE guibg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
highlight Cursor guifg=#f00 guibg=#657b83
highlight Comment cterm=italic gui=italic
set fillchars=vert:\│,eob:\ 
" autocmd ColorScheme hemisu hi Normal guibg=NONE ctermbg=NONE

" NERDTreeToggle config =======================================================
function! ToggleNERDTREE()
    NERDTreeToggle
    silent NERDTreeMirror
endfunction



"KeyBindinigs config ==========================================================
" nnoremap <C-f> <cmd>Ag<CR>
" nnoremap <C-g> :GFiles<CR>
" nnoremap <C-p> :Files<CR>
" nnoremap <C-b> :Buffers<CR>

" nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <C-f> <cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-g> :Telescope git_files<cr>
nnoremap <C-b> :Telescope buffers<cr>


" nnoremap <C-p> <CMD>Telescope find_files<CR>
nnoremap ,html :-1read $HOME/.config/nvim/snippets/skeleton.html<CR>
nnoremap ,rfc  :-1read $HOME/.config/nvim/snippets/react.js<CR>
nnoremap <C-a> ggVG
nnoremap <C-n> :call ToggleNERDTREE()<CR>
nnoremap <C-s> :w<CR>
nnoremap t :bn<CR>



autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" MAP ESCAPE TO CAPS LOCK in vim
" Coc config ==================================================================
au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
