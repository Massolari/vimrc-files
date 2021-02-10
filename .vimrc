"*****************************************************************************
"" Configuração do Vim-Plug
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:not_finish_vimplug = "yes"

    autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

" Arquivo de plugins
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" Arquivo de plugins do usuário
if filereadable(expand("~/.vim/.myvimrc.bundles"))
    source ~/.vim/.myvimrc.bundles
endif

call plug#end()

"*****************************************************************************
"" Configurações básicas
"*****************************************************************************"
"" Encoding
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Comportamento do Tab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Busca
set ignorecase
set smartcase
if has('nvim')
    set inccommand=split
endif

" Configurações do Swap file
set nobackup
set noswapfile
set nowritebackup

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Exibição de caracteres especiais
set listchars=tab:↦\ ,nbsp:␣

" Gerenciamento de sessão
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Opções para o vim-rest-console
let g:vrc_curl_opts = {
            \ '-sS': '',
            \ '--connect-timeout': 10,
            \ '-i': '',
            \ '--max-time': 60,
            \ '-k': '',
            \}

" Formatar resposta em JSON
let g:vrc_auto_format_response_patterns = {
            \ 'json': 'python3 -m json.tool',
            \ }

" Permitir que parâmetros GET sejam declarados em linhas sequenciais
let g:vrc_split_request_body = 0

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" Configuração de leader
let mapleader="\<Space>"

" Configuração de local leader
let maplocalleader="\\"

" Habilitar itablico do gruvbox
let g:gruvbox_italic = 1

" Vimwiki fold list
let g:vimwiki_folding='list'

" Desabilitar editorconfig para fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Sneak como easymotion
let g:sneak#label=1

" Desabilitar preprocessadores para deixar arquivos .vue mais rapidos
let g:vue_disable_pre_processors=1

" Configuração do vdebug
let g:vdebug_options = {
            \   "path_maps" : {"/var/www/html": "/home/douglasmassolari/PCP"},
            \   "server" : '172.17.0.1',
            \   "port" : 9001
            \}

" Vdebug mappings
let g:vdebug_keymap = {
            \    "run" : "<Leader>dr",
            \    "run_to_cursor" : "<leader>dc",
            \    "step_over" : "<F8>",
            \    "step_into" : "<F12>",
            \    "step_out" : "<F10>",
            \    "close" : "<Leader>ds",
            \    "detach" : "<Leader>dd",
            \    "set_breakpoint" : "<Leader>db",
            \    "eval_under_cursor" : "E"
            \}

" Usar deoplete desde a inicialização
let g:deoplete#enable_at_startup = 1

" Ao abrir o tagbar atribuir o foco à ele
let g:tagbar_autofocus = 1

" The system menu file includes a "Buffers" menu.  If you don't want this, set the 'no_buffers_menu'
let no_buffers_menu=1

" Idioma para correção ortográfica
set spelllang=pt

" Enable hidden buffers
set hidden

" Disable the blinking cursor.
set gcr+=a:blinkon0

" Número mínimo de linha que deverão ser mostradas antes e depois do cursor
set scrolloff=5

" Copy/Paste/Cut from clipboard
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" Ao clicar clicar com shift + botão direito do mouse, abre-se um menu
set mousemodel=popup

" Suporte ao mouse
set mouse=a

" Mostra os números da linha de forma relativa e o número atual da linha
set number relativenumber

" Desabilitar LSP do ALE
let g:ale_disable_lsp=0

" Configurações para o ALE embelezar o código
let g:ale_fixers = {
            \   'php': [ 'phpcbf' ],
            \   'typescript': [ 'tslint' ],
            \   'sql': [ 'pgformatter' ],
            \   'javascript': [ 'eslint' ],
            \   'dart': [ 'dartfmt' ],
            \   'go': [ 'gofmt' ]
            \ }

" Desabilitar eslint para typescript, usando tslint
let g:ale_linters_ignore = {'typescript': ['eslint']}

" Embelezar o código ao salvar
let g:ale_fix_on_save=1

" Branch do git na statusbar
let g:lightline = {
            \     'active': {
            \         'left': [ ['mode', 'paste'], ['gitbranch', 'cocstatus', 'method', 'readonly', 'absolutepath', 'modified'] ]
            \ },
            \     'component_function': {
            \         'gitbranch': 'fugitive#head',
            \         'cocstatus': 'coc#status'
            \     }
            \ }

" Quem o vista vai usar como padrão
let g:vista_default_executive = 'coc'

" Quais fontes o vista vai utilizar
let g:vista#executives = ['coc']

" Haiblitar símbolos no vista
let g:vista#renderer#enable_icon = 1

" Extensões do coc
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-flutter',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-phpls',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-xml',
            \ 'coc-yaml',
            \ ]

" Mapemamento de arquivos do coc
let g:coc_filetype_map = {
            \ 'html.twig': 'html',
            \ }

" Configuração do which-key
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey '\\'<CR>

" Dicionário do which-key
let g:which_key_map = {}
let g:which_key_map[','] = '"," no fim da linha'
let g:which_key_map[';'] = '";" no fim da linha'
let g:which_key_map['<Tab>'] = 'Alterar para arquivo anterior'
let g:which_key_map.a = {
            \ 'name' : '+Aba',
            \ 'a' : 'Abrir uma nova',
            \ 'n' : 'Ir para a próxima (next)',
            \ 'p' : 'Ir para a anterior (previous)',
            \ 'c' : 'Fechar (close)',
            \ }
let g:which_key_map.b = {
            \ 'name' : '+Buffer',
            \ 'b' : 'Listar abertos',
            \ 'd' : 'Deletar',
            \ 's' : 'Salvar',
            \ 'a' : 'Selecionar tudo (all)',
            \ }
let g:which_key_map.c = {
            \ 'name' : '+Coc',
            \ 'o' : 'Buscar símbolos',
            \ 'r' : 'Renomear Variável',
            \ 's' : 'Salvar',
            \ }
let g:which_key_map.d = {
            \ 'name' : '+Debug',
            \ 'b' : 'Adicionar breakpoint',
            \ 'r' : 'Executar (run) o modo debug',
            \ 's' : 'Parar (stop) o modo debug',
            \ }
let g:which_key_map.g = {
            \ 'name' : '+Git',
            \ 'b' : 'Blame',
            \ 'c' : 'Commit',
            \ 'g' : 'Log',
            \ 'l' : 'Pull',
            \ 'p' : 'Push',
            \ 's' : 'Status',
            \ 'w' : 'Salvar e adicionar ao stage',
            \ }
let g:which_key_map.h = 'dividir-tela-horizontalmente'
let g:which_key_map.i = 'indentar-arquivo'
let g:which_key_map.l = 'alternar-locationlist'
let g:which_key_map.o = {
            \ 'name' : '+Abrir arquivos do vim',
            \ 'v' : 'Abrir .vimrc',
            \ 'b' : 'Abrir .vimrc.bundles',
            \ 'm' : 'Abrir .myvimrc',
            \ 'u' : 'Abrir .myvimrc.bundles',
            \ 's' : 'Atualizar (source) configurações do vim',
            \ }
let g:which_key_map.p = {
            \ 'name' : '+Projeto',
            \ 'f' : 'Buscar (find) arquivo',
            \ 's' : 'Procurar (search) nos arquivos',
            \ 't' : 'Gerar arquivo de tags',
            \ }
let g:which_key_map.q = 'alternar-quickfix'
let g:which_key_map.s = {
            \ 'name' : '+Sessão',
            \ 'c' : 'Fechar (close)',
            \ 'd' : 'Deletar',
            \ 'o' : 'Abrir',
            \ 's' : 'Salvar',
            \ }
let g:which_key_map.t = {
            \ 'name' : '+Terminal',
            \ 'h' : 'Abrir horizontalmente',
            \ 'v' : 'Abrir verticalmente',
            \ }
let g:which_key_map.v = 'dividir-tela-verticalmente'
let g:which_key_map.w = {
            \ 'name' : '+Window/Wiki',
            \ 'c' : 'Fechar janela',
            \ }

" Diminuir o tempo para mostrar o which-key (Default: 1000)
set timeoutlen=500

" Tema do gruvbox
colorscheme gruvbox

" Sobrescrevendo cor do quick-scope porque ela some no tema do vscode
highlight QuickScopePrimary guifg='#7a7608'
highlight QuickScopeSecondary guifg='#e27bed'

" Realçar linha onde o cursor está
set cursorline

" Melhora as cores, se tiver suporte
if (has("termguicolors"))
    set termguicolors
endif

" Validar xml com o nsjusecase.xsd
let g:ale_xml_xmllint_options = "--noout --schema vendor/nasajon/mdatransformer/schemas/nsjusecase.xsd %"

" Usar o emmet apenas no modo visual ou no modo inserção
let g:user_emmet_mode='iv'

" Diretórios à ignorar ao procurar arquivos
let Grep_Skip_Dirs = '.git node_modules cache elm-stuff'

" Comando do fzf
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'app/cache/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" Se o rg está instalado usar outro comando para o FZF
if executable('rg')
    let ignored_files = '--glob "!.git/*" --glob "!node_modules/*" --glob "!app/cache/*" --glob "!app/logs/*" --glob "!web/uploads/*" --glob "!web/bundles/*" --glob "!tags" --glob "!web/css/*" --glob "!web/js/*" --glob "!var/logs/*" --glob "!var/cache/*" --glob "!elm-stuff/*"'
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore --follow '.ignored_files
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --no-ignore --follow '.ignored_files.' --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Pasta para snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Impedir que caracteres sejam escondidos em arquivos markdown
let g:indentLine_fileTypeExclude = ['markdown']

" Impedir que o indentline funcione no terminal
let g:indentLine_bufTypeExclude = ['terminal']

" Variáveis usadas para reutilizar o terminal
let s:monkey_terminal_window = -1
let s:monkey_terminal_buffer = -1
let s:monkey_terminal_job_id = -1

" Não redimensionar janelas abertas ao abrir ou fechar janelas
set noequalalways

" Espaço maior para mensagens
set cmdheight=2

" Diminuir tempo de atualização
set updatetime=300

" Não passar as mensagems para o |ins-completion-menu|
set shortmess+=c

" Deixar a coluna de sinais sempre aberta
set signcolumn=yes

"*****************************************************************************
"" Comandos
"*****************************************************************************

" Fechar todos os outros buffers
command! Bdall %bd|e#|bd#

" Cor de fundo transparente
command! Transparent hi Normal guibg=NONE ctermbg=NONE

"*****************************************************************************
"" Configurações visuais
"*****************************************************************************

set t_Co=256
set guioptions=egmrti

let g:CSApprox_loaded = 1
if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
else
    if $TERM == 'xterm' && has('vim')
        set term=xterm-256color
    endif
endif

if &term =~ '256color'
    set t_ut=
endif

"*****************************************************************************
"" Funções
"*****************************************************************************
if !exists('*s:setupWrapping')
    function s:setupWrapping()
        set wrap
        set wm=2
        set textwidth=79
    endfunction
endif

" Função para alterar o quickfix
function! QFixToggle()
    if exists("g:qfix_win")
        cclose
        unlet g:qfix_win
    else
        botright copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

" Função para alterar o quickfix
function! LListToggle()
    if exists("g:llist_win")
        lclose
        unlet g:llist_win
    else
        lopen 10
        let g:llist_win = bufnr("$")
    endif
endfunction

" Função para pegar a branch atual
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

" Reutilizar o mesmo terminal
function! MonkeyTerminalOpen(location)
    let l:position = 'L'
    let l:resize = "vertical resize 70"
    if (a:location == 'bottom')
        let l:position = 'J'
        let l:resize = "resize 15"
    endif
    " Check if buffer exists, if not create a window and a buffer
    if !bufexists(s:monkey_terminal_buffer)
        " Creates a window call monkey_terminal
        new monkey_terminal
        " Moves to the window the right the current one
        :exe "wincmd" l:position
        :exe l:resize
        let s:monkey_terminal_job_id = termopen($SHELL, { 'detach': 1 })

        " Change the name of the buffer to "Terminal 1"
        silent file Terminal\ 1
        " Gets the id of the terminal window
        let s:monkey_terminal_window = win_getid()
        let s:monkey_terminal_buffer = bufnr('%')

        " The buffer of the terminal won't appear in the list of the buffers
        " when calling :buffers command
        set nobuflisted
    elseif !win_gotoid(s:monkey_terminal_window)
        sp
        " Moves to the window below the current one
        :exe "wincmd" l:position
        :exe l:resize
        buffer Terminal\ 1
        " Gets the id of the terminal window
        let s:monkey_terminal_window = win_getid()
    endif
    norm i
endfunction

function! MonkeyTerminalToggle(location)
    if win_gotoid(s:monkey_terminal_window)
        call MonkeyTerminalClose()
    else
        call MonkeyTerminalOpen(a:location)
    endif
endfunction

function! MonkeyTerminalClose()
    if win_gotoid(s:monkey_terminal_window)
        " close the current window
        hide
    endif
endfunction
"*****************************************************************************
"" Comandos automáticos
"*****************************************************************************

" Guardar posição do cursor
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Identação no javascript
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

" Identação no Dart
augroup vimrc-dart
    autocmd!
    autocmd FileType dart set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" Corrigir sintaxe nos arquivos .vue
augroup vue-syntax
    autocmd!
    autocmd FileType vue syntax sync fromstart
augroup END

" Configuração de comentário para twig
augroup twig-comment
    autocmd!
    autocmd FileType html.twig setlocal commentstring={#\ %s\ #}
augroup END

" Sempre que entrar na janela de quickfix retirar o mapeamento customizado do Enter
augroup enable-cr-quickfix
    " In the quickfix window, <CR> is used to jump to the error under the cursor, so undefine the mapping there.
    autocmd!
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" Abrir todos os foldings quando entrar em um arquivo
" augroup openfold
"     autocmd!
"     autocmd BufEnter,FocusGained * norm zR
" augroup END

" Ativa o número da linha relativo apenas quando o buffer estiver em foco e no normal mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Desabilita conceal (esconder textos) em arquivos markdown
augroup markdown-noindent
    autocmd!
    autocmd FileType markdown setlocal conceallevel=0
augroup END

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Formata o arquivo ao salvar
" augroup format-on-save
"     autocmd!
"     autocmd BufWrite * silent! lua vim.lsp.buf.formatting_sync(nil, 1000)
" augroup END

augroup coc-cursorhold
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup coc-update-lighline
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END

"*****************************************************************************
"" Mapeamentos
"*****************************************************************************

" Ir para modo normal no terminal de forma rapida
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>

" Navegar pelo histórico de comando levando em consideração o que foi digitado
cnoremap <C-k> <up>
cnoremap <C-j> <down>

" Mover no modo insert sem as setas
inoremap <C-b> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

lua <<EOF

-- require'nvim_lsp'.elmls.setup{
--     cmd = { "/home/massolari/.yarn/bin/elm-language-server" },
--     settings = {
--         elmFormatPath = "/home/massolari/.yarn/bin/elm-format",
--         elmPath = "/home/massolari/.yarn/bin/elm",
--         elmTestPath = "/home/massolari/.yarn/bin/elm-test"
--     }
-- }

-- require'nvim_lsp'.jsonls.setup{}
-- require'nvim_lsp'.tsserver.setup{}
-- require'nvim_lsp'.vimls.setup{}
-- require'nvim_lsp'.yamlls.setup{}


EOF

" set omnifunc=v:lua.vim.lsp.omnifunc

" Mapeamentos do coc
" Abrir menu de ações disponívels
nnoremap <silent> <leader>ca :call CocActionAsync('codeAction', '')<cr>
" nmap <silent> <leader>ca <Plug>(coc-codeaction)
" nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>

" Abrir outline (ir para função/método) do coc
nnoremap <silent> <leader>co :<C-u>CocList outline<cr>
" nnoremap <silent> <leader>co <cmd>lua vim.lsp.buf.document_symbol()<cr>

" Renomear variaveis
nmap <silent> <leader>cr <Plug>(coc-rename)
" nmap <silent> <leader>cr <cmd>lua vim.lsp.buf.rename()<CR>

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> <leader>cdp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cdn <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>

nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>

nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent> <c-space> 
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction

" Scrollar na floatwindow
nnoremap <expr><C-f> coc#float#has_float() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_float() ? coc#float#scroll(0) : "\<C-b>"

" Gerencias sessões
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Git
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gg :Glog<CR>
nnoremap <leader>ghu :GitGutterUndoHunk<CR>
nnoremap <leader>ghp :GitGutterPreviewHunk<CR>
nnoremap <leader>ghn :GitGutterNextHunk<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gw :Gwrite<CR>

" Dividir a tela mais rapidamente
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Abrir terminal em tela dividida
" nnoremap <leader>th :below split +te<CR>
nnoremap <leader>th :call MonkeyTerminalToggle('bottom')<CR>
nnoremap <leader>tv :call MonkeyTerminalToggle('right')<CR>

" Toda a vez que pular para próxima palavra buscada o cursor fica no centro da tela
nnoremap n nzzzv
nnoremap N Nzzzv

" Abrir NERDTree com F3
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeFind<CR>

" Ir para o normal mode mais rapidamente
imap jk <Esc>
imap kj <Esc>

" Abrir uma nova aba
nnoremap <leader>aa :tabnew<CR>

" Ir para a aba seguinte
nnoremap <leader>an :tabnext<CR>

" Ir para a aba anterior
nnoremap <leader>ap :tabprevious<CR>

" Fechar a aba
nnoremap <leader>ac :tabclose<CR>

" Selecionar todo o arquivo
nnoremap <leader>ba ggVG

" Abrir arquivo na lista de buffers
nnoremap <silent> <leader>bb :Buffers<CR>

" Fechar buffer atual
noremap <leader>bd :bp\|bd #<CR>

" Salvar buffer
nnoremap <leader>bs :w<CR>

" Procurar arquivo na pasta atual
nnoremap <silent> <leader>pf :FZF -m<CR>

" Procurar nos arquivos
nnoremap <leader>ps :Find 

" Fechar janela
nnoremap <leader>wc :q<CR>

" Mover bloco de código selecionado
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Manter seleção após indentar código no modo visual
vmap < <gv
vmap > >gv

" Mover cursor para outra janela divida
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Limpar seleção da pesquisa
nnoremap <silent> <leader><leader> :noh<cr>

" Alterar de arquivo mais rapidamente
nnoremap <silent> <leader><Tab> 

" Limpar espaços em branco nos finais da linha
nnoremap <F5> mp:%s/\s\+$/<CR>`p

" Buscar o que está visualmente selecionado pressionando //
vnoremap // y/<C-R>"<CR>

" Enter no modo normal funciona como no modo inserção
nnoremap <CR> i<CR><Esc>

" Identar arquivo
nnoremap <leader>i mpgg=G`p

" Chamar função que alterna o quickfix
nnoremap <leader>q :call QFixToggle()<CR>

" Setas redimensionam janelas adjacentes
nnoremap <left> :vertical resize -5<cr>
nnoremap <right> :vertical resize +5<cr>
nnoremap <up> :resize -5<cr>
nnoremap <down> :resize +5<cr>

" Ponto e vírgula no final da linha
noremap <leader>; mpA;<Esc>`p

" Vírgula no final da linha
noremap <leader>, mpA,<Esc>`p

" Abrir configurações do vim
nnoremap <leader>ov :e ~/.vimrc<CR>

" Abrir configurações do vim personalizadas
nnoremap <leader>om :e ~/.vim/.myvimrc<CR>

" Abrir configurações de plugins do vim
nnoremap <leader>ob :e ~/.vimrc.bundles<CR>

" Abrir configurações de plugins do vim
nnoremap <leader>ou :e ~/.vim/.myvimrc.bundles<CR>

" Atualizar configurações do nvim
nnoremap <leader>os :source ~/.config/nvim/init.vim<CR>

" Alterar locationlist
nnoremap <leader>l :call LListToggle()<CR>

" Mapeamento para listas
" Abrir lista
" nnoremap <leader>lo :vert botright 45split ~/vimwiki/index.wiki<CR>

" Inserir data de hoje
" nnoremap <leader>ldn :r !date +\%d/\%b/\%Y\(\%Y\-\%m\-\%d\)\ \(\%A\)<CR>

" Inserir data de amanhã
" nnoremap <leader>ldt :r !date +\%d/\%b/\%Y\(\%Y\-\%m\-\%d\)\ \(\%A\) --date='tomorrow'<CR>

" Pular para a próxima função do Elm
nnoremap ]] :call search('^\w\+\s:\s', 'w')<CR>
nnoremap [[ :call search('^\w\+\s:\s', 'bW')<CR>

"*****************************************************************************
"" Source do arquivo do usuário
"*****************************************************************************

" Arquivo de configurações do usuário
if filereadable(expand("~/.vim/.myvimrc"))
    source ~/.vim/.myvimrc
endif
