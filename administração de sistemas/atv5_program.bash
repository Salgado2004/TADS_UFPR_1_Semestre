#!/bin/bash
#Programação Shell: variáveis
#Feito por Leonardo Felipe Salgado

Decitobinary() {
 clear
 echo "Você escolheu Decimal -> Binário"
 echo "Digite o número que você deseja converter"
 read num
 echo "obase=2; ibase=10; $num" | bc
}

Binarytodeci() {
 clear
 echo "Você escolheu Binário -> Decimal"
 echo "Digite o número que você deseja converter"
 read num
 echo "obase=10; ibase=2; $num" | bc

}

Decitohex() {
 clear
 echo "Você escolheu Decimal -> Hexadecimal"
 echo "Digite o número que você deseja converter"
 read num
 echo "obase=16; ibase=10; $num" | bc

}

Hextodeci() {
 clear
 echo "Você escolheu Hexadecimal -> Decimal"
 echo "Digite o número que você deseja converter"
 read num
 echo "obase=10; ibase=16; $num" | bc

}

Binarytohex() {
  clear
 echo "Você escolheu Binário -> Hexadecimal"
 echo "Digite o número que você deseja converter"
 read num
 echo "obase=16; ibase=2; $num" | bc
}

Hextobinary() {
 clear
 echo "Você escolheu Hexadecimal -> Binário"
 echo "Digite o número que você deseja converter"
 read num
 echo "obase=2; ibase=16; $num" | bc
}

echo "Conversão de sistemas numéricos! :D"
echo "|----------------------------|"
echo "| Escolha conversão:         |"
echo "| 1 - Decimal -> Binário     |"
echo "| 2 - Binário -> Decimal     |"
echo "| 3 - Decimal -> Hexadecimal |"
echo "| 4 - Hexadecimal -> Decimal |"
echo "| 5 - Binário -> Hexadecimal |"
echo "| 6 - Hexadecimal -> Binário |"
echo "|----------------------------|"
read conversao
case $conversao in
1) Decitobinary;;
2) Binarytodeci;;
3) Decitohex;;
4) Hextodeci;;
5) Binarytohex;;
6) Hextobinary;;
*) echo "Escolha uma opção válida!!";;
esac
