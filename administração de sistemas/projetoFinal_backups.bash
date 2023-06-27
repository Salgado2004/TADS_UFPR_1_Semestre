#!/bin/bash
#Feito por:
#Alisson Gabriel dos Santos
#Leonardo Felipe Salgado
#Raul Ferreira Bana

Navegar(){ #Permite ao usuário navegar e visualizar as pastas e arquivos
locali=$1
user=$2
file=($@)
echo "Navegar entre as pastas: " #Explica como funciona
echo "Selecione o índice da pasta que deseja entrar"
echo "Ou digite 00 para voltar"
read nav
if [ $nav = "00" ]; then #Se ele desejar voltar, o sistema modifica sozinho o local
 nav=(${locali//"/"/ })
 lenght=${#nav[@]}
 echo $lenght
 locali=""
 for ((i=0;i<$lenght-1;i++)); do
 locali=$locali/${nav[i]}
 done
else #Se ele desejar avançar, o sistema busca a pasta escolhida pelo indice e atualiza o local
 nav=$((nav + 2))
 locali=$locali"/"${file[nav]}
fi
Menu $locali $2 #Chama o menu novamente
}

Menu(){
clear
echo
locali=$1
user=$2
echo "Local: $locali"
pasta=(`ls $locali`) #Recebe os arquivos da pasta atual

cont=0 #Cria um contador de índices
echo -n "Arquivos: "
for file in ${pasta[@]}; do #Mostra os arquivos um por um
 typeF=(`file $locali/$file`)
 case ${typeF[1]} in
 "directory")  echo -n -e "\033[01;32m$file\033[00;37m($cont)  ";; #Formata em negrito as pastas
 "Bourne-Again") echo -n -e "\033[01;31m$file\033[00;37m($cont)  ";;
 "Unicode") echo -n -e "\033[00;34m$file\033[00;37m($cont)  ";;
 *) echo -n "$file($cont)  ";; #Formata normal os arquivos
 esac
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
