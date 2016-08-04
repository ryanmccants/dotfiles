syntax on
set number
filetype indent plugin on
set background=dark
au BufRead /tmp/mutt-* set tw=72

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'derekwyatt/vim-scala', { 'for': 'scala'}

Plug 'ensime/ensime-vim', { 'for': 'scala'}

Plug 'scrooloose/syntastic'

Plug 'tpope/vim-surround'

Plug 'kien/rainbow_parentheses.vim'

Plug 'shougo/deoplete.nvim'

Plug 'raimondi/delimitmate'

Plug 'chrisbra/csv.vim'

call plug#end()
