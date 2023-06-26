#!/bin/bash
#Feito por:
#Alisson Gabriel dos Santos
#Leonardo Felipe Salgado
#Raul Ferreira Bana

Navegar(){
locali=$1
user=$2
file=($@)
echo "Navegar entre as pastas: "
echo "Selecione o índice da pasta que deseja entrar"
echo "Ou digite * para voltar"
read nav
if [ $nav = "*" ]; then
 echo "volta pasta"
fi
nav=$((nav + 2))
locali=$locali"/"${file[nav]}
echo "$locali"
Menu $locali $2
}

Menu(){
echo
locali=$1
user=$2
echo "Local: $locali"
pasta=(`ls $locali`) #Recebe os arquivos da pasta atual

cont=0 #Cria um contador de índices
echo -n "Arquivos: "
for file in ${pasta[@]}; do #Mostra os arquivos um por um
 typeF=(`file $locali/$file`)
 if [ ${typeF[1]} = "directory" ]; then #Formata em negrito as pastas
  echo -n -e "\033[01;32m$file\033[00;37m($cont) "
 else
  echo -n "$file($cont) " #Formata normal os arquivos
 fi
 cont=$((cont + 1))
done

echo #Mostra opções para o usuário
echo "O que você deseja fazer?"
echo "1 - Selecionar arquivos para backup"
echo "2 - Navegar entre as pastas"
echo "3 - sair"
read action
case $action in #Vê a opção escolhida
 1) echo "Você escolheu 1";;
 2) Navegar $1 $2 ${pasta[@]};;
 3) exit;;
 *) Menu $1 $2;; 
esac
}

Principal(){
clear #Inicio do programa
echo "Projeto Final - Sistema de Backup de Arquivos"
user=`id -un` #Lê o usuário utilizando o programa
locali="/home/$user" #Posiciona o leitor de arquivos na pasta do usuário
Menu $locali $user #Chama a função menu
}

Principal
