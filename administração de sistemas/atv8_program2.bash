#!/bin/bash
#Feito por Leonardo Felipe Salgado

Subtract() {
 clear
 echo "Digite o primeiro número: "
 read n1
 echo "Digite o segundo número: "
 read n2
 echo "Você vai subtrair $n1 de $n2"
 val=$(($n1-$n2))
 echo $val
 Principal
}

Principal(){
 echo "Você deseja fazer uma subtração? Y/N"
 read decision
 case $decision in
  "Y")  Subtract;;
  "N") exit;;
 esac
}

Principal
