set shell=/bin/zsh
set nocompatible
set clipboard+=unnamed,autoselect
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
	call dein#add('cocopon/iceberg.vim')
  call dein#add('scrooloose/nerdtree')
	call dein#add('Shougo/dein.vim')
	call dein#add('Shougo/neocomplcache.vim')
	call dein#add('Shougo/neocomplcache-rsense.vim')
	call dein#add('Yggdroot/indentLine')
	call dein#add('bronson/vim-trailing-whitespace')
	call dein#add('tpope/vim-fugitive')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('cohama/lexima.vim')
	"call dein#add('rhysd/clever-f.vim')
	call dein#add('tpope/vim-commentary')
	" neocomplcacheの設定
	 " Disable AutoComplPop.
	 let g:acp_enableAtStartup = 0

	 " Use neocomplcache.
	 let g:neocomplcache_enable_at_startup = 1

	 " Use smartcase.
	 let g:neocomplcache_enable_smart_case = 1

	 " Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	 let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

	 let g:neocomplcache_enable_camel_case_completion = 1
	 let g:neocomplcache_enable_underbar_completion = 1


	 " Rsense用の設定
	 if !exists('g:neocomplcache_omni_patterns')
	     let g:neocomplcache_omni_patterns = {}
	     endif
	     let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
	     autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

	     "rsenseのインストールフォルダがデフォルトと異なるので設定
	     let g:rsenseHome = expand("/usr/bin/rsense")
	     let g:rsenseUseOmniFunc = 1

			 " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

 "その他のカスタム設定を以下に書く
colorscheme iceberg

"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " 見た目系
 " 行番号を表示
 set number
 " 行末の1文字先までカーソルを移動できるように
 set virtualedit=onemore
 " インデントはスマートインデント
 set smartindent
 " ビープ音を可視化
 set visualbell
 " 括弧入力時の対応する括弧を表示
 set showmatch
 " ステータスラインを常に表示
 set laststatus=2
 " コマンドラインの補完
 set wildmode=list:longest
 " 折り返し時に表示行単位での移動できるようにする
 nnoremap j gj
 nnoremap k gk
 " シンタックスハイライトの有効化
 syntax enable

 " Tab系 " 不可視文字を可視化(タブが「▸-」と表示される) set list listchars=tab:\▸\- " Tab文字を半角スペースにする set expandtab
 " 行頭以外のTab文字の表示幅（スペースいくつ分）
 set tabstop=2
 " 行頭でのTab文字の表示幅
 set shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " 検索系
 " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
 set ignorecase
 " 検索文字列に大文字が含まれている場合は区別して検索する
 set smartcase
 " 検索文字列入力時に順次対象文字列にヒットさせる
 set incsearch
 " 検索時に最後まで行ったら最初に戻る
 set wrapscan
 " 検索語をハイライト表示
 set hlsearch
 " ESC連打でハイライト解除
 nmap <Esc><Esc> :nohlsearch<CR><Esc>
 "クリップボード
 set clipboard+=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "最後のカーソル位置を復元
 if has("autocmd")
   autocmd BufReadPost *.py
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \ exe "normal!" g'\"" |
         \ endif
 endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * execute 'NERDTree'
nnoremap <silent><C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"分割、タブ機能など

