# InstallVeins_5.0

## Instruções ![status](https://img.shields.io/readthedocs/pip.svg)

### Requisitos

```
* GNU/Linux Ubuntu Minimal/Core 18.04;
* 4 GB de RAM;
* 2 núcleos dedicados de processador se virtualização for utilizada.
```
### Versão dos softwares instalados

* SUMO 1.2.0
* OMNeT++ 5.5.1
* Veins 5.0

### Execução do Script

1. Entrar no diretório de Downloads

`$ cd $HOME/Downloads`

2. Instalar o Git

`$ sudo apt-get install -y git`

3. Fazer o download do repositório

`$ git clone https://github.com/cairoapcampos/InstallVeins_5.0.git`

4. Entar no diretório que possui o script de instalação

`$ cd InstallVeins_5.0`

5. Dar permissão de execução no script

`$ sudo chmod +x Install_VEINS.sh`

6. Executar o Script

`$ ./Install_VEINS.sh`

### Testando o ambiente

#### OMNET++

Para testar, pode-se utilizar os exemplos de simulação presentes do diretório samples do OMNET++. Abaixo testamos a simulação dyna:

1.Entrando no diretório:

`$ cd $HOME/src/omnetpp-5.3/samples/dyna`

2. Execução:

`$ ./dyna`

Obs: Por padrão, as amostras serão executadas usando as bibliotecas gráficas Tcl/Tk.

Após a instalação, para iniciar o OMNET++ via terminal, deve se abrir um novo terminal para que a variavél $PATH seja recarregada. Para iniciar o programa basta digitar o comando:

`$ omnetpp`

#### Habilitar numeração de linhas no OMNET++

Para facilitar a indificação de erros ao compilar e executar o código, pode-se numerar as linhas do editor do OMNET++ com os passos seguintes:

1. Na barra de menu, "Window" -> "Preferences...
2. Em "General" -> "Editors" -> "Text Editors", clique na caixa de seleção "Show line numbers".

#### SUMO

1.Para testar o SUMO, entrar no diretório examples do VEINS:

`cd $HOME/src/veins/examples/veins`

2.Executar os comandos: 

`sumo -c erlangen.sumo.cfg && sumo-gui -c erlangen.sumo.cfg`

Obs: Na tela aparecerá uma linha "Loading configuration... done." referente ao primeiro e ao segundo comando, em seguida aparecerá uma janela gráfica do SUMO na qual é iniciado um cronometro na simulação que vai de 0 a 1000.

#### Importar VEINS para o OMNET++

1. Para importar o projeto no OMNET++ clicar em `File > Import > General: Existing Projects into Workspace` e selecionar a pasta do VEINS descompactada no diretório src. Aguardar a importação, indicada por uma barra de progresso no canto inferior do software.

2. Para que o projeto seja construído deve-se selecionar a opção `Project > Build All`. Da mesma forma do passo anteior deve-se aguardar a construção do projeto, indicada por uma barra de progresso no canto inferior do software.

#### Teste de integração entre SUMO, Veins e OMNET++

1. Inicie o script StarProxyPort, ele irá imprimir `Listening on port 9999` e aguardará o início da simulação. Deixe está janela aberta.

2. No OMNeT ++ 5 IDE, para usar o cenário de demonstração do Veins, dentro da caixa `Project Explorer` deve-se clicar com o botão direito do mouse em `veins/examples/veins/omnetpp.ini` e escolher a opção `Run As> OMNeT ++ simulation`. 

Obs: Caso seja apresentado algum erro, o veins deve ser recompilado. Para isso, primeiro deve-se limpar a compilação anterior entrando no diretório do veins `cd $HOME/src/veins` e rodando o comando `make clean`. Posteriormente o projeto deverá ser construído novamente selecionando-se a opção `Project > Build All`.

3. Na janela que se abrir clicar em Run para executar a simulação.

#### INET Framework

Obs: Caso seja necessário usar o INET Framework, deve-se fazer o download da versão 3.6.6 no link abaixo:

https://github.com/inet-framework/inet/releases

#### Fontes:

https://veins.car2x.org/documentation/instant-veins/

http://veins.car2x.org/tutorial/

https://www.youtube.com/watch?v=qxpjHJAre3E

https://doc.omnetpp.org/omnetpp/InstallGuide.pdf

https://www.youtube.com/watch?v=yVEthJz9hLc

https://www.saltycrane.com/blog/2007/01/how-to-add-line-numbers-to-editor-in/
