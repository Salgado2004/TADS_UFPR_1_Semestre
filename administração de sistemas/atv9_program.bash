#!/bin/bash
#Feito por Leonardo Felipe Salgado

For(){
 clear
 echo "Laço For -> "
 echo
 echo "Estrutura: "
 echo "for ((i=1; i<=5; i++));"
 echo "do"
 echo '   echo "$i"'
 echo "done"
 echo
 echo "Execução: "
 for ((i=1; i<=5; i++));
 do
  echo "$i"
 done
 echo
 echo "Explicação: "
 echo "No laço For, o contador de repetições, a condição e a atualização do contador são feitos na mesma linha. "
 echo "Deseja ver outro laço? S/N"
 read decision2
 case $decision2 in
  "S") Principal;;
  "N") exit;;
 esac
}

While(){
clear
 echo "Laço While -> "
 echo
 echo "Estrutura: "
 echo "i=1"
 echo 'while [ $i -lt 5 ];'
 echo "do"
 echo '   echo "$i"'
 echo '   i=$((i + 1))'
 echo "done"
 echo
 echo "Execução: "
 i=1
 while [ $i -lt 5 ];
 do
  echo "$i"
  i=$((i + 1 ))
 done
 echo
 echo "Explicação: "
 echo "No laço While, é necessário criar primeiro uma variável para ser o contador, depois no laço estabelecer uma condição que deve ser verdadeira para que haja repetição e dentro da repetição atualizar o contador. Ou seja, quando i for igual a 5, ele ainda faz parte da condição e será repetido mais uma vez, virando 6 e saindo da condição"
 echo "Deseja ver outro laço? S/N"
 read decision2
 case $decision2 in
  "S") Principal;;
  "N") exit;;
 esac
}

Until(){
clear
 echo "Laço Until -> "
 echo
 echo "Estrutura: "
 echo "i=1"
 echo "Until [ $i == 5 ];"
 echo "do"
 echo '   echo "$i"'
 echo '   i=$((i + 1))'
 echo "done"
 echo
 echo "Execução: "
 i=1
 until [ $i == 5 ];
 do
  echo "$i"
  i=$((i + 1 ))
 done
 echo
 echo "Explicação: "
 echo "No laço Until, parecido com o While, é necessário criar uma variável contador, criar a condição no laço e dentro da repetição atualizar o contador. A diferença é que no Until a repetição só ocorre até que a condição seja atendida. No momento que ela vira verdadeira a repetição para"
 echo "Deseja ver outro laço? S/N"
 read decision2
 case $decision2 in
  "S") Principal;;
  "N") exit;;
 esac
}

Principal(){
echo "Laços de repetição: For(1), While(2), e Until(3)"
echo
echo "Escolha um para ver sobre: "
read decision
case $decision in
 1) For;;
 2) While;;
 3) Until;;
 *) echo "Opção escolhida inválida";;
esac
}

Principal
