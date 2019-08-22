# Guia básico do VIM

## Índice

- [Instação](#instalação)
- [Introdução](#introdução)
- [Comandos básicos para sobreviver](#comandos-básicos-para-sobreviver)
    - [Movimentos básicos](#movimentos-básicos)
    - [Abrindo arquivos](#abrindo-arquivos)

## Instalação

A maneira mais fácil de começar com o Vim no Linux é baixar o arquivo `.appimage` e executar o Vim a partir dele. 

- Acesse o link [de releases do Neovim](https://github.com/neovim/neovim/releases)
- Procure por `assets`
- Baixe o arquivo `nvim.appimage`
- Abra o terminal e navegue até onde você salvou o arquivo
- Dê permissão de execução com `chmod +x nvim.appimage`
- Mova-o para a pasta de executáveis com o comando `sudo mv nvim.appimage /usr/local/bin/nvim`

A partir de agora você pode executar o Vim, a partir do terminal, digitando `nvim`. Para utilizar as configurações desse repositório siga os passos a seguir:

- Clone esse repositório para onde achar melhor
- Abra o terminal e navegue até a pasta do repositório
- Crie um link simbólico do arquivo `.vimrc` para a sua home executando `ln -s .vimrc ~/`
- Crie um link simbólico do arquivo `.vimrc.bundles` para a sua home executando `ln -s .vimrc.bundles ~/`
- Crie um arquivo com o nome `init.vim` na pasta `~/.config/nvim/`
- Cole o código a seguir dentro desse arquivo e salve-o:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
- Abra o Vim executando `nvim` no terminal

O Vim irá instalar todos os plugins e carregar as configurações, após ele terminar (você verá escrito "Done" nas primeiras linhas) aperte `q` para ele fechar a tela de instalação plugins e reinicie o Vim executando `:q` para sair e executando-o novamente

## Introdução

O Vim não é um editor comum, que vocẽ abre e já consegue começar a trabalhar, por conta disso ele assusta muita gente no começo, porém, com o tempo, você vai perceber que editar arquivos com o Vim é mais eficiente e ele é uma ferramenta muito poderosa.

O Vim é um editor *modal*, isso significa que ele possui **modos**. Enquanto você estiver editando arquivos com o Vim você vai ficar alternando entre esses modos. De forma simplificada os modos são:

- Normal: Usado para navegar e fazer operações em arquivos (copiar, colar, deletar etc)

- Inserção: Usado para inserir texto

- Visual: Usado para selecionar texto

- Ex (ou comando): É o modo mais poderoso do Vim, pois com ele você pode fazer qualquer coisa

De forma prática, enquanto em um editor normal você digitaria um texto e, para copiar o que acabou de digitar, você o selecionaria e apertaria `Ctrl+c` para copiar, no Vim, depois de digitar, vocẽ sairia do modo de inserção para o modo normal e, sem precisar selecionar o texto (modo visual), copiaria.

Pode parecer pouco eficiente ficar trocando de modo, mas você vai perceber que esse processo vai se tornar natural e, além disso, os modos tornam possível você usar as teclas, que vocẽ usa para digitar, para fazer operações, evitando que você precise mover sua mão para longe dessas teclas.

Quando você abre o Vim ele é iniciado em modo normal, dessa forma, antes de tentar escrever alguma coisa é necessário entrar em modo de inserção. Porém, antes de falarmos sobre o modo de inserção, vamos aprender alguns comandos básicos de movimento no modo normal.

## Comandos básicos para sobreviver

### Movimentos básicos

Para começar, esqueça o mouse e as setas de movimentos! Eles ficam distantes das teclas que você usa para digitar e mover a mão para as setas ou o mouse para navegar pelo arquivo não é eficiente. Logo, em vez de usar as setas de movimentos, vocẽ vai usar as seguintes teclas, para se mover nas direções:

- Para direita: `l`
- Para esquerda: `h`
- Para cima: `k`
- Para baixo: `j`

Você pode achar *estranho* no começo, mas, como tudo que é novo, você vai se acostumar e vai se tornar memória muscular. Apenas não lute contra isso, tente se acostumar.

Enquanto em outros editores é normal vocẽ usar as setas para se mover para todo lugar (claro, além de usar o mouse), no Vim nós temos muitas outras opções. Sendo que as que você precisa saber agora são:

- `w` (word): Move para o início da palavra seguinte
- `e` (end): Move para o final da palavra
- `b` (back): Move para o início da palavra anterior

Agora, digamos que você precisa navegar por um arquivo grande, você precisa desses comandos:

- `<Ctrl>u`: Movimenta meia página para cima
- `<Ctrl>d`: Movimenta meia página para baixo
- `<Ctrl>y`: Movimenta uma linha para cima
- `<Ctrl>e`: Movimenta uma linha para baixo

### Abrindo arquivos

Com as configurações que eu tenho nesse repositório vocẽ vai ter alguns plugins que deixam o Vim mais poderoso. Um desses plugins é o NERDTree, que, nada mais é, do que aquela barra de arquivos, geralmente do lado esquerdo, que vocẽ encontra em outros editores.

- `F3`: Para abrir ou fechar o NERDTree
- `o`: Abre o arquivo, abre ou fecha a pasta sob o cursor
- `m`: Abre o menu de operações para o arquivo ou pasta sob o cursor

Apenas use o NERDTree caso você precise ver a estrutura de pastas do projeto ou precise abrir algum arquivo que você não sabe o nome, caos contrário, nós temos outra opção mais rápida e eficiente, o FZF.

O FZF é um buscador bem rápido, com ele você pode buscar arquivos a partir da pasta atual.

- `<Space>pf` (Project find): Abre a busca de arquivos
- `<Space>bb`: Lista os *buffers* abertos. Buffers são arquivos abertos em memória, ou seja, são os arquivos que você abriu

Na busca do FZF, para navegar entre os arquivos use `<Ctrl>p` (para cima) e `<Ctrl>n` (para baixo), para abrir o arquivo utilize `<Enter>` ou `<Ctrl>m`

Você pode ter reparado que esses últimos comandos começam com `<Space>`, esses comandos fazem parte da configuração do Vim deste repositório e você pode, de maneira fácil, ver alguns desses atalhos apenas apertando `<Space>`, após aguardar uns segundos uma janela irá abrir com os comandos disponíveis.
