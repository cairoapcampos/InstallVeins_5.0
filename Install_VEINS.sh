#!/bin/bash

######################################################
# Script de Instalação do VEINS                      #
# Versão: 1.0                                        #
# Autor: Cairo Ap. Campos                            #
######################################################

clear

version=$(cat /etc/lsb-release | grep DISTRIB_RELEASE | cut -f 2 -d=)

# Instala compiladores e bibliotecas
echo
echo "############################################################"
echo "###  Instalando compiladores e bibliotecas necessários   ###"
echo "############################################################"
sleep 3
if [ $version = "18.04" ]
then
    echo
    echo "Você está usando o GNU/Linux Ubuntu 18.04"
    echo 
    sleep 5
    sudo apt update
else
    echo
    echo "Você está usando um sistema operacional que não foi homologado para a instalação!"
    echo
    sleep 5
    exit
fi

echo
echo "Instalando pacotes para o sistema homologado: "
echo
sleep 3
sudo apt install -y gdal-bin libgdal-dev build-essential gcc g++ bison flex perl tcl-dev tk-dev blt libxml2-dev zlib1g-dev default-jre \
doxygen graphviz libwebkitgtk-1.0-0 openmpi-bin libopenmpi-dev libpcap-dev autoconf automake libtool libproj-dev \
libfox-1.6-dev libxerces-c-dev qt4-dev-tools python python3 qt5-default libqt5opengl5-dev default-jre \
openscenegraph-plugin-osgearth libosgearth-dev

clear

echo
echo "Criando os diretórios: $HOME/src e $HOME/workspace.omnetpp"
echo
sleep 3
mkdir $HOME/src $HOME/workspace.omnetpp
clear

echo
cd $HOME/src
# Adicionar repositório do SUMO e instalá-lo
echo "######################################"
echo "###        Instalando o SUMO       ###"
echo "######################################"
echo
echo "Baixando arquivo para a instalação: "
sleep 3
echo
wget -c https://ufpr.dl.sourceforge.net/project/sumo/sumo/version%201.2.0/sumo-all-1.2.0.tar.gz
echo
echo "Descompactando arquivo baixado: "
sleep 3
echo
tar -vzxf sumo-all-1.2.0.tar.gz
rm sumo-all-1.2.0.tar.gz
echo
echo "Checando arquivos para a compilação do SUMO: "
sleep 3
echo
cd sumo-1.2.0
./configure
echo 
echo "Compilnado o SUMO: "
sleep 3
echo
make
echo
echo "Instalando o SUMO: "
echo
sudo make install
sleep 3
clear

echo
cd $HOME/src
# Baixar e compilar o  OMNET++
echo "######################################"
echo "###       Instalando o OMNET++     ###"
echo "######################################"
echo
echo "Baixando arquivo para a instalação: "
sleep 3
echo
wget -c http://ipfs.omnetpp.org/release/5.5.1/omnetpp-5.5.1-src-linux.tgz
echo
echo "Descompactando arquivo baixado: "
sleep 3
echo
tar -xvzf omnetpp-5.5.1-src-linux.tgz
rm omnetpp-5.5.1-src-linux.tgz
echo
# Variável adicionada temporariamente no Bash para a intalação do OMNET ++
export PATH=$PATH:$HOME/src/omnetpp-5.5.1/bin
# Variável adicionada permanentemente no Bash para iniciar o OMNET ++ ao abrir um novo terminal
echo " " >> ~/.bashrc
echo "export PATH=$PATH:$HOME/src/omnetpp-5.5.1/bin" >> ~/.bashrc
echo "export SUMO_HOME=$HOME/src/sumo/" >> ~/.bashrc
source ~/.bashrc
echo "Checando arquivos para a compilação do OMNET ++: "
sleep 3
echo
cd omnetpp-5.5.1
./configure
echo 
echo "Compilnado o OMNET ++: "
sleep 3
echo
make
echo "Adicionando atalhos do OMNET++"
echo
make install-menu-item
make install-desktop-icon
echo "Atalhos adicionados!"
sleep 3
clear

echo
cd $HOME/src
# Baixar o VEINS
echo "######################################"
echo "###        Download do VEINS       ###"
echo "######################################"
echo
wget -c https://veins.car2x.org/download/veins-5.0.zip
echo
unzip veins-5.0.zip
mv veins-veins-5.0 veins
rm veins-5.0.zip
clear

ln -s /home/veins/src/omnetpp-5.5.1 omnetpp
ln -s /home/veins/src/sumo-1.2.0 sumo

echo "Movendo icone e script de proxy VEINS"
sleep 3
cd $HOME/Downloads/Install_VEINS  
sudo mv  StartProxyPort.sh $HOME/src/veins
sudo mv  StartProxyPort.xpm $HOME/src/veins
sudo chmod +x  $HOME/src/veins/StartProxyPort.sh

# Cria atalho no menu de programas
touch StartProxyPort.desktop
echo "[Desktop Entry]" > StartProxyPort.desktop
echo "Name=StartProxyPort" >> StartProxyPort.desktop
echo "Comment=Inicia um Proxy na porta 9999" >> StartProxyPort.desktop
echo "Exec= $HOME/src/veins/StartProxyPort.sh" >> StartProxyPort.desktop
echo "Icon= $HOME/src/veins/StartProxyPort.xpm" >> StartProxyPort.desktop
echo "Terminal=true" >> StartProxyPort.desktop
echo "Type=Application" >> StartProxyPort.desktop
echo "Name[en_US]=StartProxy" >> StartProxyPort.desktop
echo "Name[pt_BR]=StartProxyPort" >> StartProxyPort.desktop
sudo mv StartProxyPort.desktop /usr/share/applications
clear

echo
echo "Instalação Finalizada :)"
echo
