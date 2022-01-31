call plug#begin()

Plug 'Lokaltog/neoranger'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'editorconfig/editorconfig-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vhoyer/vim-vue', { 'branch': 'add-support-for-gridsome-graphql' } " Plug 'posva/vim-vue'
Plug 'ruanyl/vim-gh-line'
Plug 'sheerun/vim-polyglot'
Plug 'simnalamburt/vim-mundo'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'wakatime/vim-wakatime'

" script making
Plug 'junegunn/vader.vim'
Plug 'tpope/vim-scriptease'

call plug#end()

" enable ftplugings
filetype plugin on
