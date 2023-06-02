#!/bin/bash
#Feito por Leonardo Felipe Salgado

Soma(){
 clear
 echo "Você escolheu soma"
 echo "Digite o primeiro número: "
 read n1
 echo "Digite o segundo número: "
 read n2
 echo "Você vai soma $n1 e $n2"
 val=`echo $n1 + $n2 | bc`
 echo $val
 Principal
}

Subtract() {
 clear
 echo "Você escolheu subtração"
 echo "Digite o primeiro número: "
 read n1
 echo "Digite o segundo número: "
 read n2
 echo "Você vai subtrair $n2 de $n1"
 val=`echo $n1 - $n2 | bc`
 echo $val
 Principal
}

Principal(){
 echo "Digite 1 para soma, 2 para subtração e 3 para sair"
 read decision
 case $decision in
  1) Soma;;
  2) Subtract;;
  3) exit;;
 esac
}

Principal
