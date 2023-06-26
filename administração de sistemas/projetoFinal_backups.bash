                 
#!/bin/bash
#Feito por:
#Alisson Gabriel dos Santos
#Leonardo Felipe Salgado
#Raul Ferreira Bana

Menu(){
echo
locali=$1
user=$2
echo "Local: $locali"
pasta=(`ls /home/$user`)
echo "Arquivos: ${pasta[@]}"
echo "O que você deseja fazer?"
echo "1 - Selecionar arquivos para backup"
echo "2 - Navegar entre as pastas"
echo "3 - sair"
read action
case $action in
 1) echo "Você escolheu 1";;
 2) echo "Você escolheu 2";;
 3) exit;;
 *) Menu $1 $2;; 
esac
}

Principal(){
echo "Projeto Final - Sistema de Backup de Arquivos"
locali=`pwd`
user=`id -un`
Menu $locali $user
}

Principal

