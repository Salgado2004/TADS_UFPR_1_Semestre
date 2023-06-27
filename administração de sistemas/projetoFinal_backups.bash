#!/bin/bash
#Feito por:
#Alisson Gabriel dos Santos
#Leonardo Felipe Salgado
#Raul Ferreira Bana

Realizar_backup(){
 clear
 echo -e "\033[01;37mRealizar backup\033[00;37m"
 echo
 echo "Arquivos para backup: ${origem[@]}"
 echo "Pasta de destino: $destino"
 for file in ${origem[@]}; do
  rsync -avz --progress $file $destino
 done
 echo
 echo -e "\033[05mBackup realizado!\033[00m"
 read enter
 Menu $locali $user
}

Criar_pasta(){ #Permite ao usuário criar uma pasta de destino
 echo "Criar pasta: " 
 echo "Digite o nome que você deseja dar para a pasta"
 read nome
 echo `mkdir $locali/$nome`
 destino="$locali/$nome"
 if [ ${#origem[@]} -gt 0 ]; then #Se os arquivos de origem já tiverem sido selecionados, chama a função de backup
  Realizar_backup
 else
  Menu $locali $user #Chama o menu novamente
 fi
}

Selecionar_destino(){ #Permite ao usuário selecionar a pasta de destino
 files=($@)
 echo
 echo "Você escolheu selecionar destino"
 echo "Digite o índice da pasta desejada e aperte ENTER para confirmar"
 read indice #Lê a pasta
 typeF=(`file $locali"/"${files[indice]}`)
 if [ ${typeF[1]} = "directory" ]; then #Verifica se o indice escolhido é uma pasta 
  destino="$locali/${files[indice]}"
  if [ ${#origem[@]} -gt 0 ]; then #Se os arquivos de origem já tiverem sido selecionados, chama a função de backup
   Realizar_backup
  else
   Menu $locali $user #Chama o menu novamente
  fi
 else
  echo "O arquivo escolhido não é um diretório!" #Se não for, não seleciona
  echo "Aperte ENTER para continuar"
  read enter
  Menu $locali $user #Chama o menu novamente
 fi 
}

Selecionar_origem(){ #Permite ao usuário selecionar os arquivos de origem 
 files=($@)
 echo
 echo "Você escolheu selecionar origem"
 echo "Digite os índices dos arquivos e/ou pastas desejados, separados por espaço ' ', e aperte ENTER para confirmar"
 read indices #Lê os arquivos
 indices=($indices) #Transforma em vetor
 for indice in ${indices[@]}; do
  origem=(${origem[@]} "$locali/${files[indice]}")
 done
 if [ ${#destino[@]} -gt 0 ]; then
  Realizar_backup
 else
  Menu $locali $user #Chama o menu novamente
 fi
}

Selecionar_arquivos(){ #Permite ao usuário selecionar os arquivos de origem e/ou destino
 files=($@)
 echo "Selecionar arquivos para backup: " #Explica como funciona
 echo "1 - Selecionar arquivos de origem"
 echo "2 - Selecionar pasta de destino"
 read opt
 case $opt in
  1) Selecionar_origem ${files[@]};;
  2) Selecionar_destino ${files[@]};;
  *) Selecionar_arquivos ${files[@]};;
 esac
}

Navegar(){ #Permite ao usuário navegar e visualizar as pastas e arquivos
 file=($@)
 echo "Navegar entre as pastas: " #Explica como funciona
 echo "Selecione o índice da pasta que deseja entrar"
 echo "Ou digite 00 para voltar"
 read nav
 
 if [ $nav = "00" ]; then #Se ele desejar voltar, o sistema modifica sozinho o caminho
  nav=(${locali//"/"/ })
  lenght=${#nav[@]}
  echo $lenght
  locali=""
  for ((i=0;i<$lenght-1;i++)); do
   locali=$locali/${nav[i]}
  done
 else #Se ele desejar avançar, o sistema busca a pasta escolhida pelo indice e atualiza o caminho
  typeF=(`file $locali"/"${file[nav]}`)
  if [ ${typeF[1]} = "directory" ]; then #Verifica se o caminho escolhido é uma pasta 
   locali=$locali"/"${file[nav]}
  else
   echo "O arquivo escolhido não é um diretório!" #Se não for, não atualiza o caminho
   echo "Aperte ENTER para continuar"
   read enter
  fi
 fi
 Menu $locali $user #Chama o menu novamente
}

Menu(){ #Permite ao usuário interagir com o sistema
 clear
 echo "Projeto Final - Sistema de Backup de Arquivos"
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
   "directory")  echo -n -e "\033[01;32m$file\033[00;37m($cont)   ";; #Formata em verde e  negrito as pastas
   "Bourne-Again") echo -n -e "\033[01;31m$file\033[00;37m($cont)   ";; #Formata em vermelho os executaveis
   "Unicode") echo -n -e "\033[00;34m$file\033[00;37m($cont)   ";; #Formata em azul os .txt
   *) echo -n "$file($cont)  ";; #Formata normal os arquivos
  esac
  cont=$((cont + 1))
 done
 echo 
 echo "Arquivos selecionados: ${#origem[@]}"
 echo "Local para o backup: $destino"
 echo #Mostra opções para o usuário
 echo "O que você deseja fazer?"
 echo "1 - Selecionar arquivos para backup"
 echo "2 - Criar pasta para backup"
 echo "3 - Navegar entre as pastas"
 echo "4 - sair"
 read action
 case $action in #Vê a opção escolhida
  1) Selecionar_arquivos ${pasta[@]};;
  2) Criar_pasta;;
  3) Navegar ${pasta[@]};;
  4) exit;;
  *) Menu $1 $2;; 
 esac
}

Principal(){
 #Inicio do programa
 user=`id -un` #Lê o usuário utilizando o programa
 locali="/home/$user" #Posiciona o leitor de arquivos na pasta do usuário
 Menu $locali $user #Chama a função menu
}

Principal
